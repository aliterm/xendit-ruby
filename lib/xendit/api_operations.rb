# frozen_string_literal: true

require 'faraday'
require 'json'

module Xendit
  class APIOperations
    class << self
      def get(url, params = nil)
        conn = create_connection
        conn.get url, params
      end

      def post(url, **params)
        conn = create_connection
        conn.post url, JSON.generate(params)
      end

      def patch(url, **params)
        conn = create_connection
        conn.patch url, JSON.generate(params)
      end

      private

      def create_connection
        Faraday.new(
          url: Xendit.base_url,
          headers: {'Content-Type' => 'application/json'}
        ) do |conn|
          conn.request(:basic_auth, Xendit.api_key, '')
        end
      end
    end
  end
end
