# frozen_string_literal: true

module HexletCode
  # Tag module
  module Tags
    autoload :Input, File.expand_path('input.rb', __dir__)
    autoload :Text,  File.expand_path('text.rb', __dir__)
  end
end
