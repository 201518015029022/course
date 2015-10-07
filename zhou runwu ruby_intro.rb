#Name:Zhou Runwu 
#Number:201518015029022
# When done, submit this entire file.

# Part 1

def sum arr
	_sum=0
	if arr.length==0 #return 0 if array is empty
		return 0
	else
		for i in 0...arr.length #sum if array isn't empty
			_sum+=arr[i]
		end
		return _sum
	end
end

def max_2_sum arr
	if arr.length==0   #return 0 if array is empty
		return 0
	elsif arr.length==1  #return the value if array is just one value
		return arr.at(0)
	else
		for i in 0..1  #exploit Bubble sort,the outermost cycle just need twice
			for j in 0...arr.length-1-i
				if arr.at(j)>arr.at(j+1)
					_temp=arr[j]
					arr[j]=arr[j+1]
					arr[j+1]=_temp
				end
			end
		end
		return arr.at(arr.length-1)+arr.at(arr.length-2)
	end
end

def sum_to_n? arr, n
	if arr.length<=1
                return false
	else
		flag=false  #two items sum to n ?
		for i in 0...arr.length-1
			for j in (i+1)...arr.length
				if arr[i]+arr[j]==n
					flag=true
					break
				end
			end
			if flag  #exist two item whose sum is  equal to n
				break
			end
		end
		if flag #return value
			return true
		else
			return false
		end
	end			
end

# Part 2

def hello(name)
	if name.empty?  #whether a string is empty
		return "name must be at least one char"
	else
		return "\'Hello,#{name}\'"
	end
end

def starts_with_consonant? s
	c1=97..122 #repserent a..z ASCII
        c2=65..90  #repserent A..Z ASCII
	c3=[97,101,105,111,117]#represent {a,e,i,o,u}ASCII
        c4=[65,69,73,79,85]#represent {A,E,I,O,U}ASCII
        if s.empty?
                return false
        else
	       fc=s.split(//)[0].ord  #extract first character
	       if (c1.include?(fc) or c2.include?(fc)) and !(c3.include?(fc)or   c4.include?(fc) )
		     return true
	       else
		     return false
	       end
        end
end

def binary_multiple_of_4? s
        arr=s.split(//)
	for i in 0...arr.length
		if arr[i]!='0' and arr[i]!='1'#meet condition,indicate the string is not binary string
			return false
		end
	end
	if arr.length<=2    #if length of string is less than or equal to 2,there are just 0 and 00 meet condition 
		if arr.length==1 and arr[0]=='0'
			return true
		elsif arr.length==2 and arr[0]=='0' and arr[1]=='0'
			return true
		else
			return false
		end
	elsif arr[arr.length-1]=='0' and arr[arr.length-2]=='0' #the last third bits are at least one of 1,last two all 0,meet condition
		flag=false
		for i in 0...arr.length#all is 0
			if arr[i]!='0'
				flag=true
				break
			end
		end
		if !flag#all 0 ,return true
			return true
		end
		count=0#count number of 1 of the last third
		for i in 0...arr.length-2
			if arr[i]=='1'
				count+=1
			end
		end
		if count>=1 
			return true
		end
	else
		return false
	end
end

# Part 3

class BookInStock
	def initialize(isbn,price)
		raise ArgumentError if isbn.empty? or price<=0
		@book_isbn=isbn
		@book_price=price
	rescue ArgumentError
		puts "error: isbn is empty or price is less than or equal to zero!"
	end
        def isbn=isbn
                @book_isbn=isbn
        end
        def price=price
                @book_price=price
        end
        def isbn
                return @book_isbn
        end
        def price
                return @book_price
        end
	def price_as_string()
		return format("$%0.2f",@book_price)
	end	
end
=begin
a1=Array[1,2,3,4,5]
puts "part1.1:#{sum a1}"
puts "part1.2:#{max_2_sum a1}"
puts "part1.3:#{sum_to_n? a1,5}"
puts "part2.1:#{hello 'dan'}"
puts "part2.2:#{starts_with_consonant? "asddd"}"
puts "part2.3:#{binary_multiple_of_4? "100000000000000000000000001"}"
book=BookInStock.new("87445",456)
puts BookInStock.new("87445",456).price_as_string()
book.isbn= "5445"
puts book.isbn
=end

