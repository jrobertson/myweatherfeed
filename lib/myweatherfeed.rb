#!/usr/bin/env ruby

# file: myweatherfeed.rb

require 'daily_notices'
require 'myweatherforecast'


class MyWeatherFeed < DailyNotices

  def initialize(filepath='', location: nil, api_key: nil, \
                                     url_base: '', dx_xslt: '', rss_xslt: '')

    super(filepath, url_base: url_base, dx_xslt: dx_xslt, rss_xslt: rss_xslt)

    @w = MyWeatherForecast.new location, api_key: api_key
    self.title = 'My weather feed for ' + \
                        (location || @w.coordinates.join(', '))
    self.description = 'Weather data fetched from forecast.io'

  end

  def update()
    
    self.add @w.now.to_s

  end

end
