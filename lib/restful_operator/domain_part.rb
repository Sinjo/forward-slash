require "net/http"

module RestfulOperator
  class DomainPart
    def initialize(part_name)
      @part_name = part_name
      @path_components = []
    end

    def method_missing(next_domain_part, *args)
      @part_name += ".#{next_domain_part.to_s}"
      self
    end

    def /(next_path_part=nil)
      if next_path_part
        @path_components << next_path_part
      end

      self
    end

    def get
      uri = URI("http://#{@part_name}/#{@path_components.map(&:__part).join("/")}")
      Net::HTTP.get(uri)
    end

    def __part
      @part_name
    end
  end
end
