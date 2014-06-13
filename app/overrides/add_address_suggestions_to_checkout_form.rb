Deface::Override.new(
  virtual_path: 'spree/checkout/edit',
  name: 'add_address_suggestions_to_checkout_form',
  insert_before: '[data-hook="checkout_header"]',
  partial: 'spree/address/suggestions',
)
