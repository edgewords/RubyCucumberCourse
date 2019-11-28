require "selenium-webdriver"

class GoogleSearch

    # Constants that hold hashes of our locators
    SEARCH_BOX = {name: 'q'}
    SUBMIT_SEARCH = {name: 'btnK'}

    attr_reader :driver

    # take in the driver object
    def initialize(driver)
      @driver = driver
    end

    def search_for_term (term)
        element = @driver.find_element(SEARCH_BOX)
        element.send_keys term
        element.submit
    end
end

