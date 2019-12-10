
# exercise 1
puts "give me a number"
mynum = gets.chomp.to_i

mynumSq = mynum * mynum

puts mynumSq

# exercise final
class Calculator 

    def add (num1,num2)
        return (num1 + num2)
    end
    def sub (num1,num2)
        return (num1 - num2)
    end
    def divide (num1,num2)
        if num2 == 0
            puts "No division by zero allowed!"
            return 0
        else
            return (num1.to_f / num2.to_f)
        end
    end
end

calc =  Calculator.new
puts calc.divide(6,5)
