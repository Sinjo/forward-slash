require "restful_operator/core_ext/symbol"
require "restful_operator/domain_part"

module RestfulOperator
  def http(url)
    puts url.build
  end

  def method_missing(part_name, *args)
    DomainPart.new(part_name.to_s)
  end
end
