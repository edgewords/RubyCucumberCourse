
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
            return (num1 / num2)
        end
    end
end

calc =  Calculator.new
puts calc.divide(6,2)
