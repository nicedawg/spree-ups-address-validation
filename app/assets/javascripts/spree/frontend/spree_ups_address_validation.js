// Placeholder manifest file.
// the installer will append this file to the app vendored assets here: vendor/assets/javascripts/spree/frontend/all.js'

$(document).ready(function () {

  $(".ups-address-validation-skip-container").on('change', function() {
    $("#order_skip_ups_validation").val( $("input[type=checkbox]", this).is(":checked") ? "1" : "0" );
  });

  $(".ups-address-validation-suggestion-use-this-one button").on('click', function() {

    var $suggestion = $(this).parents(".ups-address-validation-suggestion");

    var types = ['ship'];
    if ($("#order_use_billing").is(':checked')) {
      types.push('bill');
    }

    $.each(types, function(index, value) {
      $("#order_" + value + "_address_attributes_address1").val( $(".ups-address-validation-suggestion-street1", $suggestion).html() );
      $("#order_" + value + "_address_attributes_address2").val( $(".ups-address-validation-suggestion-street2", $suggestion).html() );
      $("#order_" + value + "_address_attributes_city").val( $(".ups-address-validation-suggestion-city", $suggestion).html() );

      var state_id = $(".ups-address-validation-suggestion-state", $suggestion).data('state-id');
      $("#order_" + value + "_address_attributes_state_id option[value=" + state_id + "]").attr('selected', 'selected');
      $("#order_" + value + "_address_attributes_state_id").trigger('change');

      $("#order_" + value + "_address_attributes_zipcode").val( $(".ups-address-validation-suggestion-zip", $suggestion).text() );
    });

    $('html, body').animate({
      scrollTop: $("#billing").offset().top - 90
    }, 1000);
  });
});
