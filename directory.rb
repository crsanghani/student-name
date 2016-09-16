
#get user input to generate a list of students
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  #create an empty array
  students = []

  #get the first name
  name = gets.chomp

  #while the name is not empty, repeat this code
  while !name.empty? do

    #adds a student hash to the arrary
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"

    #get another name from the user
    name = gets.chomp
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
  students.each_with_index do |student, index|
    puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

#print the total number of students
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

#calling the methods
students = input_students
print_header
print(students)
print_footer(students)
