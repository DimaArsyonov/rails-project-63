# frozen_string_literal: true

module HexletCode
  module Tags
    # Input tag
    class Input
      TYPE = 'text'
      def self.build(name, value, attrs, &)
        final_attrs = attrs.except(attrs.key(value), 'type')
        HexletCode::Tag.build('input', { name: name, type: TYPE, value: value }.merge(final_attrs))
      end
    end
  end
end
