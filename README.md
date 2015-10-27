# Introducing the myweatherfeed gem

    require 'myweatherfeed'

    feed = MyWeatherFeed.new '/tmp/weather', location: 'Lochend, Edinburgh', \
                                 api_key: '465xxxxxxxxxxxxxxxxxxx6ea01cbff4', \
                                     url_base: 'http://www.jamesrobertson.eu/',\
                           dx_xslt: '/xsl/dynarex-b.xsl', rss_xslt: '/xsl/feed.xsl'
    feed.update


The above code fetches the weather forecast from forecast.io and then updates the RSS feed at *http://www.jamesrobertson.eu/weather/rss.xml*, and RSS file is created if doesn't already exist. The filepath would normally point to the webserver directory, however I set it to */tmp* for testing purposes.

## Resources

* Introducing the daily_notices gem http://www.jamesrobertson.eu/snippets/2015/oct/27/introducing-the-daily_notices-gem.html
* Introducing the MyWeatherForecast gem http://www.jamesrobertson.eu/snippets/2015/oct/22/introducing-the-myweatherforecast-gem.html

myweatherfeed gem weather forecast dailynotices
