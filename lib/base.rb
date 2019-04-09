module Scryfall
	class Base
		require 'http'
		require 'ostruct'
		require 'json'
		require 'error_handler'
		require 'resolv-replace'

		include ErrorHandler
	end
end