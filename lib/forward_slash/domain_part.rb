require "net/http"

module ForwardSlash
  class DomainPart
    attr_reader :part

    def initialize(part)
      @part = part
    end

    def -(other)
      @part += "-#{other.part}"
      self
    end

    def /(other)
      @part += "/#{other.part}"
      self
    end

    def method_missing(next_domain_part, *args)
        @part += ".#{next_domain_part.to_s}"
      self
    end
  end
end
