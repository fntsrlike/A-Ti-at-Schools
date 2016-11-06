require 'roo'
require 'roo-xls'

list = Dir.glob("./downloads/*梯彙整服勤處所預擬分配表.xls")

list.each do |path|
  xls = Roo::Spreadsheet.open(path)
  csv = xls.to_csv
  echelon = path.match(/\.\/downloads\/(\d+)梯彙整服勤處所預擬分配表\.xls/)[1]

  raise 'echelon number error' if echelon.to_i === 0

  filename = "./data/#{echelon}梯彙整服勤處所預擬分配表.csv"
  File.open(filename, 'w') { |file| file.write(csv) }
end

