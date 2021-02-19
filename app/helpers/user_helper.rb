require 'httparty'

module UserHelper
  def exchange_data
    HTTParty.get('https://api.ratesapi.io/api/latest')
  end
end
