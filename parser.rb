require 'csv'
require 'roo'
require_relative './utils'
require_relative './unit'
require_relative './quota'

class Parser

  def initialize()
    @echelons = []
    @units = {}

    list = Dir.glob("./data/*梯彙整服勤處所預擬分配表.csv")
    list.each do |path|
      fetch(path)
    end
  end

  def fetch(path)
    counter = 0
    echelon = path.match(/\.\/data\/(\d+)梯彙整服勤處所預擬分配表\.csv/)[1]

    CSV.foreach(path, encoding: 'utf-8') do |row|
      counter += 1
      next if counter  === 1
      next if row[0].to_i === 0

      data = Utils::row_to_data(row)
      quota = Quota.new(echelon, data)
      unit = get_unit(quota.country, quota.district, quota.name)
      unit.add_echelons(quota.echelon, quota.quota)
    end

    @echelons.push(echelon)
  end

  def export(output)
    CSV.open(output, "wb", encoding: 'utf-8:big5') do |csv|
      header = ['縣市', '行政區', '處所'].concat(@echelons)
      csv << header

      @units.each do |id, unit|
          row = [ unit.country, unit.district, unit.name ]
          @echelons.each do |echelon|
            row.push unit.get_echelon_quota(echelon)
          end
          csv << row
      end
    end

  end

  def get_unit(country, district, name)
    # puts "#{country} / #{district} / #{name}"
    name = Utils::regularize_name(name)
    id = (country + name).to_sym
    @units[id] ||= Unit.new(country, district, name)
  end
end