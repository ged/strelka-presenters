# -*- ruby -*-
# frozen_string_literal: true

require 'testlib' unless defined?( Testlib )


class Testlib::Base

	# Fancy database simulator
	DATASTORE = Hash.new do |h, modelclass|
		h[ modelclass ] = {}
	end
	SERIAL_GENERATOR = Hash.new do |h, modelclass|
		h[ modelclass ] = Enumerator.new do |yielder|
			i = 0
			loop { i += 1; yielder.yield(i) }
		end
	end


	def self::[]( id )
		return DATASTORE[ self ][ id ]
	end

	def self::all
		return DATASTORE[ self ].values
	end


	def initialize( params={} )
		params.each do |name, value|
			self.send( "#{name}=", value )
		end
	end


	attr_accessor :id
	alias_method :pk, :id


	def []( attr_name )
		return self.public_send( param )
	end


	def save
		self.id ||= SERIAL_GENERATOR[ self.class ].next
		DATASTORE[ self.class ][ self.id ] = self.dup
	end


	def saved?
		return self.id && DATASTORE[ self.class ].key?( self.id )
	end

end

