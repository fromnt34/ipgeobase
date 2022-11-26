# frozen_string_literal: true

require "test_helper"
require_relative "lookup_test_helper" # -

class TestIpgeobaseLookup < Minitest::Test
  def test_ipgeobase_lookup_is_exist
    assert { Ipgeobase.respond_to? :lookup }
  end

  class TestIpgeobaseLookupMetadataProperties < Minitest::Test
    def setup
      request_ip = "8.8.8.8"
      url = API.template.expand(ip: request_ip).to_s

      stub_request(:get, url)
        .to_return body: LookupTestHelper.stub

      @metadata = Ipgeobase.lookup request_ip
    end

    def test_ipgeobase_lookup_return_object
      assert_instance_of Ipgeobase::Metadata, @metadata
    end

    def test_ipgeobase_lookup_metadata_properties_is_exist
      expected_properties = %i[city country countryCode lat lon]

      expected_properties.each do |expected_property|
        assert { @metadata.respond_to? expected_property }
      end
    end

    def test_ipgeobase_lookup_metadata_properties
      expected_values = {
        city: "Ashburn",
        country: "United States",
        countryCode: "US",
        lat: 39.03,
        lon: -77.5
      }

      expected_values.each do |property, expected_value|
        assert { @metadata.send(property) == expected_value }
      end
    end
  end
end
