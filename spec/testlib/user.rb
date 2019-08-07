# -*- ruby -*-
# frozen_string_literal: true

require 'set'
require 'testlib' unless defined?( Testlib )
require 'testlib/base'


class Testlib::User < Testlib::Base

	def initialize( * )
		super
		@roles ||= Set.new
	end

	attr_accessor :first_name, :last_name, :email, :login, :groups


	def name
		return [ self.first_name, self.last_name ].compact.join( ' ' )
	end

end

