Airbrake.configure do |config|
  config.api_key = '505fa663fe5e6dfa6529414377bba08f'
  config.host    = 'errbit.hut.shefcompsci.org.uk'
  config.port    = 443
  config.secure  = config.port == 443
end
