module ActiveAdmin
  module Views
    class GlobalizeAttributesTable < ActiveAdmin::Views::AttributesTable
      builder_method :globalize_attributes_table_for

      def row(attr, &block)
        I18n.available_locales.each_with_index do |locale, index|
          @table << tr do
            if index == 0
              th :rowspan => I18n.available_locales.length do
                header_content_for(attr)
              end
            end
            td do
              I18n.with_locale locale do
                locale.to_s + ': ' + content_for(block || attr)
              end
            end
          end
        end
      end

      protected

      def default_id_for_prefix
        'attributes_table'
      end

      def default_class_name
        'attributes_table'
      end

    end
  end
end
