module Scryfall
  require 'base'
  class API < Base
    def initialize(url = 'https://api.scryfall.com');
      @url = url
    end

    def get(path = "", params = {}, **args)
      res = HTTP.get(mount_uri(path), params: params)

      if args.has_key?(:to_struct) && args[:to_struct] == true
        JSON.parse res, object_class: OpenStruct
      else
        JSON.parse res
      end
    end

    private

    def mount_uri(path)
      @url + path
    end
  end
end
