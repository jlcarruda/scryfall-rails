module Scryfall
  class Cards
    require 'http'
    require 'ostruct'

    def initialize
      @url = 'https://api.scryfall.com'
    end

    def get(path, params = {}, **args)
      res = HTTP.get(mount_uri(path), params: params)

      if args.has_key?(:to_struct) && args[:to_struct] === true
        JSON.parse res, object_class: OpenStruct
      else
        JSON.parse res
      end
    end

    def named_fuzzy(cardname, **args)
      get '/cards/named', { fuzzy: cardname }, args
    end

    def named_exact(cardname, **args)
      get '/cards/named', { exact: cardname }, args
    end

    def search(query, **args)
      params = { q: query.encode }

      if args.has_key?(:page) && args.page >= 1
        params['page'] = args.page
      end

      get '/cards/search', params, args
    end

    private
    def mount_uri(path)
      @url + path
    end
  end
end