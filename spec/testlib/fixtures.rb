# -*- ruby -*-
# frozen_string_literal: true

require 'fluent_fixtures'
require 'testlib' unless defined?( Testlib )

module Testlib::Fixtures
	extend FluentFixtures::Collection

	fixture_path_prefix 'testlib/fixtures'


	def self::describe
		desc = "%p: %d fixtures loaded" % [ self, self.modules.length ]
		unless self.modules.empty?
			desc << ": %s" % [ self.modules.keys.map(&:to_s).join(', ') ]
		end
		return desc
	end

end

