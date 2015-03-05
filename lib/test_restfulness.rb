require "restful_operator"

class TestRestfulness
  include RestfulOperator

  def test
    page = ifconfig.me/ip
    page.get
  end
end
