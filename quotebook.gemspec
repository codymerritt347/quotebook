# frozen_string_literal: true

require_relative './lib/quotebook/version'

Gem::Specification.new do |spec|
  spec.name    = 'quotebook'
  spec.version = Quotebook::Version

  spec.authors = ['codymerritt347']
  spec.email   = ['cody.merritt@icloud.com']

  spec.summary     = 'Discover, collect, and keep your favorite inspirational quotes.'
  spec.description = 'Quotebook is a CLI gem that collects 500 quotes from the QuoteGarden API.'
  spec.license     = 'MIT'
  spec.homepage    = 'https://github.com/codymerritt347/quotebook'

  spec.metadata = {
    'homepage_uri'      => spec.homepage
    'bug_tracker_uri'   => spec.homepage + '/issues',
    'changelog_uri'     => spec.homepage + '/blob/master/CHANGELOG.md',
    'documentation_uri' => 'https://github.com/codymerritt347/quotebook/blob/master/README.md',
    'source_code_uri'   => spec.homepage
  }

  spec.bindir      = 'bin'
  spec.executables = ['quotebook']
  spec.files       = Dir['lib/**/*'] # Dir['lib/**/{*,.*}']

  spec.required_ruby_version = '>= 2.4.0'

  spec.add_dependency 'pry'
  spec.add_dependency 'rake'
  spec.add_dependency 'httparty'
  spec.add_dependency 'net-http'
  spec.add_dependency 'tty-table'
  spec.add_dependency 'tty-prompt'
  spec.add_dependency 'tty-box'
  spec.add_dependency 'tty-font'
  spec.add_dependency 'colorize'
  spec.add_dependency 'table_print'
end