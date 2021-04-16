dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substring(subS, dictionary)
    answer = Hash.new(0);
    dictionary.each do |word|
        if(subS.downcase[word])
            answer[word] = subS.downcase.scan(word).count
        end       
    end
    puts answer
end


substring("down", dictionary)
substring("Howdy partner, sit down! How's it going?", dictionary)
