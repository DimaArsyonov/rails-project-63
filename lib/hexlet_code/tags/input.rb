# frozen_string_literal: true

module HexletCode
  module Tags
    # Input tag
    class Input
      autoload :Tag, File.expand_path('../tag.rb', __dir__)
      def self.build(name, value, attrs, &)
        final_attrs = attrs.except(attrs.key(value), 'type')
        HexletCode::Tag.build('input', { name: name, type: 'text', value: value }.merge(final_attrs))
      end
    end
  end
end
