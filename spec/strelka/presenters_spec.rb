# -*- ruby -*-
# frozen_string_literal: true

require_relative '../spec_helper'

require 'rspec'
require 'strelka/presenters'


RSpec.describe( Strelka::Presenters ) do

	it "knows what version of the library it is" do
		expect( described_class::VERSION ).to be_a( String ).and( match(/\A\d+\.\d+\.\d+\z/) )
	end

end

