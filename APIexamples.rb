require 'httparty'
#require 'json'
# to install it, use: gem install httparty

# This demo uses a demo site: http://dummy.restapiexample.com/
# You can return different parts of the response using:
#puts response.body # {"id":"1","employee_name":"Abhi Deepak C","employee_salary":"1000","employee_age":"23","profile_image":""
#puts response.code # 200
#puts response.message # OK
#puts response.headers.inspect # <headers info>

# This creates a new record
 @result = HTTParty.post('http://dummy.restapiexample.com/api/v1/create', 
     :body => { :name => 'Bobalot', 
                :salary => '20000', 
                :age => '25', 
                :id => '2', 
              }.to_json,
     :headers => { 'Content-Type' => 'application/json' } )
 puts @result

# This updates an existing record
@result = HTTParty.put('http://dummy.restapiexample.com/api/v1/update/1', 
    :body => { :name => 'jonesy', 
               :salary => '20000', 
               :age => '25', 
             }.to_json,
    :headers => { 'Content-Type' => 'application/json' } )
puts @result

# Now fecth a record
response = HTTParty.get('http://dummy.restapiexample.com/api/v1/employee/1')
puts response.body 
