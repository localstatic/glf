source 'https://rubygems.org'

gem 'rails', '~>3.2.13'
gem 'bootstrap-sass'
gem 'bcrypt-ruby'
gem 'faker'
gem 'will_paginate'
gem 'bootstrap-will_paginate'
gem 'devise'
gem 'cancan'

gem 'mysql2'

group :development, :test do
#  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'spork'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :development do
  gem 'annotate'
end

group :test do
  gem 'capybara', '1.1.2'

  # MacOSX-specific gems
  gem 'rb-fsevent', :require => false
  gem 'terminal-notifier-guard'

  gem 'factory_girl_rails'

end

#group :production do
#end
