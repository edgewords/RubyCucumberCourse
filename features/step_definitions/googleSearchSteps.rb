require "cucumber"
require "selenium-webdriver"
require "rspec/expectations"
#require_relative "../page_objects/googleSearchPOM"

#wait object for any required explicit waits
wait = Selenium::WebDriver::Wait.new(:timeout => 15)

Given(/(?:I|i) am on the Google web page/) do
    @driver.navigate.to "https://www.google.com" 
    wait.until { /Google/.match(@driver.page_source) }
    $world.puts "Browser has opened at Google.com"
  end
  
  #regualr exp capture group which will remove quotes
  # When(/I search for \"([^\"]*)\"/) do |search_term|
  #   element = @driver.find_element(name: 'q')
  #   element.send_keys search_term
  #   element.submit
  # end

  #example step using POM
  # When(/I search for \"([^\"]*)\"/) do |search_term|
  #   google = GoogleSearch.new(@driver)
  #   google.search_for_term (search_term)
  # end

  #example using page-objects gem
  When(/I search for \"([^\"]*)\"/) do |search_term|
     google = SearchPage.new(@driver)
     google.search_for_item (search_term)
   end
  
  #cucumber expression {string} simpler to use
  Then("{string} appears in the results") do |search_term|
    wait.until { @driver.find_element(link_text: 'Maps') }
    #sleep(5)
    bodyText = @driver.find_element(tag_name: 'Body').text;
    #Here is our rspec assertion:
    expect(bodyText).to include(search_term)
  end

  #Inline Table Example:
  Then("I see in the results") do |table|
    #ensure results page has loaded:
    wait.until { @driver.find_element(link_text: 'Maps') }
    # table is a Cucumber::MultilineArgument::DataTable
    #convert table to hash table
    data = table.hashes
    #loop through each row in the hash table and pull out the URL column value
    data.each do |row| #gives us {"search_term"=>"Edgewords", "url"=>"edgewordstraining.co.uk"}
      puts row["url"]
        bodyText = @driver.find_element(tag_name: 'Body').text;
        #Here is our rspec assertion against each value from the table:
        expect(bodyText).to include(row["url"])
    end
  end

