# Setup

## Development Dependencies

* Ruby 3.0.1
* Postgres

## Configuration

Copy `config/database.yml.example` to `config/database.yml` and modify the database name, user
and password to match your database setup.

Copy `.ruby-version.example` to `.ruby-version`

Copy `.ruby-gemset.example` to `.ruby-gemset` and use as is or update the gemset name if you wish

## Sample Data Setup

After creating the datanse and running migration, run `rake sample_data:create_sample_urls` to create some sample URLs.

## Other Notes

* Rubocop - We are using rubocop as static code analyzer. Run `rubocop` to find out any offenses
* RSpec - run `rspec` to see if all test cases pass. In my environment, I noticed every once in awhile, one test case
fails due to uniqueness validation of long url token. But it goes away if you run `rspec` again
* Haml and Haml lint: We are using haml for views and linting can be performed with `haml-lint app/views/`

## TO-DOs

* Currently if you try to create a bew URL with a custom token which already exists, it will just ignore your given
custom token and generate a new unique one while creating the aliased URL
* Multiple short URLs can be created with the same long URL. Of course, the token will be different
* Can add more validation in model such as character limit etc.
* Need to add some design. Currently there is absolutely no design as my initial focus was to follow the best practices
and conventions of coding