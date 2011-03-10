$:.unshift(File.dirname(__FILE__) + '/../lib')

require "eventmachine"
require "em-http"
require "cgi"
require "uri"

require "pubsubhubbub/client"