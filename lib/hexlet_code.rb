# frozen_string_literal: true

require_relative "hexlet_code/version"
require_relative "hexlet_code/tags/input"
require_relative "hexlet_code/tags/text"

# HexletCode — main module of my project, responsible for all processes of HTML form generation
module HexletCode
  class Error < StandardError; end
  autoload :Tag, File.expand_path("hexlet_code/tag.rb", __dir__)
  autoload :Form, File.expand_path("hexlet_code/form.rb", __dir__)

  def self.form_for(user, **attrs)
    form = Form.new(user)
    yield(form) if block_given?
    form.to_final_html(**attrs)
  end
end
