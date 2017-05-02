class MyClass

  attr_accessor :arr, :arr2, :hae, :file_entered, :file_output, :file

  def initialize
    @arr2 = ['bird', 3, 'cat', 1, 'dog', 2.71, :xpath, '2', 'mouse', 3.14, :css, 3, 'horse', '4', 'bird2']
    @arr = Array.new
    @hae = Hash.new
    @file_entered = String.new
    @file_output = String.new
  end

  #Opens file with input_name and writes it into array
  #look at saved link to change how files open with blocks
  def open_f
    puts "Enter name of a file to open:"
    @file_entered = gets.chomp
    @arr = File.open("files/#{@file_entered}.txt").readlines
  end

  def output_open(file)
    File.open("files/#{file}.txt", 'a')
  end

  #Request for output file name
  def write_f
    puts "Enter name of a file to write in:"
    @file_output = gets.chomp
  end

  #deleting \n from array elements
  def clean_newlines
    @arr.each do |x|
      x.gsub!(/\n/, '')
    end
  end

  #converting strings to correct type in array
   def convert_array
    @arr.each do |x|
        if x =~ /'/
          @arr[@arr.index(x)] = x.gsub!(/'/, '')
        elsif x =~ /^\d+.\d+$/
          @arr[@arr.index(x)] = x.to_f
        elsif x =~ /:/
          @arr[@arr.index(x)] = x.gsub!(/:/, '').to_sym
        elsif x =~ /^\d+$/
          @arr[@arr.index(x)] = x.to_i
        end
    end
     @arr.each do |x|
       puts "#{x} is #{x.class}"
     end
    end

  #3a - can return any type, duplicate 4 times after adding output into file
  def check_class(hurray, value)
    output_open(@file_output).print("#{value}: ")
    hurray.each do |x|
      if x.class.to_s == value
        output_open(@file_output).print("#{x} ") #it will write text into file
      end
    end
    output_open(@file_output).print("#{@arr1}\n\n")
  end

  # 4a, b, c, d - returns n-th element, can be cloned into b,c,d with changing index
  def first_elem(hur)
    output_open(@file_output).print("First element of array is: #{hur[0]}\n")
  end

  def second_elem(hur)
    output_open(@file_output).print("Second element of array is: #{hur[1]}\n")
  end

  def last_elem(hur)
    output_open(@file_output).print("Last element of array is: #{hur[-1]}\n")
  end

  def penultimate_elem(hur)
    output_open(@file_output).print("Penultimate element of array is: #{hur[-2]}\n")
  end

  #4e - returns last n elements, n value should be negative to work properly
  # !CREATE SCRIPT TO MAKE N VALUE  POSITIVE!
  def last_n_elems(hur, n)
    output_open(@file_output).print("Last #{n} elements of array are: ")
    while n < 0 do
      # puts hur[i]
      output_open(@file_output).print("#{hur[n]} ")
      n += 1
    end
    output_open(@file_output).print("\n")
  end

  #4f - returns first n elements
  # !CREATE SCRIPT TO TAKE N VALUE !
  def first_n_elems(hur, n)
    i=0
    output_open(@file_output).print("First #{n} elements of array are: ")
    while i < n do
      output_open(@file_output).print("#{hur[i]} ")
      i += 1
    end
    output_open(@file_output).print("\n")
  end

  #4g - returns elements with indexes from n to k
  def from_nk(hur, n, k)
    output_open(@file_output).print("Elements from #{n} to #{k} of array are: ")
    while n <= k do
      output_open(@file_output).print("#{hur[n]} ")
      n += 1
    end
    output_open(@file_output).print("\n")
  end

  #4k1 - returns every even value

  #WRITE WITH EACH METHOD INSTEAD!!!!
  def even_vals(hur)
    i = 0
    output_open(@file_output).print("Even values of array are: ")
    while i <= hur.length do
      if i.even?
        output_open(@file_output).print("#{hur[i]} ")
      end
      i += 1
    end

    output_open(@file_output).print("\n")
  end

  #4k2 - returns every odd value
  #WRITE WITH EACH METHOD INSTEAD!!!!
  def odd_vals(hur)
    i = 0
    output_open(@file_output).print("Odd values of array are: ")
    while i <= hur.length do
      if i.odd?
        output_open(@file_output).print("#{hur[i]} ")
      end
      i += 1
    end
    output_open(@file_output).print("\n")
  end

  #5 - creates hash from Array
  def array_to_hash(hur)
    output_open(@file_output).print("Hash is ")
    b = 0
    hur.each do |x|
      @hae["i#{b}"] = x
      b+=1
    end
    output_open(@file_output).print("#{@hae}")
    output_open(@file_output).print("\n")
  end
end

a = MyClass.new
a.open_f
a.write_f
a.clean_newlines
a.convert_array


a.check_class(a.arr, "Integer")
a.check_class(a.arr, "Float")
a.check_class(a.arr, "String")
a.check_class(a.arr, "Symbol")

a.first_elem(a.arr)
a.second_elem(a.arr)
a.last_elem(a.arr)
a.penultimate_elem(a.arr)
a.last_n_elems(a.arr, -3)
a.first_n_elems(a.arr, 3)
a.from_nk(a.arr, 3, 5)

a.even_vals(a.arr)
a.odd_vals(a.arr)

a.array_to_hash(a.arr)
