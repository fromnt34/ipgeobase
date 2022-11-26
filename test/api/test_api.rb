# frozen_string_literal: true

require "test_helper"
require_relative "../../lib/ipgeobase/api/api" # -

class TestAPI < Minitest::Test
  def test_api_is_class
    assert_instance_of Class, API
  end

  def test_api_template_is_template_object
    assert_instance_of Addressable::Template, API.template
  end
end
