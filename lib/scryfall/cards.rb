module Scryfall
  require 'scryfall/base'
  class Cards < Base
    def self.named_fuzzy(cardname, **args)
      api.get '/cards/named', { fuzzy: cardname }, args
    end

    def self.named_exact(cardname, **args)
      api.get '/cards/named', { exact: cardname }, args
    end

    def self.search(query, **args)
      params = { q: query.encode }

      if args.has_key?(:page) && args.page >= 1
        params['page'] = args.page
      end

      api.get '/cards/search', params, args
    end
  end
end
