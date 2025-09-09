# frozen_string_literal: true

require_relative 'hexlet_code/version'

# HexletCode — main module of my project, responsible for all processes of HTML form generation
module HexletCode
  class Error < StandardError; end
  autoload :FormBuilder, File.expand_path('hexlet_code/form_builder.rb', __dir__)
  autoload :FormRenderer, File.expand_path('hexlet_code/form_renderer.rb', __dir__)
  autoload :Tag, File.expand_path('hexlet_code/tag.rb', __dir__)
  autoload :Tags, File.expand_path('hexlet_code/tags/tags.rb', __dir__)

  def self.form_for(object, attributes = {})
    builded_form = FormBuilder.new(object, **attributes)
    yield(builded_form) if block_given?
    FormRenderer.render_html(builded_form)
  end
end
