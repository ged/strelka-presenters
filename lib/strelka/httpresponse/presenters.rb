# -*- ruby -*-
# frozen_string_literal: true

require 'yaks'

require 'strelka/httpresponse' unless defined?( Strelka::HTTPResponse )


# Hypermedia presentation logic for Strelka HTTP responses
module Strelka::HTTPResponse::Presenters

	### Initialize some instance variables when a new response is created.
	def initialize( * )
		@presenter = nil
		super
	end


	######
	public
	######

	##
	# The presenter to use when negotiating the response
	attr_accessor :presenter


	### Added so we can pass the response object to the presenters as the `env`.
	def []( * ) # :nodoc:
		return nil
	end


	### Set the entity that should be rendered to form the response body.
	def present( entity, **options )
		Yaks::Format.all.each do |format|
			self.for( format.media_type ) do
				opts = options.merge( format: format.format_name, env: self )
				self.presenter.call( entity, opts )
			end
		end
	end

end # module Strelka::HTTPResponse::Presenters

