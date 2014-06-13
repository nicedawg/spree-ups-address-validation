Deface::Override.new(
  virtual_path: 'spree/checkout/edit',
  name: 'add_address_suggestions_to_checkout_form',
  insert_before: '[data-hook="checkout_header"]',
  partial: 'spree/address/suggestions',
)

Deface::Override.new(
  virtual_path: 'spree/checkout/_address',
  name: 'add_skip_address_validation_hidden_field_to_checkout_form',
  insert_before: '[data-hook="billing_fieldset_wrapper"]',
  partial: 'spree/address/skip_address_validation_hidden_field',
)
