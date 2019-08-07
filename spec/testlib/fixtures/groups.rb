# -*- ruby -*-
# frozen_string_literal: true

require 'faker'
require 'testlib/fixtures'
require 'testlib/group'

module Testlib::Fixtures::Groups
	extend Testlib::Fixtures
	fixtured_class Testlib::Group
end

