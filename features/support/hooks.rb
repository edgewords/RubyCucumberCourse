Before do
    #global variable to reference the 'world' object
    $world = self
    #driver variable for firefox webdriver
    @driver = Selenium::WebDriver.for :firefox
    # options = Selenium::WebDriver::Chrome::Options.new
    # options.add_argument('--ignore-certificate-errors')
    # options.add_argument('--disable-popup-blocking')
    # options.add_argument('--disable-translate')
    # @driver = Selenium::WebDriver.for :chrome, options: options

    #Implicit wait setup
    @driver.manage.timeouts.implicit_wait = 10
    @driver.manage.timeouts.page_load = 60
    @driver.manage.timeouts.script_timeout = 10
end

After do |scenro|
    if scenro.failed?
        resultFileName = Time.now.strftime("failshot__%d_%m_%Y__%H_%M_%S")+".png"
        @driver.save_screenshot("./results/" + resultFileName)
        #put screenshot into html results file
        embed "./results/" + resultFileName, "image/png"
    end
    @driver.quit
    #stop everything if we get a fail:
    Cucumber.wants_to_quit = true if scenro.failed?
end

