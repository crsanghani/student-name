
require 'date'

#get user input to generate a list of students
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  #create an empty array
  students = []

  #get the first name
  name = gets.chomp.capitalize

  #Uses the MONTHNAMES constant in Date to create an array of month names, these are then converted to symbols
  months = Date::MONTHNAMES.compact.map{|m| m.to_sym}

  #while the name is not empty, repeat this code
  while !name.empty? do

    #asking for a cohort value
    puts "Please specify which cohort the student will be joining. (Full Months only e.g November): "
    cohort = gets.chomp.capitalize

    #asking if the student has a hobby
    puts "Thanks! Does the student have any hobbies?"
    hobbies = gets.chomp.capitalize

    #adds a student hash to the arrary
    students << {name: name, cohort: cohort, hobbies: hobbies}
    puts "Now we have #{students.count} students"

    #get another name from the user
    puts "Enter another name or finalize by hitting return again: "
    name = gets.chomp.capitalize
  end
  students
end

#print the array of students
def print_header
  puts "The students of Villains Academy".center(20)
  border
end

#a centered line break to help with clarity
def border
  puts "-------------".center(20)
end

#iterating through the array to list student names
def print(students)
  counter = 0
  until counter == students.length
    puts "#{counter + 1}. #{students[counter][:name]} (#{students[counter][:cohort]} cohort)  Hobby: #{students[counter][:hobbies]}".center(20)
    counter += 1
  end
  border
end


#print the total number of students
def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(20)
  border
end

#shows the students that begin with a certain letter only
def sort_students_by_letter(students)
  letter = "V"
  students_select = students.select{|student| student[:name][0] == letter}
  puts students_select.center(20)
end

#shows the students that have less than 12 characters in their name
def sort_students_by_length(students)
  length = 12
  students_select = students.select{|student| student[:name].length < 12}
  puts students_select.center(20)
end

#calling the methods
students = input_students
print_header
print(students)
print_footer(students)
