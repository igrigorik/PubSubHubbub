# TODO: need header stuffs
# ....

module EventMachine
  class PubSubHubBub
    include EventMachine::Deferrable

    def initialize(hub)
      @hub = hub.kind_of?(URI) ? hub : URI::parse(hub)
    end

    # Publish one or more URLs to a hub.

    def publish(feed)
      data = {'hub.url' => feed, 'hub.mode' => 'publish'}

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

