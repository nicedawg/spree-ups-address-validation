module SpreeUpsAddressValidation
  module Generators
    class InstallGenerator < Rails::Generators::Base

      class_option :auto_run_migrations, :type => :boolean, :default => false

      source_root File.expand_path('../templates', __FILE__)

      def add_javascripts
        append_file 'vendor/assets/javascripts/spree/frontend/all.js', "//= require spree/frontend/spree_ups_address_validation\n"
        append_file 'vendor/assets/javascripts/spree/backend/all.js', "//= require spree/backend/spree_ups_address_validation\n"
      end

      def add_stylesheets
        inject_into_file 'vendor/assets/stylesheets/spree/frontend/all.css', " *= require spree/frontend/spree_ups_address_validation\n", :before => /\*\//, :verbose => true
        inject_into_file 'vendor/assets/stylesheets/spree/backend/all.css', " *= require spree/backend/spree_ups_address_validation\n", :before => /\*\//, :verbose => true
      end

      def add_files
        template 'config/initializers/spree_ups_address_validation.rb', 'config/initializers/spree_ups_address_validation.rb'
      end
    end
  end
end
