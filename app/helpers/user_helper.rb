# rubocop:disable Style/GuardClause

require 'httparty'

module UserHelper
  def exchange_data
    response = HTTParty.get('https://api.ratesapi.io/api/latest')
    response['rates'].select { |key, _value| %w[GBP CHF DKK CAD USD JPY].include?(key) }
  end

  def draw_chart
    if current_user.expenses.any?
      pie_chart current_user.expenses.group(:group_name).count, download: true, title: 'Expenses'
    end
  end
end

# rubocop:enable Style/GuardClause
