require 'rubygems'
require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = "http://#{APP_CONFIG["site_address"]}/"

SitemapGenerator::Sitemap.create do
    add '/searches', :changefreq => 'daily'
    add '/searches/MN158596/MITSUBISHI/1', :changefreq => 'weekly'
    add '/searches/2330021010/TOYOTA/1', :changefreq => 'weekly'
    add '/searches/9091902230/TOYOTA/1', :changefreq => 'weekly'
    add '/about', :changefreq => 'weekly'
end
SitemapGenerator::Sitemap.ping_search_engines # called for you when you use the rake task
