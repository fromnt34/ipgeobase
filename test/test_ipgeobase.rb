# frozen_string_literal: true

require "test_helper"

class TestIpgeobase < TestHelper
  def test_ipgeobase_is_module
    assert_instance_of Module, Ipgeobase
  end
end
