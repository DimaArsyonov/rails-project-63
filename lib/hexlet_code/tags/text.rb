# frozen_string_literal: true

module HexletCode
  module Tags
    class Text
      autoload :Tag, File.expand_path("../tag.rb", __dir__)
      def self.build(name, value, attrs)
        final_attrs = attrs.except(attrs.key(value))
        HexletCode::Tag.build("textarea", { name: name }.merge(final_attrs)) { value }
      end
    end
  end
end
