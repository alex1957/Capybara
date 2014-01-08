(0..5).each do |i|
  if i == 0 # balance slider
    path = "//*[@id='wrapper']/div[1]/div/div/a"
  else # equalizer sliders
    path ="//*[@id='equalizer']/div[" + i.to_s + "]/div/div/a"
  end
  val = find(:xpath => path).native.attribute('aria-valuenow')
  while val.to_i < given[i].to_i
    find(:xpath,path).native.send_keys :arrow_up
    val = find(:xpath => path).native.attribute('aria-valuenow')
  end
  while val.to_i > given[i].to_i
    find(:xpath,path).native.send_keys :arrow_down
    val = find(:xpath => path).native.attribute('aria-valuenow')
  end
end

Capybara.run_server = false
Capybara.app_host = 'http://demos.kendoui.com'
Capybara.default_driver = :selenium
include RSpec::Matchers
include RSpec::Expectations


    if scenario.failed?
      fname = "#{Time.now}.png "
      save_screenshot fname
      #embed fname, 'image/png', 'SCREENSHOT'
    end
(0..5).each do |i|
  if i == 0 # balance slider
    path = "//*[@id='wrapper']/div[1]/div/div/a"
  else # equalizer sliders
    path ="//*[@id='equalizer']/div[" + i.to_s + "]/div/div/a"
  end
  actual << find(:xpath, path).native.attribute('aria-valuenow')
end