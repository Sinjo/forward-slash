require "restful_operator"

class TestRestfulness
  include RestfulOperator

  def test
    #http://ifcon-fig.me/ip.fl-eh/meh
    http://ifconfig.me/ip
    puts @result

    https://google.com
    puts @result
  end

  def self.test
    http://ifconfig.me/ip
    puts @result

    https://google.com
    puts @result
  end
end
