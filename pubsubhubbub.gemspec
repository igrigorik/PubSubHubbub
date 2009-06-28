spec = Gem::Specification.new do |s|
  s.name = 'pubsubhubbub'
  s.version = '0.1'
  s.date = '2009-06-28'
  s.summary = 'Ruby / Asynchronous PubSubHubBub Client'
  s.description = s.summary
  s.email = 'ilya@igvita.com'
  s.homepage = "http://github.com/igrigorik/pubsubhubbub"
  s.has_rdoc = true
  s.authors = ["Ilya Grigorik"]
  s.add_dependency('eventmachine', '>= 0.12.2')
  s.rubyforge_project = "pubsubhubbub"

  # ruby -rpp -e' pp `git ls-files`.split("\n") '
  s.files = ["README.rdoc",
 "lib/pubsubhubbub.rb",
 "lib/pubsubhubbub/client.rb",
 "pubsubhubbub.gemspec",
 "test/test_client.rb"]
end
