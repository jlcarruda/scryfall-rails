require "scryfall/cards"

describe Scryfall::Cards do

	describe "Cards By Name" do
		before do
			@card_id = "fd99bce1-ce39-464b-8e61-2631eb3ed6f6"
		end

		it "should get a card by exact name" do
			resp = Scryfall::Cards.named_exact "Tolarian Academy"

			expect(resp["id"]).to eql(@card_id)
		end

		it "should get a card by fuzzy name" do
			resp = Scryfall::Cards.named_fuzzy "tolarianacademy"

			expect(resp["id"]).to eql(@card_id)
		end

		it "should get a list of cards by using search" do
			resp = Scryfall::Cards.search "t:land tolarianacademy"

			expect(resp["object"]).to eql("list")
			expect(resp["total_cards"]).to eql(1)
			expect(resp["data"][0]["id"]).to eql(@card_id)
		end
	end

	describe "Cards By IDs" do
		before do
			# Yargle's IDs
			@card_id = "645cfc1b-76f2-4823-9fb0-03cb009f8b32"
			@mtgo_id = 67691
			@arena_id = 67330
			@tcgplayer_id = 164756
		end

		it "should get a card by ID" do
			resp = Scryfall::Cards.with_id @card_id

			expect(resp["object"]).to eql("card")
			expect(resp["tcgplayer_id"]).to eql(@tcgplayer_id)
			expect(resp["mtgo_id"]).to eql(@mtgo_id)
			expect(resp["arena_id"]).to eql(@arena_id)
		end

		it "should get a card by its MTGO id" do
			resp = Scryfall::Cards.with_mtgo_id @mtgo_id

			expect(resp["id"]).to eql(@card_id)
			expect(resp["object"]).to eql("card")
			expect(resp["mtgo_id"]).to eql(@mtgo_id)
		end

		it "should get a card by its Arena id" do
			resp = Scryfall::Cards.with_arena_id @arena_id

			expect(resp["id"]).to eql(@card_id)
			expect(resp["object"]).to eql("card")
			expect(resp["arena_id"]).to eql(@arena_id)
		end

		it "should get a card by its TCG Player id" do
			resp = Scryfall::Cards.with_tcgplayer_id @tcgplayer_id

			expect(resp["id"]).to eql(@card_id)
			expect(resp["object"]).to eql("card")
			expect(resp["tcgplayer_id"]).to eql(@tcgplayer_id)
		end
	end
end
