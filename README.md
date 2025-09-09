# HexletCode
![CI](https://github.com/DimaArsyonov/rails-project-63/actions/workflows/main.yml/badge.svg)
[![hexlet-check](https://github.com/DimaArsyonov/rails-project-63/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/DimaArsyonov/rails-project-63/actions/workflows/hexlet-check.yml)
Simple generator of HTML forms

## Installation

To start with my simple generator, you need to do following steps:


1) Add it to your Gemfile:

```bash
gem 'rails-project-63', git: 'https://github.com/DimaArsyonov/rails-project-63.git'
```
2) Run the following command to install it:

```bash
bundle install
```
Also you can install it manually:

```bash
git clone https://github.com/DimaArsyonov/rails-project-63.git
cd rails-project-63
bundle install
```

## Usage

Example of usage:

User = Struct.new(:name, :job, keyword_init: true)

user = User.new(name: "rob", job: "hexlet")

form = HexletCode.form_for user, url: "/users" do |f|
  f.input :name
  f.input :job, as: :text, rows: 50, cols: 50
end

puts form

Output:
<form action="/users" method="post">
  <input name="name" type="text" value="rob"></input>
  <textarea name="job" cols="50" rows="50">hexlet</textarea>
</form>

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` to open an interactive console with the gem loaded.

To install this gem onto your local machine, run `bundle exec rake install`.

This gem is not published on RubyGems. If you want to use it in another project, add it directly from GitHub in your Gemfile:

```bash
gem 'rails-project-63', git: 'https://github.com/DimaArsyonov/rails-project-63.git'
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/DimaArsyonov/rails-project-63. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/DimaArsyonov/rails-project-63/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the HexletCode project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/DimaArsyonov/rails-project-63/blob/master/CODE_OF_CONDUCT.md).
