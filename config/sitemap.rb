require 'rubygems'
require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = 'http://kaprika.ru'
SitemapGenerator::Sitemap.create do
    add '/info/5381102080/TOYOTA', :changefreq => 'weekly'
    add '/searches/1132217021', :changefreq => 'weekly'
    add '/searches/8504409901', :changefreq => 'weekly'
    add '/info/4776950010/TOYOTA', :changefreq => 'weekly'
    add '/about', :changefreq => 'weekly'
end
SitemapGenerator::Sitemap.ping_search_engines # called for you when you use the rake task
