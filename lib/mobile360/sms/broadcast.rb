# frozen_string_literal: true

# =========================================
# Send a broadcast message per msisdn
# https://api.mobile360.ph/v3/api/broadcast
# =========================================
require 'json'

module Mobile360
  module SMS
    class Broadcast
      ENDPOINT = 'https://api.mobile360.ph/v3/api/broadcast'

      attr_reader :username, :password, :msisdn, :content, :shortcode_mask,
                  :rcvd_transid, :is_intl

      def initialize(options = {})
        @username = options.fetch(:username, ENV['MOBILE360_USERNAME'])
        @password = options.fetch(:password, ENV['MOBILE360_PASSWORD'])
        @msisdn = options.fetch(:msisdn)
        @content = options.fetch(:content)
        @rcvd_transid = options[:rcvd_transid]
        @is_intl = options.fetch(:is_intl, false)
        @shortcode_mask = options.fetch(:shortcode_mask, 
                                        ENV['MOBILE360_SHORTCODE_MASK'])
      end

      def call
        if response.code == 201
          response
        else
          false
        end
      end

      def call!
        return call if call

        raise StandardError, response
      end

      def response
        @response ||= JSON.parse(
          request.body, object_class: Mobile360::SMS::Response
        )
      end

      private

      def request
        RestClient.post(ENDPOINT, payload, content_type: :json)
      rescue RestClient::ExceptionWithResponse => req
        req.response
      end

      def payload
        {
          username: username,
          password: password,
          msisdn: msisdn,
          content: content,
          shortcode_mask: shortcode_mask,
          rcvd_transid: rcvd_transid,
          is_intl: is_intl
        }.to_json
      end
    end
  end
end
