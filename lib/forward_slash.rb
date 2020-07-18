require "binding_of_caller"
require "forward_slash/core_ext/symbol"
require "forward_slash/domain_part"

module ForwardSlash
  def self.included(base)
    base.extend self
  end

  def http(url)
    Net::HTTP.get(URI("http://#{url.part}"))
  end

  def https(url)
    Net::HTTP.get(URI("https://#{url.part}"))
  end

  def method_missing(part, *args)
    DomainPart.new(part.to_s)
  end
end
