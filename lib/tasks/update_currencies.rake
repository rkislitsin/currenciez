require 'nokogiri'
require 'net/http'

URL = 'http://www.cbr.ru/scripts/XML_daily.asp'

namespace :currencies do
  desc 'Refresh currencies'

  task refresh: :environment do
    begin
      page = Nokogiri::XML(Net::HTTP.get(URI.parse(URL)))

      Currency.destroy_all

      page.xpath('ValCurs/Valute').each do |item|
        num  = item.xpath('NumCode').text
        char = item.xpath('CharCode').text
        rate = item.xpath('Value').text
        name = item.xpath('Name').text

        currency = Currency.find_or_create_by!(num_code: num, char_code: char)
        currency.update!(rate: rate, name: name, char_code: char)
      end

      puts "Currencies updated: #{Currency.all.count}"
    rescue StandardError => e
      puts "Failed to connect: #{e.message}"
    end
  end

end