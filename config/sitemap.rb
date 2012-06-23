require 'rubygems'
require 'sitemap_generator'
require 'net/http'
require 'fastercsv'

SitemapGenerator::Sitemap.default_host = "http://#{APP_CONFIG["site_address"]}/"

SitemapGenerator::Sitemap.create do
    add '/searches', :changefreq => 'daily'
    add '/about', :changefreq => 'weekly'
    Page.all do |page|
      add "/#{page.path}", :changefreq => 'monthly'
    end
    Net::HTTP.start('188.64.170.156', '85') do |http|
      prices_urls = [
      '/suppliers/77/price_settings/154/download',
      '/suppliers/77/price_settings/153/download',
      '/suppliers/77/price_settings/149/download',
      '/suppliers/77/price_settings/151/download',
      '/suppliers/73/price_settings/162/download',
      '/suppliers/73/price_settings/166/download',
      '/suppliers/73/price_settings/163/download',
      '/suppliers/73/price_settings/164/download',
      '/suppliers/73/price_settings/165/download',
      '/suppliers/73/price_settings/127/download',
      '/suppliers/73/price_settings/168/download',
      '/suppliers/73/price_settings/148/download',
      '/suppliers/73/price_settings/167/download',
      '/suppliers/76/price_settings/155/download',
      '/suppliers/76/price_settings/156/download',
      '/suppliers/76/price_settings/157/download',
      '/suppliers/76/price_settings/158/download',
      '/suppliers/76/price_settings/159/download',
      '/suppliers/76/price_settings/160/download',
      '/suppliers/76/price_settings/161/download' 
      ]

      prices_urls.each do |price_url|
        resp = http.get(price_url)
        FasterCSV.parse(resp.body) do |row|
          add "/searches/#{row[1]}", :changefreq => 'weekly'
        end
      end
    end
end
SitemapGenerator::Sitemap.ping_search_engines # called for you when you use the rake task
