# frozen_string_literal: true

require_relative 'tag'

module HexletCode
  # FormRenderer — class responsible for rendering final data from FormBuilder
  class FormRenderer
    def self.render_html(form_builder)
      body_html = []
      form_body = form_builder.form_body
      form_body[:inputs].each do |input|
        label_html = Tag.build('label', for: input[:name]) { input[:name].to_s.capitalize }

        tag_class = "HexletCode::Tags::#{input[:as].to_s.capitalize}".constantize
        input_html = tag_class.build(input[:name], input[:value], input[:attrs])

        body_html << "#{label_html}\n#{input_html}"
      end

      body_html << Tag.build('input', type: 'submit', **form_body[:submit][:options]) if form_body[:submit][:options]

      Tag.build('form', form_builder.form_body[:form_options]) { body_html.join("\n") }
    end
  end
end
