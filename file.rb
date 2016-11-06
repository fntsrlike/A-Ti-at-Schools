# encoding: UTF-8
require 'net/http'
require 'open-uri'

for num in (1..170)
  name = "#{num}梯彙整服勤處所預擬分配表.xls"
  url = URI.escape("http://maseduc.moe.gov.tw/board/upload/#{name}")
  uri = URI(url)

  request = Net::HTTP.new uri.host
  response= request.request_head uri.path
  puts "#{num}: #{response.code.to_i} #{response.message}"

  next unless response.is_a?(Net::HTTPSuccess)

  File.open("./downloads/#{name}", "wb") do |file|
    file.write open(uri).read
  end
end