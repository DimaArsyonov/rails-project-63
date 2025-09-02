# frozen_string_literal: true

require "yaml"
require_relative "tag"
require "active_support/core_ext/string/inflections"

CONFIG = YAML.load_file(File.expand_path("../../config/tags.yml", __dir__))

module HexletCode
  class Form
    def initialize(user)
      @user = user
      @fields_html = []
    end

    def collect_attrs(field_name, as, **attrs)
      cfg = CONFIG[as.to_s] || CONFIG["input"]
      defaults = cfg["defaults"] || {}

      final_attrs = defaults.merge(attrs)
      final_attrs[:name] = field_name

      final_attrs[:value] = @user.public_send(field_name)
      final_attrs
    end

    def input(field_name, as: :input, **attrs)
      final_attrs = collect_attrs(field_name, as, **attrs)
      tag = "HexletCode::Tags::#{as.to_s.capitalize}".constantize
      input_html = tag.build(field_name, final_attrs[:value], final_attrs) { final_attrs[:value].to_s }
      label_html = Tag.build("label", { for: field_name }) do
        field_name.to_s.capitalize
      end
      @fields_html << "#{label_html}#{input_html}"
    end

    def submit(value = "Save")
      @fields_html << Tag.build("input", { type: "submit", value: value })
    end

    def to_final_html(method: "post", **attrs)
      url = attrs.delete(:url) || "#"
      form_attrs = { action: url, method: method }.merge(attrs)
      Tag.build("form", form_attrs) do
        @fields_html.join
      end
    end
  end
end
