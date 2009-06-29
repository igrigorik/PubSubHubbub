require 'rubygems'
require 'spec'
require 'eventmachine'
require 'lib/pubsubhubbub'

describe EventMachine::PubSubHubbub do

  def failed
    EventMachine.stop
    fail
  end

  it "should publish single feed to hub" do
    EventMachine.run {
      pub = EventMachine::PubSubHubbub.new('http://pubsubhubbub.appspot.com/publish').publish "http://www.test.com/"

      pub.errback { fail }
      pub.callback {
        pub.response_header.status.should == 204
        EventMachine.stop
      }
    }
  end

  it "should publish multiple feeds to hub" do
    EventMachine.run {
      feeds = ['http://www.test.com', 'http://www.test.com/2']
      pub = EventMachine::PubSubHubbub.new('http://pubsubhubbub.appspot.com/publish').publish feeds

      pub.errback { fail }
      pub.callback {
        pub.response_header.status.should == 204
        EventMachine.stop
      }
    }
  end

end