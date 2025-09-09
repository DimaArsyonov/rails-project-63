# frozen_string_literal: true

require_relative 'tag'

module HexletCode
  # FormRenderer — class responsible for rendering final data from FormBuilder
  class FormRenderer
    def self.input_for_html(input)
      label_html = Tag.build('label', for: input[:name]) { input[:name].to_s.capitalize }

      tag_class = "HexletCode::Tags::#{input[:as].to_s.capitalize}".constantize
      input_html = tag_class.build(input[:name], input[:value], input[:attrs])

      "#{label_html}#{input_html}"
    end

    def self.render_html(form_builder)
      body_html = []
      form_body = form_builder.form_body
      form_body[:inputs].map { |input| body_html << input_for_html(input) }

      body_html << Tag.build('input', type: 'submit', **form_body[:submit][:options]) if form_body[:submit][:options]

      Tag.build('form', form_builder.form_body[:form_options]) { body_html.join }
    end
  end
end
