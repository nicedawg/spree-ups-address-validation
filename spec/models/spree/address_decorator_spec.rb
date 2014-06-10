require 'spec_helper'

describe Spree::Address do
  describe "#validate_via_ups" do
    it "returns a response" do
      address = create(:address)
      response = address.validate_via_ups
      response.should be_a AddressValidator::Response
    end

    context "given a valid address" do
      it "response.valid? is true" do
        address = create(:address, address1: "360 E. 8th Ave", city: "Bowling Green", state: Spree::State.find_by(abbr: "KY"), zipcode: "42101")
        response = address.validate_via_ups
        response.valid?.should be_true
      end
    end

    context "given an invalid address" do
      it "response.valid? is false" do
        address = create(:address, address1: "360 E. 8th Ave", city: "Bowling Green", state: Spree::State.find_by(abbr: "KY"), zipcode: "90210")
        response = address.validate_via_ups
        response.valid?.should be_false
      end
    end
  end

end
