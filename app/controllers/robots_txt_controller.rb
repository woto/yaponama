class RobotsTxtController < ApplicationController
  def index
    render :text => <<EOF
User-Agent: *
Allow: /
Disallow: /info/
Disallow: /*?skip_mobile=true
Disallow: /*?skip_mobile=false

Sitemap: http://#{APP_CONFIG['site_address']}/sitemap_index.xml.gz

Host: #{APP_CONFIG['site_address']}
EOF
  end
end
