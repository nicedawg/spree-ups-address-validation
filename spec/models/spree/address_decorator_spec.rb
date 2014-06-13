require 'spec_helper'

describe Spree::Address do
  describe "#ups_response" do
    it "returns a response" do
      address = create(:address)
      response = address.ups_response
      response.should be_a AddressValidator::Response
    end

    context "given a valid address" do
      it "response.valid? is true" do
        address = create(:address, address1: "360 E. 8th Ave", city: "Bowling Green", state: Spree::State.find_by(abbr: "KY"), zipcode: "42101")
        response = address.ups_response
        response.valid?.should be_truthy
      end
    end

    context "given an invalid address" do
      it "response.valid? is false" do
        address = create(:address, address1: "360 E. 8th Ave", city: "Bowling Green", state: Spree::State.find_by(abbr: "KY"), zipcode: "90210")
        response = address.ups_response
        response.valid?.should be_falsey
      end
    end

    context "given an ambiguous address" do

      before :each do
        @address = create(:address, address1: "360 E. 8th Ave", city: "Bowling Green", state: Spree::State.find_by(abbr: "KY"), zipcode: "90210")
      end

      it "response.ambiguous? is true" do
        response = @address.ups_response
        response.ambiguous?.should be_truthy
      end

      it "has an array of suggested addresses" do
        response = @address.ups_response
        response.suggestions.should be_an Array
      end
    end
  end
end
