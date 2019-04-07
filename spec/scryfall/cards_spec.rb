require "scryfall"

describe Scryfall::Cards do
	scryfall = Scryfall::Cards.new

	it "should get card by exact name" do
		resp = scryfall.named_exact "Sol Ring"
		card_id = "83a0f2eb-2f6d-4aaa-b7a9-ea06d5de7eca"
		expect(resp).not_to eql(nil)
		expect(resp.id).to eql(card_id)
	end

	it "should get card by fuzzy name" do
		resp = scryfall.named_fuzzy "sl rin"
		expect(resp).not_to eql(nil)
	end
end