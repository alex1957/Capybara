require 'selenium-webdriver'
require 'capybara'

Capybara.run_server = false
Capybara.app_host = 'http://demos.kendoui.com'
@driver = Capybara::Session.new(:selenium)
File.open('/Users/alexmac/Capybara/CapybaraCucumber/data.txt', 'r').each_line do |line|
  given = line.chomp.split(',')
  actual = []
@driver.visit('/web/slider/index.html')

  (0..5).each do |i|
    if i == 0 # balance slider
      path = "//*[@id='wrapper']/div[1]/div/div/a"
    else # equalizer sliders
      path ="//*[@id='equalizer']/div[" + i.to_s + "]/div/div/a"
    end
    val = @driver.find(:xpath, path).native.attribute('aria-valuenow')
    while val.to_i < given[i].to_i
      @driver.find(:xpath,path).native.send_keys :arrow_up
      val = @driver.find(:xpath, path).native.attribute('aria-valuenow')
    end
    while val.to_i > given[i].to_i
      @driver.find(:xpath,path).native.send_keys :arrow_down
      val = @driver.find(:xpath, path).native.attribute('aria-valuenow')
    end
    actual << @driver.find(:xpath, path).native.attribute('aria-valuenow')
  end

  actual
end




#driver.element(:xpath,"//*[@id='wrapper']/div[1]/div/div/a").set(:arrow_right)
#driver.element(:xpath,"//*[@id='wrapper']/div[1]/div/div/a").send(:arrow_right)


#driver.click_button('gbqfb')

#'aria-valuenow'
#val =  link(:xpath => path).attribute_value('aria-valuenow')