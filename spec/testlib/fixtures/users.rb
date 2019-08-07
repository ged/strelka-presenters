# -*- ruby -*-
# frozen_string_literal: true

require 'faker'
require 'testlib/fixtures'
require 'testlib/user'

module Testlib::Fixtures::Users
	extend Testlib::Fixtures
	fixtured_class Testlib::User

	decorator :with_random_first_name do
		self.first_name = Faker::Name.first_name
	end

	decorator :with_random_last_name do
		self.last_name = Faker::Name.last_name
	end

	compose :with_random_name => [ :with_random_first_name, :with_random_last_name ]

	compose :full => :with_random_name do
		self.login = "%s%s" % [ self.first_name[0,1].downcase, self.last_name.downcase ]
		self.email = "%s@example.com" % [ self.first_name.downcase ]
	end

end

