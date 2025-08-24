# frozen_string_literal: true

require_relative "hexlet_code/version"

module HexletCode
  class Error < StandardError; end
  autoload :Tag, File.expand_path("hexlet_code/tag.rb", __dir__)

  def self.form_for(user, **attrs)
    url = attrs.delete(:url) || "#"
    Tag.build("form", action: url, method: "post", **attrs)
  end
end
