# frozen_string_literal: true

require_relative "subreg/version"
require "httparty"

class SubregClient
  include HTTParty

  def initialize(token, base_url = "https://api.subreg.cz/")
    @auth_header = {"Authorization" => "Bearer #{token}"}
    #{ username: username, password: password }
    @base_url = base_url
  end

  def contacts()
    path = "contacts"
    response = self.class.get(@base_url + path, headers: @auth_header)
    response.parsed_response["contacts"]
  end

  def domains()
    path = "domains"
    response = self.class.get(@base_url + path, headers: @auth_header)
    response.parsed_response["domains"]
  end
end
