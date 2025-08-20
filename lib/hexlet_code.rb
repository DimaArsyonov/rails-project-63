# frozen_string_literal: true

require_relative "hexlet_code/version"

module HexletCode
  class Error < StandardError; end
  autoload :Tag, File.expand_path("hexlet_code/tag.rb", __dir__)
end
