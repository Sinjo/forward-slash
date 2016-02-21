require "binding_of_caller"
require "restful_operator/core_ext/symbol"
require "restful_operator/domain_part"

module RestfulOperator
  def self.included(base)
    base.send(:attr_accessor, :result)

    #base.send(:require, "active_support/core_ext/class/attribute")
    #base.class_attribute(:result)

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
