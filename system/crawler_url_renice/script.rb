require 'rubygems'
require 'net/http' 
require 'uri'
require 'ruby-debug'
require 'net/http'

raise 'Хотя бы один файл из списка (google.csv, yanex.csv) отсутсвует' unless File.exists?('google.csv') && File.exists?('yandex.csv')

def make_request(raw_url, file_name, line_no)
  url = URI.parse(raw_url)
  req = Net::HTTP::Get.new(url.path)
  res = Net::HTTP.start(url.host, url.port) do |http|
      http.request(req)
  end
  puts raw_url, file_name, line_no
end

file = File.new('yandex.csv', 'r')

file.each_line("\n") do |row|
  next if file.lineno <= 5
  columns = row.split(";")
  make_request('http://www.yaponama.ru/' + columns[0], file.path, file.lineno)
end

file = File.new('google.csv', 'r')

file.each_line("\n") do |row|
  next if file.lineno <= 1
  columns = row.split(',')
  make_request(columns[0], file.path, file.lineno)
end
