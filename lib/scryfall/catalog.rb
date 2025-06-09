# frozen_string_literal: true

module Scryfall
  require 'scryfall/base'
  class Catalog < Base
    def self.card_names
      api.get '/catalog/card-names', {}
    end

    def self.artist_names
      api.get '/catalog/artist-names', {}
    end

    def self.word_bank
      api.get '/catalog/word-bank', {}
    end

    def self.supertypes
      api.get '/catalog/supertypes', {}
    end

    def self.card_types
      api.get '/catalog/card-types', {}
    end

    def self.artifact_types
      api.get '/catalog/artifact-types', {}
    end

    def self.battle_types
      api.get '/catalog/battle-types', {}
    end

    def self.creature_types
      api.get '/catalog/creature-types', {}
    end

    def self.enchantment_types
      api.get '/catalog/enchantment-types', {}
    end

    def self.land_types
      api.get '/catalog/land-types', {}
    end

    def self.planeswalker_types
      api.get '/catalog/planeswalker-types', {}
    end

    def self.spell_types
      api.get '/catalog/spell-types', {}
    end

    def self.powers
      api.get '/catalog/powers', {}
    end

    def self.toughnesses
      api.get '/catalog/toughnesses', {}
    end

    def self.loyalties
      api.get '/catalog/loyalties', {}
    end

    def self.keyword_abilities
      api.get '/catalog/keyword-abilities', {}
    end

    def self.keyword_actions
      api.get '/catalog/keyword-actions', {}
    end

    def self.ability_words
      api.get '/catalog/ability-words', {}
    end

    def self.flavor_words
      api.get '/catalog/flavor-words', {}
    end

    def self.watermarks
      api.get '/catalog/watermarks', {}
    end
  end
end
