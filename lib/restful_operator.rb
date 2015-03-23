require "restful_operator/core_ext/symbol"
require "restful_operator/domain_part"

module RestfulOperator
  def http(url)
    puts url.part
  end

  def method_missing(part, *args)
    DomainPart.new(part.to_s)
  end
end
