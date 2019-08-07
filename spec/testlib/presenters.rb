# -*- ruby -*-
# frozen_string_literal: true

require 'yaks'

require 'testlib' unless defined?( Testlib )


# Presentation entities
module Testlib::Presenters

	class UserMapper < Yaks::Mapper
		link :self, '/api/v1/users/{id}'

		attributes :id, :name, :email, :login

	end # class PersonaMapper

end # module Prestigio::Service::Presenters

