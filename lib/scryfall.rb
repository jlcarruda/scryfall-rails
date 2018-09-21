
class Scryfall
  require 'http'
  require 'ostruct'
  
  @url = 'https://api.scryfall.com'
  
  def self.mount_uri(path)
    @url + path
  end

  def self.get(path, params = {}, **args)
    res = HTTP.get(mount_uri(path), params: params)
    
    if args.has_key?(:to_struct) && args[:to_struct] === true
      JSON.parse res, object_class: OpenStruct
    else
      JSON.parse res
    end
  end
  
  def self.get_cards_named_fuzy(cardname, **args)
    get '/cards/named', { fuzzy: cardname }, args
  end

  def self.get_cards_named_exact(cardname, **args)
    get '/cards/named', { exact: cardname }, args
  end

  def self.get_cards_search(query, **args)
    params = { q: query.encode }

    if args.has_key?(:page) && args.page >= 1
      params['page'] = args.page
    end

    get '/cards/search', params, args
  end
  
end
