#!/usr/bin/env ruby

# file: myweatherfeed.rb

require 'sps-pub'
require 'myweatherforecast'


class MyWeatherFeed
  

  def initialize(location: nil, api_key: nil, sps_host: 'sps', \
                 sps_port: 59000, feed_url: '')

    @w = MyWeatherForecast.new location, api_key: api_key
            
    @sps = SPSPub.new(address: sps_host, port: sps_port)
            
    @title = 'My weather feed for ' + \
                        (location.is_a?(Array) ? location.join(', ') :location)
    @description = 'Weather data fetched from forecast.io'    
            
    
  end
  
  def initialize_feed()
        
    @sps.notice 'notice/weather/title: ' + @title
    sleep 0.3
    @sps.notice 'notice/weather/profile: ' + @description    
    
  end
  
  def update()
    @sps.notice 'notice/weather: ' + @w.now.to_s
  end

end