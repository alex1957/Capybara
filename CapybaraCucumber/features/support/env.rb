require 'selenium-webdriver'
require 'capybara'
require 'capybara/cucumber'
require 'rspec'
require 'cucumber'

World do

  Capybara.run_server = false
  Capybara.app_host = 'http://demos.kendoui.com'
  Capybara.default_driver = :selenium
  include RSpec::Matchers
  include RSpec::Expectations

  at_exit do

  end

end
