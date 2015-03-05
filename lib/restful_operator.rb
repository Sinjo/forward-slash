require "restful_operator/domain_part"

module RestfulOperator
  def method_missing(part_name, *args)
    DomainPart.new(part_name.to_s)
  end
end
