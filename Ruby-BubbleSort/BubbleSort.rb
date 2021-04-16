arr = [4,3,78,2,0,2]


translate = -> (i) {
    temp = arr[i]
    arr[i] = arr[i + 1]
    arr[i + 1] = temp
}


def bubble_sort(arr, translate)
    i = 0;
    limit = arr.size - 2
    checkArray = -> {print arr; puts}
    needSort = -> (a, b) {a > b}
    startOver = -> {
            print "pass ----------------- pass"
            puts
            limit -= 1
            i = 0
    }
  
    checkArray.()

    until limit === 0 do 
        if(needSort.(arr[i], arr[i + 1]))
            translate.(i)
            checkArray.()
        end
        i += 1      
        startOver.() if i > limit
    end  
end

bubble_sort(arr, translate)