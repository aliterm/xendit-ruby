# frozen_string_literal: true

require 'faraday'
require 'json'

require_relative '../api_operations'
require_relative '../response'

module Xendit
  class RecurringPayment
    class << self
      def get(recurring_id)
        raise ArgumentError, 'recurring_id is required and should be a string' \
            if recurring_id.nil? || !recurring_id.is_a?(String)

        resp = Xendit::APIOperations.get "recurring_payments/#{recurring_id}"
        Xendit::Response.handle_error_response resp
        JSON.parse resp.body
      end

      def create(recurring_params)
        resp = Xendit::APIOperations.post('recurring_payments', **recurring_params)
        Xendit::Response.handle_error_response resp

        JSON.parse resp.body
      end

      def update(recurring_id, recurring_params)
        resp = Xendit::APIOperations.patch("recurring_payments/#{recurring_id}", **recurring_params)
        Xendit::Response.handle_error_response resp

        JSON.parse resp.body
      end
    end
  end
end
