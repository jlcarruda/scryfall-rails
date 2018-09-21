# scryfall-rails
[![Gem Version](https://badge.fury.io/rb/scryfall.svg)](https://badge.fury.io/rb/scryfall)

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

## Usage

The Scryfall class will have class methods for each query on the Scryfall API. The methods will reflect their path on the official Scryfall API, following the logic of `Scryfall::<HTTP METHOD>_<PATH IN SNAKE CASE>_<VARIATION>`

At first, there are only a few methods available:

# Cards Named (fuzzy and exact)

It searches for cards named almost as the string passed (fuzzy), or with the exact name as the string passed (exact)

```ruby
# Fuzzy
Scryfall::get_cards_named_fuzzy "aust commd"

# Exact
Scryfall::get_cards_named_exact "Counterspell"
```

# Search Query

It can search a list of cards using the Scryfall syntax

```ruby
# The search will return all the cards that fits on the query parameters
Scryfall::get_cards_search "f:standard t:land id:UW"

# It can be passed the page of the search. Each page of data has a maximum of 175 cards
Scryfall::get_cards_search "f:standard t:creature", page: 2
```

## Response

The default response for all calls are JSON. If a `is_struct: true` is passed as argument, the return will be a `OpenStruct` Hash object.