# frozen_string_literal: true

module Scryfall
  require 'scryfall/base'
  class Cards < Base
    def self.named_fuzzy(cardname, **args)
      api.get '/cards/named', { fuzzy: cardname }, **args
    end

    def self.named_exact(cardname, **args)
      api.get '/cards/named', { exact: cardname }, **args
    end

    def self.search(query, **args)
      params = { q: query.encode }

      params['page'] = args.page if args.key?(:page) && args.page >= 1

      api.get '/cards/search', params, **args
    end

    def self.with_mtgo_id(id, **args)
      api.get "/cards/mtgo/#{id}", {}, **args
    end

    def self.with_arena_id(id, **args)
      api.get "/cards/arena/#{id}", {}, **args
    end

    def self.with_tcgplayer_id(id, **args)
      api.get "/cards/tcgplayer/#{id}", {}, **args
    end

    def self.with_id(id, **args)
      api.get "/cards/#{id}", {}, **args
    end
  end
end
