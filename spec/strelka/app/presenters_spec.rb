# -*- ruby -*-
# frozen_string_literal: true

require_relative '../../spec_helper'

require 'strelka'
require 'mongrel2/testing'
require 'strelka/testing'
require 'strelka/constants'
require 'strelka/behavior/plugin'

require 'testlib'

require 'strelka/app/presenters'


RSpec.describe( Strelka::App::Presenters ) do

	TEST_SEND_SPEC = 'tcp://127.0.0.1:12012'
	TEST_RECV_SPEC = 'tcp://127.0.0.1:12013'


	before( :all ) do
		Testlib::Fixtures.load( :users, :groups )

		@request_factory = Mongrel2::RequestFactory.new(
			route: '/api/v1',
			host: 'acme.com',
			port: 80
		)
	end


	it_should_behave_like( "A Strelka Plugin" )


	describe "an including App" do

		before( :each ) do
			Testlib.reset

			@app = Class.new( Strelka::App ) do
				def initialize( appid='presenters-test', sspec=TEST_SEND_SPEC, rspec=TEST_RECV_SPEC )
					super
				end

				plugins :routing
				router :exclusive

				plugin :parameters
				param :id, :integer

				plugin :presenters do
					default_format :hal
					rel_template 'https://acme.com/rels/{rel}'
					format_options( :hal, plural_links: [:copyright] )
					mapper_namespace Testlib::Presenters
				end

				get '/users' do |req|
					res = req.response
					res.present( Testlib::User.all )
					return res
				end

				get '/users/:id' do |req|
					id = req.params[:id]

					user = Testlib::User[ id ] or finish_with HTTP::NOT_FOUND, "no such user"
					res = req.response
					res.present( user )

					return res
				end
			end
		end


		let( :user_factory ) { Testlib::Fixtures.user.full }
		let( :user_generator ) { user_factory.generator(create: true) }


		it "can render a singleton HAL response" do
			user = user_factory.create

			req = @request_factory.get( "/api/v1/users/#{user.id}", accept: 'application/hal+json' )
			res = @app.new.handle( req )

			expect( res.status ).to eq( 200 )
			expect( res.content_type ).to eq( 'application/hal+json' )
			expect( res ).to have_json_body( Object ).
				that_includes(
					id: user.id,
					name: user.name,
					email: user.email,
					login: user.login,
					_links: a_hash_including(
						self: {
							href: "/api/v1/users/#{user.id}"
						}
					)
				)
		end


		it "can render a collection HAL response" do
			users = user_generator.take( 10 )

			req = @request_factory.get( "/api/v1/users", accept: 'application/hal+json' )
			res = @app.new.handle( req )

			expect( res.status ).to eq( 200 )
			expect( res.content_type ).to eq( 'application/hal+json' )
			expect( res ).to have_json_body( Object ).
				that_includes(
					_embedded: {
						"https://acme.com/rels/users": a_collection_containing_exactly(
							*users.map {|u| a_hash_including(id: u.id) }
						)
					}
				)
		end


		it "can render a singleton HALO response" do
			user = user_factory.create

			req = @request_factory.get( "/api/v1/users/#{user.id}", accept: 'application/halo+json' )
			res = @app.new.handle( req )

			expect( res.status ).to eq( 200 )
			expect( res.content_type ).to eq( 'application/halo+json' )
			expect( res ).to have_json_body( Object ).
				that_includes(
					id: user.id,
					name: user.name,
					email: user.email,
					login: user.login,
					_links: a_hash_including(
						self: {
							href: "/api/v1/users/#{user.id}"
						}
					)
				)
		end


		it "can render a collection HALO response" do
			users = user_generator.take( 10 )

			req = @request_factory.get( "/api/v1/users", accept: 'application/halo+json' )
			res = @app.new.handle( req )

			expect( res.status ).to eq( 200 )
			expect( res.content_type ).to eq( 'application/halo+json' )
			expect( res ).to have_json_body( Object ).
				that_includes(
					_embedded: {
						"https://acme.com/rels/users": a_collection_containing_exactly(
							*users.map {|u| a_hash_including(id: u.id) }
						)
					}
				)
		end


		it "can render a singleton JSON-API response" do
			user = user_factory.create

			req = @request_factory.get( "/api/v1/users/#{user.id}", accept: 'application/vnd.api+json' )
			res = @app.new.handle( req )

			expect( res.status ).to eq( 200 )
			expect( res.content_type ).to eq( 'application/vnd.api+json' )
			expect( res ).to have_json_body( Object ).
				that_includes(
					data: {
						attributes: {
							name: user.name,
							email: user.email,
							login: user.login,
						},
						id: user.id.to_s,
						links: {
							self: "/api/v1/users/#{user.id}"
						},
						type: "users"
					}
				)
		end


		it "can render a collection JSON-API response" do
			users = user_generator.take( 10 )

			req = @request_factory.get( "/api/v1/users", accept: 'application/vnd.api+json' )
			res = @app.new.handle( req )

			expect( res.status ).to eq( 200 )
			expect( res.content_type ).to eq( 'application/vnd.api+json' )
			expect( res ).to have_json_body( Object ).
				that_includes(
					data: a_collection_containing_exactly(
						*users.map {|u| a_hash_including(id: u.id.to_s) }
					)
				)
		end


		it "can render a singleton Collection+JSON response" do
			user = user_factory.create

			req = @request_factory.get(
				"/api/v1/users/#{user.id}",
				accept: 'application/vnd.collection+json'
			)
			res = @app.new.handle( req )

			expect( res.status ).to eq( 200 )
			expect( res.content_type ).to eq( 'application/vnd.collection+json' )
			expect( res ).to have_json_body( Object ).
				that_includes(
					collection: {
						version: '1.0',
						items: [
							{
								data: a_collection_containing_exactly(
									{ name: "name", value: user.name},
									{ name: "email", value: user.email},
									{ name: "login", value: user.login},
									{ name: "id", value: user.id},
								),
								href: "/api/v1/users/#{user.id}"
							}
						],
						href: "/api/v1/users/#{user.id}"
					}
				)
		end


		it "can render a collection Collection+JSON response" do
			users = user_generator.take( 10 )

			req = @request_factory.get(
				"/api/v1/users",
				accept: 'application/vnd.collection+json'
			)
			res = @app.new.handle( req )

			expect( res.status ).to eq( 200 )
			expect( res.content_type ).to eq( 'application/vnd.collection+json' )
			expect( res ).to have_json_body( Object ).
				that_includes( :collection )
		end

	end

end

