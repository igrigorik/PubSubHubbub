# #--
# Copyright (C)2009 Ilya Grigorik
#
# You can redistribute this under the terms of the Ruby
# #--

module EventMachine
  class PubSubHubBub
    include EventMachine::Deferrable

    def initialize(hub)
      @hub = hub.kind_of?(URI) ? hub : URI::parse(hub)
    end

    def publish(*feeds)
      data = feeds.flatten.collect do |feed|
        {'hub.url' => feed, 'hub.mode' => 'publish'}.to_params
      end.join("&")

      r = EventMachine::HttpRequest.new(@hub).post :body => data
      r.callback { 
        if r.response_header.status == 204
          succeed r
        else
          fail r
        end
      }

      r.errback { fail }
      r
    end

  end
end

