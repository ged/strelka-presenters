# -*- ruby -*-
# frozen_string_literal: true

require 'set'
require 'testlib' unless defined?( Testlib )
require 'testlib/base'


class Testlib::Group < Testlib::Base

	def initialize( * )
		super
		@members ||= Set.new
	end

	attr_accessor :name, :members

end

