# frozen_string_literal: true

module HexletCode
  module Tag
    def self.build(name, attrs = {})
      attributes = attrs.map { |key, value| "#{key}=\"#{value}\"" }.join(" ")
      attributes = " #{attributes}" unless attributes.empty?
      if block_given?
        "<#{name}#{attributes}>#{yield}</#{name}>"
      else
        "<#{name}#{attributes}></#{name}>"
      end
    end
  end
end
