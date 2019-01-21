Gem::Specification.new do |s|
  s.name = 'spspublog_drb_client'
  s.version = '0.1.1'
  s.summary = 'Allows remote access to an SPSPub_log object using DRb'
  s.authors = ['James Robertson']
  s.files = Dir['lib/spspublog_drb_client.rb']
  s.signing_key = '../privatekeys/spspublog_drb_client.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@jamesrobertson.eu'
  s.homepage = 'https://github.com/jrobertson/spspublog_drb_client'
end
