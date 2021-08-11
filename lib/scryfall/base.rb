module Scryfall
  class Base
    require "scryfall/api"

    protected
    def self.api
      @api ||= API.new
    end
  end
end
