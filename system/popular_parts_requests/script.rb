require 'rubygems'
require 'net/http'
require 'uri'
require 'ruby-debug'
require 'net/http'
require 'cgi'

URL = 'http://www.yaponama.ru/searches/'

def make_request(raw_url)
  url = URI.parse(raw_url)
  req = Net::HTTP::Get.new(url.path)
  res = Net::HTTP.start(url.host, url.port) do |http|

    result = http.request(req)

    if result['location']
      return make_request(result['location'])
    end

    return result, raw_url
  end
end

input = File.new('input.csv', 'r')

File.open('output.csv', 'w') do |output|
  input.each_line("\n") do |row|
    puts input.lineno
    result, url = make_request(URL + CGI.escape(row[0...-1]))
    if result.instance_of? Net::HTTPOK
      puts url
      output.puts url.sub(Regexp.new("^" + URL + "(.*)"), "\\1").sub("#jump", "").upcase
      output.flush
    end
  end
end
