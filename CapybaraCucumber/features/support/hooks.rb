
Before do

end


After do

  if scenario.failed?

    screenshot_path = '/Users/alexmac/Capybara/CapybaraCucumber/' + '#{Time.now}.png '
    puts screenshot_path
    save_screenshot(screenshot_path)
    #embed fname, 'image/png', 'SCREENSHOT'
  end


end