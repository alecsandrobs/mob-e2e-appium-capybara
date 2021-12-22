require 'allure-cucumber'
require 'appium_capybara'
require 'capybara/rspec'
require 'cucumber'
require 'rspec'

REPORT_PATH = 'report'
JSON_PATH = "#{REPORT_PATH}/cucumber_json"
OS = case RUBY_PLATFORM
    when /win32/
    when /x64-mingw32/ then
        'windows'
    when /linux/ then
        'linux'
    when /darwin/ then
        'ios'
    else
        fail("Unknown operational system! (#{RUBY_PLATFORM})")
end

FileUtils.mkdir_p JSON_PATH unless File.exists?(JSON_PATH)

AllureCucumber.configure do |config|
    config.results_directory = REPORT_PATH
    config.clean_results_directory = true
    config.logging_level = Logger::INFO
    config.environment_properties = {
        os: OS
    }
end

ENVIRONMENT = ENV['ENV'].nil? ? 'android_emulator' : ENV['ENV']
CONFG_ENV = YAML.load_file(File.join(File.dirname(__FILE__), "environments/#{ENVIRONMENT}.yml"))

Capybara.register_driver(:appium) do |app|
    Appium::Capybara::Driver.new app, CONFG_ENV
end

Capybara.default_driver = :appium
Capybara.current_session.driver

$capybara = Capybara.current_session.driver
$driver = $capybara.appium_driver