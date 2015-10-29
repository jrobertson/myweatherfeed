#!/usr/bin/env ruby

# file: myweatherfeed.rb

require 'daily_notices'
require 'myweatherforecast'


class MyWeatherFeed < DailyNotices

  def initialize(filepath='', location: nil, api_key: nil, \
                    url_base: '', dx_xslt: '', rss_xslt: '', refreshrate: nil)

    super(filepath, url_base: url_base, dx_xslt: dx_xslt, rss_xslt: rss_xslt)

    @api_key = api_key
    w = MyWeatherForecast.new location, api_key: api_key
    @coordinates = w.coordinates
    
    self.title = 'My weather feed for ' + \
                        (location || @w.coordinates.join(', '))
    self.description = 'Weather data fetched from forecast.io'
    
    # set the time last updated in the hidden scratch file if refreshrate set
    
    @datafile = File.join(@filepath, '.myweatherfeed')
    @refreshrate = refreshrate
    
    if refreshrate then           
      
      @h =  File.exists?(@datafile) ? Kvx.new(File.read(@datafile)).to_h : {nextrefresh: Time.now.to_s, notice: ''}

    end
    
  end

  def update()
        
    return if @refreshrate and (Time.parse(@h[:nextrefresh]) > Time.now)

    w = MyWeatherForecast.new @coordinates, api_key: @api_key
    notice = w.now.to_s

    return if notice == @h[:notice]
    
    self.add notice, uid: Time.now.strftime('%H%M')
    
    if @refreshrate then
      
      @h = {nextrefresh: (Time.now + @refreshrate * 60).to_s, notice: notice}
      File.write @datafile, Kvx.new(@h)
      
    end

  end

end