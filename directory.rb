
#get user input to generate a list of students
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  #create an empty array
  students = []

  #get the first name
  name = gets.chomp.capitalize

  #while the name is not empty, repeat this code
  while !name.empty? do

    #adds a student hash to the arrary
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"

    #get another name from the user
    name = gets.chomp.capitalize
  end
  students
end


#print the array of students
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

#iterating through the array to list student names
def print(students)
  counter = 0
  until counter == students.length
    puts "#{counter + 1}. #{students[counter][:name]} (#{students[counter][:cohort]} cohort)"
    counter += 1
  end
end


#print the total number of students
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

#shows the students that begin with a certain letter only
def sort_students_by_letter(students)
  letter = "V"
  students_select = students.select{|student| student[:name][0] == letter}
  puts students_select
end

#shows the students that have less than 12 characters in their name
def sort_students_by_length(students)
  length = 12
  students_select = students.select{|student| student[:name].length < 12}
  puts students_select
end

#calling the methods
students = input_students
print_header
print(students)
print_footer(students)
