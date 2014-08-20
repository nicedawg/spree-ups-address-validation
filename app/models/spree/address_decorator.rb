module Spree
  Address.class_eval do

    @ups_response = nil
    @ups_suggestions = nil

    def ups_response
      @ups_response ||= get_ups_response
    end

    def ups_suggestions
      @ups_suggestions ||= ups_response.suggestions
    end

    def update_address_from_ups
      if ups_response.valid?
        update_from_ups(ups_response.address)
      end
    end

    private
      def get_ups_response
        address = AddressValidator::Address.new(
          name: full_name,
          street1: address1,
          street2: address2,
          city: city,
          state: state_text,
          zip: zipcode,
          country: country.try(:iso),
        )
        validator = AddressValidator::Validator.new
        validator.validate(address)
      end

      def update_from_ups(ups_address)
        address = ups_response.address

        self.address1 = address.street1
        self.address2 = address.street2
        self.city = address.city
        self.state = Spree::State.find_by(abbr: address.state)
        self.zipcode = [address.zip, address.zip_extended].join("-")
      end

  end
end
