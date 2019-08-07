# -*- ruby -*-
# frozen_string_literal: true

require_relative '../../spec_helper'

require 'strelka/httpresponse/presenters'


RSpec.describe Strelka::HTTPResponse::Presenters do

	it "adds an index operator to the response to allow it to quack like a Rack ENV" do
		dummy_response_class = Class.new
		dummy_response_class.include( described_class )
		dummy_response = dummy_response_class.new

		expect {
			dummy_response[ 'HTTP_ACCEPT' ]
		}.to_not raise_error()
	end

end

