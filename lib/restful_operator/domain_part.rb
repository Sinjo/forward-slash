require "net/http"

module RestfulOperator
  class DomainPart
    attr_reader :part_name

    def initialize(part_name)
      @part_name = part_name
      @path_components = []
    end

    def build
      ([part_name] + @path_components).join("/")
    end

    def /(next_path_part)
      @path_components << next_path_part.part_name
      self
    end

    def method_missing(next_domain_part, *args)
      @part_name += ".#{next_domain_part.to_s}"
      self
    end
  end
end
