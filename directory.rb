
require 'date'

def interactive_menu
  #set students here for program persistence
  students = []
  loop do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"

    selection = gets.chomp
    #acts upon the selection
    case selection
      when "1"
        students = input_students
      when "2"
        print_header
        print(students)
        print_footer(students)
      when "9"
        exit
      else
        puts "I don't know what you meant, try again"
      end
  end
end

#get user input to generate a list of students
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  #create an empty array
  students = []

  #get the first name without using chomp
  name = gets.capitalize.delete! "\n"

  #Uses the MONTHNAMES constant in Date to create an array of month names, these are then converted to symbols
  months = Date::MONTHNAMES.compact.map{|m| m.to_sym}

  #while the name is not empty, repeat this code
  while !name.empty?

    #asking for a cohort value
    puts "Please specify which cohort the student will be joining. (Full Months only e.g November): "
    cohort = gets.chomp.capitalize.to_sym

    #validates cohort value
    if !months.include?(cohort)
      puts "Sorry, that's not a valid input, please try again: "
      redo
    end

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

#prints the header
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

  #this allows us to avoid printing an empty list if no students are added
  if students.count > 0
    counter = 0
    until counter == students.length
      puts "#{counter + 1}. #{students[counter][:name]} (#{students[counter][:cohort]} cohort)  Hobby: #{students[counter][:hobbies]}".center(20)
      counter += 1
    end
    border
  else
    puts "No students were added, please re-run the program".center(20)
  end
end

#printing the students grouped by cohort
def cohort_print(students)
  #this allows us to avoid printing an empty list if no students are added
  if students.count > 0
    puts "Select which cohort you would like to see: ".center(20)
    cohort = gets.chomp.capitalize.to_sym
    counter = 0
    #will print out the students that match the requested cohort
    students.each do |student|
      if student[:cohort] == cohort
        puts "#{counter + 1}. #{students[counter][:name]} (#{students[counter][:cohort]} cohort)  Hobby: #{students[counter][:hobbies]}".center(20)

        counter =+ 1
      end
    end
  else
    puts "No students were added, please re-run the program".center(20)
  end
end

#print the total number of students
def print_footer(students)
  puts "Overall, we have #{students.count} great #{students.count > 1 ? "students" : "student"}".center(20)
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
interactive_menu
