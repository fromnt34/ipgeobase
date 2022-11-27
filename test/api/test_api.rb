# frozen_string_literal: true

require "test_helper"
require_relative "../../lib/ipgeobase/api/api" # -

class TestAPI < TestHelper
  def test_is_class
    assert_instance_of Class, API
  end

  def test_template_return_template_object
    assert_instance_of Addressable::Template, API.template
  end
end
