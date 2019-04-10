require "cards"

describe Scryfall::Cards do

	describe "Cards API" do
		before do
			@card_id = "83a0f2eb-2f6d-4aaa-b7a9-ea06d5de7eca"
		end

		it "should get card by exact name" do
			resp = Scryfall::Cards.named_exact "Sol Ring"
			expect(resp["id"]).to eql(@card_id)
		end

		it "should get card by fuzzy name" do
			resp = Scryfall::Cards.named_fuzzy "solring"
			expect(resp["id"]).to eql(@card_id)
		end

		it "should get a card by using search" do
			resp = Scryfall::Cards.search "t:artifact solring"
			expect(resp["object"]).to eql("list")
			expect(resp["total_cards"]).to eql(1)
			expect(resp["data"][0]["id"]).to eql(@card_id)
		end
	end
end
