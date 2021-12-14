# frozen_string_literal: true

require "dotenv/load"

require "harvest_notifier/rollbar"
require "harvest_notifier/base"

module HarvestNotifier
  DAILY_REPORT = %w[Tuesday Wednesday Thursday Friday].freeze

  module_function

  def create_daily_report
    return unless DAILY_REPORT.include?(Date.today.strftime("%A"))

    HarvestNotifier::Base.new.create_daily_report(Date.today)
  end

  def create_monday_report
    return unless Date.today.monday?

    HarvestNotifier::Base.new.create_monday_report()
  end

  def create_weekly_report
    return unless Date.today.wednesday?

    #date_from = Date.today.last_week
    #date_to = date_from + 4

    date_from = Date.today.beginning_of_week
    date_to = Date.today

    HarvestNotifier::Base.new.create_weekly_report(date_from, date_to)
  end
end
