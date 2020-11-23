# ForwardSlash

An HTTP client with REST literals

# Description

ForwardSlash makes REST a first-class citizen of the Ruby programming language. Rather than forcing developers to write code that makes calls to URLs over HTTP, ForwardSlash lets you drop the URL right in your code - no more worrying about what HTTP is. [This blog post](http://blog.sinjakli.co.uk/2016/04/04/forwardslash-taking-back-the-restful-operator/) explains it best.

# Getting started

Install the gem:

```
gem install forward-slash
```

Require the module:

```ruby
require 'forward_slash'
```

Then include the `ForwardSlash` module in a class you want to make HTTP calls from, and you're good to go! Here's a runnable example (taken from the `examples` folder):

```ruby
#!/usr/bin/env ruby

$LOAD_PATH.unshift 'lib'
require "bundler"
Bundler.require

class CurrentIp
  include ForwardSlash

  def self.print
    result = http://ifconfig.me/ip
    puts result
  end
end

CurrentIp.print
```

# Limitations

Anything that isn't valid Ruby syntax is unsupported, including:

  - Query strings
  - Trailing slashes on URLs

# Compatibility

The tests are run against all versions of Ruby currently supported by the core team. Anything else is unsupported.

# Should I use this?

\#yeauxleaux

![I regret nothing](https://i.imgur.com/27UuUwL.gif)
