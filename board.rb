# encoding: UTF-8
require 'net/http'

uri = URI('http://maseduc.moe.gov.tw/board/Detail.asp')

for num in (1..831)
  uri.query = URI.encode_www_form({ :TitleID => num })
  res = Net::HTTP.get_response(uri)

  next unless res.is_a?(Net::HTTPSuccess)

  content = res.body.force_encoding('BIG5').encode('UTF-8')
  title = content[/<TD COLSPAN="5" bgcolor="#FFFFCC">(.+)<\/TD><\/TR>/, 1]

  puts "#{num}: #{title}"
end