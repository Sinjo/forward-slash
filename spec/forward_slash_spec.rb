require "forward_slash"

RSpec.describe ForwardSlash do
  let(:fetcher) {
    Class.new do
      include ForwardSlash

      def initialize(url)
        @url = url
      end

      def test_fetch
        # Because you can't create new instance variables when running `eval`
        # inside a method, we need to make `result` exist first
        result = nil

        # We are deliberately doing the assignment inside `eval` as that is
        # a better approximation of how users would use this library (i.e.
        # they'd have a local variable and a URL directly in their code)
        eval "result = #{@url}"

        # This is the only reasonable line of code in this method
        result
      end

      def self.test_fetch(url)
        # Same as above, but using the parameter instead of the instance
        # variable
        result = nil
        eval "result = #{url}"
        result
      end
    end
  }

  shared_examples_for "performing HTTP requests" do
    context "in instance methods" do
      it "fetches the page and saves the result" do
        expect(fetcher.new(url).test_fetch).to eq(response)
      end
    end

    context "in class methods" do
      it "fetches the page and saves the result" do
        expect(fetcher.test_fetch(url)).to eq(response)
      end
    end
  end

  shared_examples_for "different URL structures" do
    let(:url) { "#{scheme}://example.com" }

    include_examples "performing HTTP requests"

    context "with a hyphen" do
      let(:url) { "#{scheme}://exa-mple.com" }

      include_examples "performing HTTP requests"
    end

    context "with a path after the domain" do
      let(:url) { "#{scheme}://example.com/foo" }

      include_examples "performing HTTP requests"
    end
  end

  let(:response) { "Hello" }

  before do
    stub_request(:get, url).to_return(body: response)
  end

  context "for plain HTTP" do
    let(:scheme) { "http" }

    include_examples "different URL structures"
  end

  context "for HTTPS" do
    let(:scheme) { "https" }

    include_examples "different URL structures"
  end
end
