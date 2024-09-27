require 'rails/generators'
require 'rails/generators/named_base'

module Alba
  module Generators
    class SerializerGenerator < Rails::Generators::NamedBase
      source_root File.expand_path('templates', __dir__)

      class_option :attributes, type: :array, default: [], desc: 'Attributes for the serializer'

      def create_serializer_file
        template 'serializer.rb.tt',
                 File.join('app/serializers', class_path, "#{file_name}_serializer.rb")
      end

      private

      def attributes_list
        options['attributes']
      end
    end
  end
end
