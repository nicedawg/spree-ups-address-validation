module Spree
  Address.class_eval do

    def validate_via_ups
      address = AddressValidator::Address.new(
        name: full_name,
        street1: address1,
        city: city,
        state: state_text,
        zip: zipcode,
        country: country.try(:iso),
      )
      validator = AddressValidator::Validator.new
      response = validator.validate(address)
    end

  end
end
