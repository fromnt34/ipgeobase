# frozen_string_literal: true

require "addressable/template"

class API
  include Addressable

  def self.template
    Template.new "http://ip-api.com/xml/{ip}"
  end
end
