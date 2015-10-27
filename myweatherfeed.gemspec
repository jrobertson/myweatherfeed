Gem::Specification.new do |s|
  s.name = 'myweatherfeed'
  s.version = '0.1.3'
  s.summary = 'Generates an RSS feed for the weather data using the myweatherforecast gem'
  s.authors = ['James Robertson']
  s.files = Dir['lib/myweatherfeed.rb']
  s.add_runtime_dependency('myweatherforecast', '~> 0.5', '>=0.5.2')
  s.add_runtime_dependency('daily_notices', '~> 0.2', '>=0.2.1')
  s.signing_key = '../privatekeys/myweatherfeed.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@r0bertson.co.uk'
  s.homepage = 'https://github.com/jrobertson/myweatherfeed'
end
