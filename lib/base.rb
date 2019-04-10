module Scryfall
	class Base
		require "api"

		protected
		def self.api
			@api ||= API.new
		end
	end
end