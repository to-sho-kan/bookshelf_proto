source 'https://rubygems.org'
ruby '2.1.5'

gem 'rails', '4.1.8'

gem 'rails-api'

gem 'spring', group: :development

group :test, :development do
  gem 'sqlite3'
end

group :production do
  gem 'pg'
  gem 'rails_12factor' # herokuデプロイ用
end

## 参考サイト
## http://qiita.com/yaotti/items/c6e850010f36acedb0e1http://qiita.com/yusabana/items/8ce54577d959bb085b37
## http://qiita.com/emadurandal/items/1062364905f89910297d

group :test, :development do
  gem 'pry-rails'
  gem 'pry-doc'
  gem 'pry-stack_explorer'

  gem 'better_errors'
  gem 'binding_of_caller'

  gem 'hirb'
  gem 'hirb-unicode'

  # gem 'tapp'
  # gem 'awesome_print'
  gem 'annotate'

  gem 'timecop'

  gem 'rspec-rails'
  gem 'factory_girl_rails'
  # gem 'database_cleaner'
  # gem 'database_rewinder

  gem 'guard-rails'
  gem 'guard-rspec', require: false
end

## Ruby Style Guide(ja)
## https://github.com/fortissimo1997/ruby-style-guide/blob/japanese/README.ja.md
gem 'rubocop', require: false

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano', :group => :development
