
CAPITAL_LETTERS = (65..90)
LOWER_LETTERS = (97..122)

#can add more tables for other symbols
$SECRETCODES = {:capital_letters => CAPITAL_LETTERS, :lower_letters => LOWER_LETTERS}


def get_secret_message()
    secret_string = ""
    move = nil
    until secret_string.size != 0
        puts "Write secret message"
        secret_string = gets.chomp
    end

    until /^[-+]?[0-9]*$/ === move
        puts "Move amount"
        move = gets.chomp
    end

    result = encrypt(secret_string, move.to_i);
    print result.map{|l| l.chr}.join("")
    puts 

end

def encrypt(string, move)    
    string.chars.reduce([]) {|accu, current| accu << conver_char_to_cipher(current, move)}
        
end

#returns the ascii value of the char +- move factor, if no ascii value found returns original char
def conver_char_to_cipher(char, move)

    code_set = get_encryptable_set(char.ord);
    range_sum = char.ord + move

    #if there is no ascii table for the character, returns the char
    if code_set.nil?
        return char
    end 

    if(range_sum > code_set.last) #from last to first
        code_set.to_a[(range_sum - (code_set.last + 1))]

        else(range_sum < code_set.first) #from first to last
            code_set.to_a[(range_sum - code_set.first)]
    end
end

#returns ascii array of CAPITAL_LETTERS or LOWER_LETTERS, nil if no array was found on hash
def get_encryptable_set(ascii)
    $SECRETCODES.select do |k, v|       
            if v.include?(ascii)
                return v
            end
    end
    nil
end

#get_secret_message()


#code no longer need
{
    # def convert_capital(char)
    #     range_sum = char.ord + 5
    
    #     (range_sum > CAPITAL_LETTERS.last ? 
    #         (CAPITAL_LETTERS.to_a[(range_sum - CAPITAL_LETTERS.last)]) :
    #         (range_sum))
    # end
    
    # def convert_lower(char)
    #     range_sum = char.ord + 5
    
    #     (range_sum > LOWER_LETTERS.last ? 
    #         (CAPITAL_LETTERS.to_a[(range_sum - CAPITAL_LETTERS.last)]) :
    #         (range_sum))
    # end

    # def convert_string()
    #     p $code.bytes.select{|n| is_capital?(n)}
    # end

    # def is_capital?(char)
    #     return (CAPITAL_LETTERS.include?(char.ord))
    # end
    
    # def is_lower?(char)
    #     return (LOWER_LETTERS.include?(char.ord))
    # end
}