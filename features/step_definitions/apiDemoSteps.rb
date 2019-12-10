require "cucumber"
require "rspec/expectations"
require 'httparty'

# to install it, use: gem install httparty

# This demo uses a demo site: http://dummy.restapiexample.com/
# You can return different parts of the response using:
#puts response.body # {"id":"1","employee_name":"Abhi Deepak C","employee_salary":"1000","employee_age":"23","profile_image":""
#puts response.code # 200
#puts response.message # OK
#puts response.headers.inspect # <headers info>

When("I request API information on employee {string}") do |employeeID|
    response = HTTParty.get('http://dummy.restapiexample.com/api/v1/employee/'+employeeID)
    @responseCode = response.code
    puts @responseCode.class

    # below returns a string
    @strResponse = response.body # {"id":"1","employee_name":"Abhi Deepak C","employee_salary":"1000","employee_age":"23","profile_image":""
  end
  
  Then("The Customer Name is {string}") do |custName|
    expect(@responseCode).to eq(200) #check http response is OK (200)
    expect(@strResponse).to include(custName)
  end