# -*- ruby -*-
# frozen_string_literal: true

require 'yaks'

require 'strelka/app' unless defined?( Strelka::App )
require 'strelka/plugins'
require 'strelka/mixins'

require 'strelka/httpresponse/presenters'


# Presentation layer plugin for Strelka service apps.
module Strelka::App::Presenters
	include Strelka::Constants
	extend Strelka::Plugin

	run_outside :routing, :filters
	run_inside  :templating, :parameters, :negotiation


	# Class methods to add to classes with presenters
	module ClassMethods

		##
		# The block given to Yaks when it's configured
		attr_accessor :presenter_config_block

	end # module ClassMethods


	### Extension callback -- extend the HTTPResponse classes with presenter logic
	### when the plugin is loaded.
	def self::included( object )
		Strelka::HTTPResponse.include( Strelka::HTTPResponse::Presenters )
		super
	end


	### Set a block passed to `plugin` to the presenter library when it's
	### configured.
	def self::configure_block( app, &block )
		app.plugin( :negotiation )
		app.presenter_config_block = block
	end


	### Set up the presenters when the app is created.
	def initialize( * )
		super
		@presenter = self.setup_presentation_layer
	end


	######
	public
	######

	##
	# The configured Yaks presenter object
	attr_reader :presenter


	### Set up the presenter when the response has returned.
	def handle_request( req )
		self.log.debug "[:negotiation] Wrapping response with hypermedia presentation."

		response = super
		response.presenter = self.presenter

		return response
	end


	### Configure and return the presenter.
	def setup_presentation_layer
		self.log.debug "Setting up presenters using %s" %
			[ self.class.presenter_config_block&.inspect || 'defaults' ]
		config_block = self.class.presenter_config_block || Proc.new {}
		return Yaks.new( &config_block )
	end

end # module Strelka::App::Presenters


