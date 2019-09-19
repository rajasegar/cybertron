# cybertron

[![Gem Version](https://badge.fury.io/rb/cybertron.svg)](https://badge.fury.io/rb/cybertron)

cybertron is a command line tool for generating, testing and publishing converters aka Codemods for Ruby.

**INFO**:
You can use a tool like [codeshift](https://github.com/rajasegar/codeshift) to run your codemods/transforms against your Ruby codebase.
For writing transforms you can also make use of the [Ruby AST Explorer](https://ruby-ast-explorer.herokuapp.com/)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cybertron'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cybertron

## Usage

### Create a new codemod project
```
$ cybertron new <project-name>
```
Example:

```
$ cybertron new my_ruby_codemod
```

### Generate a new transform
```
$ cd <project-name>
$ cybertron generate <transform-name>
```

Example:
```
$ cd my_ruby_codemod
$ cybertron generate my_transform
```

### Generate a new fixture for transform
```
$ cybertron generate <transform-name> <fixture-name>
```
Example:

```
$ cybertron generate my_transform advanced_usage
```

### Run tests for your codemod transforms
```
$ bundle exec rake
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rajasegar/cybertron. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Cybertron project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/cybertron/blob/master/CODE_OF_CONDUCT.md).
