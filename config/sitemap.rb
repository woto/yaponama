require 'rubygems'
require 'sitemap_generator'
require 'net/http'

SitemapGenerator::Sitemap.default_host = "http://#{APP_CONFIG["site_address"]}/"

SitemapGenerator::Sitemap.create do
    add '/searches', :changefreq => 'daily'
    add '/searches/MN158596/MITSUBISHI/1', :changefreq => 'weekly'
    add '/searches/2330021010/TOYOTA/1', :changefreq => 'weekly'
    add '/searches/9091902230/TOYOTA/1', :changefreq => 'weekly'
    add '/info/MB290013/MITSUBISHI', :changefreq => 'monthly' 
    add '/info/PN0365/NIBK', :changefreq => 'monthly' 
    add '/about', :changefreq => 'weekly'
    Net::HTTP.start('188.64.170.156', '85') do |http|
      resp = http.get('/suppliers/73/price_settings/162/download')
      debugger
      puts '1'
    end
end
SitemapGenerator::Sitemap.ping_search_engines # called for you when you use the rake task
