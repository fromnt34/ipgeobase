# frozen_string_literal: true

require_relative "ipgeobase/version"
require "happymapper" # -

module Ipgeobase
  def self.lookup(ip)
    api_url = API.template.expand({ ip: ip })
    response = Net::HTTP.get api_url
    parsed_xml = HappyMapper.parse response

    Metadata.new parsed_xml
  end

  class Metadata
    # rubocop:disable Naming/MethodName, Naming/VariableName
    attr :city, :country, :countryCode, :lat, :lon

    def initialize(options)
      @city = options.city
      @country = options.country
      @countryCode = options.country_code
      @lat = options.lat.to_f
      @lon = options.lon.to_f
    end
    # rubocop:enable Naming/MethodName, Naming/VariableName
  end
end
