# frozen_string_literal: true

require 'scryfall/cards'
require 'scryfall/catalog'

describe Scryfall::Cards do
  describe 'Cards By Name' do
    before do
      @card_id = 'fd99bce1-ce39-464b-8e61-2631eb3ed6f6'
    end

    it 'should get a card by exact name' do
      resp = Scryfall::Cards.named_exact 'Tolarian Academy'

      expect(resp['id']).to eql(@card_id)
    end

    it 'should get a card by fuzzy name' do
      resp = Scryfall::Cards.named_fuzzy 'tolarianacademy'

      expect(resp['id']).to eql(@card_id)
    end

    it 'should get a list of cards by using search' do
      resp = Scryfall::Cards.search 't:land tolarianacademy'

      expect(resp['object']).to eql('list')
      expect(resp['total_cards']).to eql(1)
      expect(resp['data'][0]['id']).to eql(@card_id)
    end
  end

  describe 'Cards By IDs' do
    before do
      # Yargle's IDs
      @card_id = '645cfc1b-76f2-4823-9fb0-03cb009f8b32'
      @mtgo_id = 67_691
      @arena_id = 67_330
      @tcgplayer_id = 164_756
      @multiverse_id = 443001
      @cardmarket_id = 355353
    end

    it 'should get a card by ID' do
      resp = Scryfall::Cards.with_id @card_id

      expect(resp['object']).to eql('card')
      expect(resp['tcgplayer_id']).to eql(@tcgplayer_id)
      expect(resp['mtgo_id']).to eql(@mtgo_id)
      expect(resp['arena_id']).to eql(@arena_id)
      expect(resp['multiverse_ids']).to include(@multiverse_id)
      expect(resp['cardmarket_id']).to eql(@cardmarket_id)
    end

    it 'should get a card by its MTGO id' do
      resp = Scryfall::Cards.with_mtgo_id @mtgo_id

      expect(resp['id']).to eql(@card_id)
      expect(resp['object']).to eql('card')
      expect(resp['mtgo_id']).to eql(@mtgo_id)
    end

    it 'should get a card by its Arena id' do
      resp = Scryfall::Cards.with_arena_id @arena_id

      expect(resp['id']).to eql(@card_id)
      expect(resp['object']).to eql('card')
      expect(resp['arena_id']).to eql(@arena_id)
    end

    it 'should get a card by its TCG Player id' do
      resp = Scryfall::Cards.with_tcgplayer_id @tcgplayer_id

      expect(resp['id']).to eql(@card_id)
      expect(resp['object']).to eql('card')
      expect(resp['tcgplayer_id']).to eql(@tcgplayer_id)
    end

    it 'should get a card by its Multiverse id' do
      resp = Scryfall::Cards.with_multiverse_id @multiverse_id

      expect(resp['id']).to eql(@card_id)
      expect(resp['object']).to eql('card')
      expect(resp['multiverse_ids']).to include(@multiverse_id)
    end

    it 'should get a card by its Cardmarket id' do
      resp = Scryfall::Cards.with_cardmarket_id @cardmarket_id

      expect(resp['id']).to eql(@card_id)
      expect(resp['object']).to eql('card')
      expect(resp['cardmarket_id']).to eql(@cardmarket_id)
    end
  end

  describe 'Catalog' do
    it 'should get a list of card names' do
      resp = Scryfall::Catalog.card_names

      expect(resp['object']).to eql('catalog')
      expect(resp['data']).to include('Tolarian Academy')
    end

    it 'should get a list of artist names' do
      resp = Scryfall::Catalog.artist_names

      expect(resp['object']).to eql('catalog')
      expect(resp['data']).to include('Mark Poole')
    end

    it 'should get a list of word bank' do
      resp = Scryfall::Catalog.word_bank

      expect(resp['object']).to eql('catalog')
      expect(resp['data']).to include('flying')
    end

    it 'should get a list of supertypes' do
      resp = Scryfall::Catalog.supertypes

      expect(resp['object']).to eql('catalog')
      expect(resp['data']).to include('Basic')
    end

    it 'should get a list of card types' do
      resp = Scryfall::Catalog.card_types

      expect(resp['object']).to eql('catalog')
      expect(resp['data']).to include('Creature')
    end

    it 'should get a list of artifact types' do
      resp = Scryfall::Catalog.artifact_types

      expect(resp['object']).to eql('catalog')
      expect(resp['data']).to include('Equipment')
    end

    it 'should get a list of battle types' do
      resp = Scryfall::Catalog.battle_types

      expect(resp['object']).to eql('catalog')
      expect(resp['data']).to include('Siege')
    end

    it 'should get a list of creature types' do
      resp = Scryfall::Catalog.creature_types

      expect(resp['object']).to eql('catalog')
      expect(resp['data']).to include('Human')
    end

    it 'should get a list of enchantment types' do
      resp = Scryfall::Catalog.enchantment_types

      expect(resp['object']).to eql('catalog')
      expect(resp['data']).to include('Aura')
    end

    it 'should get a list of land types' do
      resp = Scryfall::Catalog.land_types

      expect(resp['object']).to eql('catalog')
      expect(resp['data']).to include('Plains')
    end

    it 'should get a list of planeswalker types' do
      resp = Scryfall::Catalog.planeswalker_types

      expect(resp['object']).to eql('catalog')
      expect(resp['data']).to include('Ajani')
    end

    it 'should get a list of spell types' do
      resp = Scryfall::Catalog.spell_types

      expect(resp['object']).to eql('catalog')
      expect(resp['data']).to include('Arcane')
    end

    it 'should get a list of powers' do
      resp = Scryfall::Catalog.powers

      expect(resp['object']).to eql('catalog')
      expect(resp['data']).to include('1')
    end

    it 'should get a list of toughnesses' do
      resp = Scryfall::Catalog.toughnesses

      expect(resp['object']).to eql('catalog')
      expect(resp['data']).to include('1')
    end

    it 'should get a list of loyalties' do
      resp = Scryfall::Catalog.loyalties

      expect(resp['object']).to eql('catalog')
      expect(resp['data']).to include('1')
    end

    it 'should get a list of keyword abilities' do
      resp = Scryfall::Catalog.keyword_abilities

      expect(resp['object']).to eql('catalog')
      expect(resp['data']).to include('Deathtouch')
    end

    it 'should get a list of keyword actions' do
      resp = Scryfall::Catalog.keyword_actions

      expect(resp['object']).to eql('catalog')
      expect(resp['data']).to include('Amass')
    end

    it 'should get a list of ability words' do
      resp = Scryfall::Catalog.ability_words

      expect(resp['object']).to eql('catalog')
      expect(resp['data']).to include('Battalion')
    end

    it 'should get a list of flavor words' do
      resp = Scryfall::Catalog.flavor_words

      expect(resp['object']).to eql('catalog')
      expect(resp['data']).to include('Allies')
    end

    it 'should get a list of watermarks' do
      resp = Scryfall::Catalog.watermarks

      expect(resp['object']).to eql('catalog')
      expect(resp['data']).to include('azorius')
    end
  end
end
