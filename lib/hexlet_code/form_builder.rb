# frozen_string_literal: true

require_relative 'tag'
require 'active_support/core_ext/string/inflections'

# HexletCode — main module of my project, responsible for all processes of HTML form generation
module HexletCode
  # FormBuilder — class responsible for form generation
  class FormBuilder
    attr_reader :form_body, :object

    def initialize(object, **attributes)
      @object = object

      action = attributes.fetch(:url, '#')
      method = attributes.fetch(:method, 'post')

      @form_body = {
        inputs: [],
        submit: { options: nil },
        form_options: { action:, method: }.merge(attributes.except(:url, :method))
      }
    end

    def input(field_name, as: :input, **attrs)
      value = @object.public_send(field_name)

      @form_body[:inputs] << {
        name: field_name,
        as:,
        value:,
        attrs:
      }
    end

    def submit(value = 'Save')
      @form_body[:submit][:options] = { value: }
    end
  end
end
