# What's new in the myweatherfeed gem version 0.1.1

The myweatherfeed gem now features a refresh rate which is set from the intialize method as a named argument called *refreshrate* and is expressed in minutes e.g.

    require 'myweatherfeed'

    feed = MyWeatherFeed.new '/tmp/weather', location: 'Lochend, Edinburgh', \
                                   api_key: '465xxxxxxxxxxxxxxxxx76ea01cbff4', \
                                        url_base: 'http://www.jamesrobertson.eu/',\
                           dx_xslt: '/xsl/dynarex-b.xsl', rss_xslt: '/xsl/feed.xsl'

    loop {puts '...'; feed.update; sleep 60}

Even though the loop controls when the feed is updated, it is helpful for the gem to control this in events where an attempts is made to refresh the feed more than once a minute.

Notes:

1. The next refresh time is stored in a hidden file called *.myweatherfeed* which is in the same file directory as the RSS file
2. In addition to limiting the refresh rate, a new feed item will only be added if the notice has changed since the previous notice.

--------------------

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
