require "binding_of_caller"
require "forward_slash/core_ext/symbol"
require "forward_slash/domain_part"

module ForwardSlash
  def self.included(base)
    base.send(:attr_reader, :result)
    base.define_singleton_method(:result) do
      @result
    end

    base.extend self
  end

  def http(url)
    result = Net::HTTP.get(URI("http://#{url.part}"))
    calling_object = binding.of_caller(1).receiver
    calling_object.instance_variable_set(:@result, result)
  end

  def https(url)
    result = Net::HTTP.get(URI("https://#{url.part}"))
    calling_object = binding.of_caller(1).receiver
    calling_object.instance_variable_set(:@result, result)
  end

  def method_missing(part, *args)
    DomainPart.new(part.to_s)
  end
end
