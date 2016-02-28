require "restful_operator"

RSpec.describe RestfulOperator do
  let(:fetcher) {
    Class.new do
      include RestfulOperator

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
  let(:response) { "Hello" }

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

  context "for plain HTTP" do
    let(:url) { "http://example.com" }

    before do
      stub_request(:get, url).to_return(body: response)
    end

    include_examples "performing HTTP requests"

    context "with a hyphen" do
      let(:url) { "http://exa-mple.com" }

      include_examples "performing HTTP requests"
    end

    context "with a path after the domain" do
      let(:url) { "http://example.com/foo" }

      include_examples "performing HTTP requests"
    end
  end

  context "for HTTPS" do
    let(:url) { "https://example.com" }

    before do
      stub_request(:get, url).to_return(body: response)
    end

    include_examples "performing HTTP requests"

    context "with a hyphen" do
      let(:url) { "https://exa-mple.com" }

      include_examples "performing HTTP requests"
    end

    context "with a path after the domain" do
      let(:url) { "https://example.com/foo" }

      include_examples "performing HTTP requests"
    end
  end
end
