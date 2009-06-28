$:.unshift(File.dirname(__FILE__) + '/../lib')

require "rubygems"
require "eventmachine"
require "em-http"

%w[ client ].each do |file|
  require "pubsubhubbub/#{file}"
end