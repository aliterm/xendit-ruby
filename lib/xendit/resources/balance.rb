# frozen_string_literal: true

require 'faraday'
require 'json'

require_relative '../api_operations'
require_relative '../response'

module Xendit
  class Balance
    class << self
      def get()
        resp = Xendit::APIOperations.get "balance"
        Xendit::Response.handle_error_response resp
        JSON.parse resp.body
      end
    end
  end
end
