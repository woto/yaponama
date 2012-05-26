class RobotsTxtController < ApplicationController
  def index
    render :text => <<EOF
User-Agent: *
Allow: /
Crawl-delay: 3

Sitemap: http://#{APP_CONFIG['site_address']}/sitemap1.xml.gz
Sitemap: http://#{APP_CONFIG['site_address']}/sitemap_index.xml.gz

Host: #{APP_CONFIG['site_address']}
EOF
  end
end
