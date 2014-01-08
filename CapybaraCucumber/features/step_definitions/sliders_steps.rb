Given(/^I'm on a sliders page$/) do
  visit '/web/slider/index.html'
end

When(/^I set slider Balance to  "(.*?)" and Equalizer to  "(.*?)",  "(.*?)",  "(.*?)",  "(.*?)" ,  "(.*?)"$/) do |balance, slider_1, slider_2, slider_3, slider_4, slider_5|
  given = [balance, slider_1, slider_2, slider_3, slider_4, slider_5]
   #setting sliders to data
  (0..5).each do |i|
    if i == 0 # balance sliders
      path = "//*[@id='wrapper']/div[1]/div/div/a"
    else # equalizer sliders
      path ="//*[@id='equalizer']/div[" + i.to_s + "]/div/div/a"
    end
    val = find(:xpath, path).native.attribute('aria-valuenow')
    while val.to_i < given[i].to_i
      find(:xpath,path).native.send_keys :arrow_up
      val = find(:xpath, path).native.attribute('aria-valuenow')
    end
    while val.to_i > given[i].to_i
      find(:xpath,path).native.send_keys :arrow_down
      val = find(:xpath, path).native.attribute('aria-valuenow')
    end

  end
end
Then(/^I should read data from  Balance "(.*?)" and Equalizer  "(.*?)",  "(.*?)",  "(.*?)",  "(.*?)",  "(.*?)"$/) do |balance, slider_1, slider_2, slider_3, slider_4, slider_5|
  expected = [balance, slider_1, slider_2, slider_3, slider_4, slider_5]
  actual = []
  #reading data from sliders
  (0..5).each do |i|
    if i == 0 # balance slider
      path = "//*[@id='wrapper']/div[1]/div/div/a"
    else # equalizer sliders
      path ="//*[@id='equalizer']/div[" + i.to_s + "]/div/div/a"
    end
    actual << find(:xpath, path).native.attribute('aria-valuenow')
  end
  actual.should == expected
end