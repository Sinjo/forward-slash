require "forward_slash"

RSpec.describe ForwardSlash do
  let(:fetcher) {
    Class.new do
      include ForwardSlash

      def initialize(url)
        @url = url
      end

      def test_fetch
        eval @url
        result
      end

      def self.test_fetch(url)
        eval url
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
