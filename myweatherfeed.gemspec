Gem::Specification.new do |s|
  s.name = 'myweatherfeed'
  s.version = '0.2.0'
  s.summary = 'Generates an RSS feed (when used in conjunction with the mns_subscriber services) for the weather data using the myweatherforecast gem'
  s.authors = ['James Robertson']
  s.files = Dir['lib/myweatherfeed.rb']
  s.add_runtime_dependency('myweatherforecast', '~> 0.5', '>=0.5.2')
  s.add_runtime_dependency('sps-pub', '~> 0.4', '>=0.4.3')
  s.signing_key = '../privatekeys/myweatherfeed.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@r0bertson.co.uk'
  s.homepage = 'https://github.com/jrobertson/myweatherfeed'
end
