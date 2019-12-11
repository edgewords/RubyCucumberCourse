require 'httparty'
require 'json'
# to install it, use: gem install httparty

# This demo uses a demo site: http://dummy.restapiexample.com/
# You can return different parts of the response using:
#puts response.body # {"id":"1","employee_name":"Abhi Deepak C","employee_salary":"1000","employee_age":"23","profile_image":""
#puts response.code # 200
#puts response.message # OK
#puts response.headers.inspect # <headers info>

# This creates a new record
 result = HTTParty.post('http://dummy.restapiexample.com/api/v1/create', 
     :body => { :name => 'bertrun', 
                :salary => '20000', 
                :age => '25',  
              }.to_json,
     :headers => { 'Content-Type' => 'application/json' } )
  hashBody = JSON.parse(result)
  id = hashBody["id"]
  

# This updates an existing record
result = HTTParty.put('http://dummy.restapiexample.com/api/v1/update/' + id, 
    :body => { :name => 'jonesy', 
               :salary => '15000', 
               :age => '25', 
             }.to_json,
    :headers => { 'Content-Type' => 'application/json' } )
puts result

# Now fecth a record
response = HTTParty.get('http://dummy.restapiexample.com/api/v1/employee/' + id)

# now lets turn the JSON into a Ruby Hash
hashBody = JSON.parse(response.body) # {"id"=>"1", "employee_name"=>"jonesy", "employee_salary"=>"20000", "employee_age"=>"25", "profile_image"=>""}

puts "Here is the name of id #{id}:"
puts hashBody["employee_name"]

