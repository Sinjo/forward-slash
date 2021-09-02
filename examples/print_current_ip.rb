$LOAD_PATH.unshift 'lib'
require "forward_slash"

class CurrentIp
  include ForwardSlash

  def self.print
    result = http://ifconfig.me/ip
    puts result
  end
end

CurrentIp.print
