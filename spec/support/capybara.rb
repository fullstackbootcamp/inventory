Capybara.register_driver(:chrome_headless) do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    'goog:chromeOptions' => {
      'args' => %w[--headless --disable-gpu --silent-launch --window-size=1280,1280]
    },
    'goog:loggingPrefs' => {
      'browser' => 'ALL',
      'driver' => 'WARNING'
    }
  )

  Capybara::Selenium::Driver.new(app, browser: :chrome, desired_capabilities: capabilities)
end

Capybara.register_driver(:chrome) do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

# Configure rspec to use drivers.
RSpec.configure do |config|
  # Use rack_test for system tests without JS
  config.before(:each, type: :system) do
    driven_by :rack_test
  end

  # Use selenium chrome headless for system tests having JS
  config.before(:each, type: :system, js: true) do
    driven_by :chrome_headless
  end

  config.before(:each, type: :system, chrome: true) do
    driven_by :chrome
  end

  # Log javascript errors to the console in the :chrome driver
  config.after(:each, type: :system, js: true, chrome: true) do
    errors = page.driver.browser.manage.logs.get(:browser)
    if errors.present?
      message = errors.map(&:message).join("\n")
      puts message
    end
  end

  # Clear the screenshot folder before the suite runs to make it
  # easier to see the failed screenshots.
  config.before(:suite) do
    directory = Rails.root.join('tmp/screenshots')
    FileUtils.remove_dir(directory) if File.directory?(directory)
  end
end
