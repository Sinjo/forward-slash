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
        @result
      end

      def self.test_fetch(url)
        eval url
        @result
      end
    end
  }

  context "for plain HTTP" do
    before do
      stub_request(:get, "http://example.com").
        to_return(body: "Hello")
    end

    context "in instance methods" do
      it "fetches the page and saves the result" do
        expect(fetcher.new("http://example.com").test_fetch).
          to eq("Hello")
      end
    end

    context "in class methods" do
      it "fetches the page and saves the result" do
        expect(fetcher.test_fetch("http://example.com")).
          to eq("Hello")
      end
    end
  end

  context "for HTTPS" do

  end
end
