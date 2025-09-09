# frozen_string_literal: true

module HexletCode
  module Tags
    # Textarea tag
    class Text
      COLS = 20
      ROWS = 40
      def self.build(name, value, attrs)
        final_attrs = attrs.except(attrs.key(value))
        HexletCode::Tag.build('textarea', { name: name, cols: COLS, rows: ROWS }.merge(final_attrs)) { value }
      end
    end
  end
end
