# -*- ruby -*-
# frozen_string_literal: true

module Testlib

	autoload :Base, 'testlib/base'
	autoload :Group, 'testlib/group'
	autoload :User, 'testlib/user'
	autoload :Fixtures, 'testlib/fixtures'
	autoload :Presenters, 'testlib/presenters'


	def self::reset
		Testlib::Base::DATASTORE.clear
		Testlib::Base::SERIAL_GENERATOR.clear
	end

end


