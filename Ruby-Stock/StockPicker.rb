STOCK = [17,3,6,9,15,8,6,1,10]
result = []
def isProfitable?(a, b)
    return (a - b) > 0
end

def pickStock()
    STOCK.reduce({}){|accu, current| 
        STOCK.each do |x| 
            if(isProfitable?(x, current) && STOCK.index(x) > STOCK.index(current))
                accu.store([current,x], x - current)  
            end              
        end
        accu       
    }
end
result = pickStock().max_by{|k, v| v}
result.flatten! 
puts "Buy at #{result[0]} and sell at #{result[1]} for a profit of #{result[2]}"
