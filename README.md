# scryfall-rails
[![Gem Version](https://badge.fury.io/rb/scryfall.svg)](https://badge.fury.io/rb/scryfall)
[![CircleCI](https://circleci.com/gh/jlcarruda/scryfall-rails/tree/master.svg?style=svg)](https://circleci.com/gh/jlcarruda/scryfall-rails/tree/master)

A simple gem that utilizes the Scryfall API to get Magic: the Gathering card information.


## Instalation

It will only be needed to specify it on your Gemfile:

```ruby
gem 'scryfall'
```

And then run the Bundler

```ruby
bundle install
```

# Usage

The Scryfall module have classes for each query on the Scryfall API. Each class will reflect a module of query.

At first, there are only a few methods available:

# ::Cards

Using ```require "scryfall/cards"```, you will have access to the ```Scryfall::Cards``` class. It encapsulates the logics on the API that returns a set of cards, or an object representing a single one.

### Named (fuzzy and exact)

It searches for cards named almost as the string passed (fuzzy), or with the exact name as the string passed (exact)

```ruby
# Fuzzy
Scryfall::Cards.named_fuzzy "aust commd"

# Exact
Scryfall::Cards.named_exact "Counterspell"
```

### Search Query

It can search a list of cards using the Scryfall syntax

```ruby
# The search will return all the cards that fits on the query parameters
Scryfall::Cards.search "f:standard t:land id:UW"

# It can be passed the page of the search. Each page of data has a maximum of 175 cards
Scryfall::Cards.search "f:standard t:creature", page: 2
```

### By IDs

The `Scryfall::Cards` class has methods to retrieve cards by its identifier in multiple platforms.

```ruby
# Returning the "Yargle, Glutton of Urborg" card by its IDs

# can be fetched by its MTGO id ...
Scryfall::Cards.with_mtgo_id 67691

# ... by its Arena id ...
Scryfall::Cards.with_arena_id 67330

# ... by its TCG Player id ...
Scryfall::Cards.with_tcgplayer_id 164756

# ... or by its unique ID.
Scryfall::Cards.with_id "645cfc1b-76f2-4823-9fb0-03cb009f8b32"
```

Cards that are not on those systems can't be retrieved by its ids. For example, the **Austere Command** card can't be fetched by an Arena Id because the card isn't in the game.

# Responses

The default response for all calls are JSON. If a `to_struct: true` is passed as argument, the return will be a `OpenStruct` Hash object.
