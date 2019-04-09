module Scryfall
  require 'api'
  class Cards < Base

    def initialize
      @api = API.new
    end

    def named_fuzzy(cardname, **args)
      @api.get '/cards/named', { fuzzy: cardname }, args
    end

    def named_exact(cardname, **args)
      @api.get '/cards/named', { exact: cardname }, args
    end

    def search(query, **args)
      params = { q: query.encode }

      if args.has_key?(:page) && args.page >= 1
        params['page'] = args.page
      end

      @api.get '/cards/search', params, args
    end
  end
end