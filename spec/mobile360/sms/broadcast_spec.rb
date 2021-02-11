require_relative '../../spec_helper'
require 'webmock/rspec'

module Mobile360
  module SMS
    RSpec.describe Broadcast do
      let(:client) { described_class.new(options) }
      let(:host) { 'https://api.mobile360.ph/v3/api/broadcast' }

      describe '#call!' do
        context 'when response code is > 200' do
          let(:options) do
            {
              username: 'test',
              password: 'test',
              msisdn: '639123456789',
              content: 'Hello',
              shortcode_mask: 'test'
            }
          end

          before do
            stub_request(:post, host).to_return(
              body: {
                code: 201,
                name: 'Created',
                transid: 'M360DDA6DBD9FFF11ECF31612860951',
                timestamp: '20210209165551'
              }.to_json,
              status: 201,
              headers: { 'Content-Type' => 'application/json' }
            )
          end

          it 'returns truthy value' do
            expect(client.call).to be_truthy
          end
        end

        context 'when response code is > 400' do
          let(:options) do
            {
              username: '1',
              password: '1',
              msisdn: '1234',
              content: '1',
              shortcode_mask: '1'
            }
          end

          before do
            stub_request(:post, host).to_return(
              body: {
                code: 400,
                name: 'Bad Request',
                message: 'something'
              }.to_json,
              status: 400,
              headers: { 'Content-Type' => 'application/json' }
            )
          end

          it 'raises an exception' do
            expect { client.call! }.to raise_exception(StandardError)
          end
        end
      end

      describe '#call' do
        context 'when response code is > 200' do
          let(:options) do
            {
              username: 'test',
              password: 'test',
              msisdn: '639123456789',
              content: 'Hello World',
              shortcode_mask: 'test'
            }
          end

          before do
            stub_request(:post, host).to_return(
              body: {
                'code': 201,
                'name': 'Created',
                'transid': 'M360DDA6DBD9FFF11ECF31612860951',
                'timestamp': '20210209165551'
              }.to_json, 
              status: 201, 
              headers: { 'Content-Type' => 'application/json' }
            )
          end

          it 'returns truthy value' do
            expect(client.call).to be_truthy
          end
        end

        context 'when response code is > 400' do
          let(:options) do
            {
              username: 'test',
              password: 'test',
              msisdn: '1234567890',
              content: '123',
              shortcode_mask: 123
            }
          end

          before do
            stub_request(:post, host).to_return(
              body: {
                code: 400,
                name: 'Bad Request',
                message: 'The msisdn length must be between 10 and 13'
              }.to_json,
              status: 400,
              headers: { 'Content-Type' => 'application/json' }
            )
          end

          it 'returns falsey value' do
            expect(client.call).to be_falsey
          end
        end
      end
    end
  end
end

