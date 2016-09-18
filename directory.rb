
require 'date'

#set students here for program persistence
@students = []
def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
    case_selection_feedback
  end
end

#refactored some long code in to this method
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the students to a file"
  puts "4. Load the students from a file"
  puts "9. Exit"
end

#refactored some long code in to this method
def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  @selection = selection
  #acts upon the selection
  case selection
    when "1" then input_students
    when "2" then show_students
    when "3" then request_filename(selection)
    when "4" then request_filename(selection)
    when "9" then exit
    else
      puts "I don't know what you meant, try again"
    end
end

#gives the user feedback about which choice they made in the selection process
def case_selection_feedback
  puts "You have selected #{@selection}"
end

#get user input to generate a list of students
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  name = STDIN.gets.capitalize.delete! "\n"  #get the first name without using chomp
  months = Date::MONTHNAMES.compact.map{|m| m.to_sym}#Uses the MONTHNAMES constant in Date to create an array of month names, these are then converted to symbols
  #while the name is not empty, repeat this code
  while !name.empty?

    #asking for a cohort value
    puts "Please specify which cohort the student will be joining. (Full Months only e.g November): "
    cohort = STDIN.gets.chomp.capitalize.to_sym

    #validates cohort value
    if !months.include?(cohort)
      puts "Sorry, that's not a valid input, please try again: "
      redo
    end

    #asking if the student has a hobby
    puts "Thanks! Does the student have any hobbies?"
    hobbies = STDIN.gets.chomp.capitalize.to_sym

    #adds a student hash to the arrary
    add_student(name, cohort, hobbies)
    puts "Now we have #{@students.count} students"

    #get another name from the user
    puts "Enter another name or finalize by hitting return again: "
    name = STDIN.gets.chomp.capitalize
  end
  @students
end

def add_student(name,cohort,hobbies)
  @students << {name: name, cohort: cohort, hobbies: hobbies.to_sym}
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
def print_students_list
  #this allows us to avoid printing an empty list if no students are added
  if @students.count > 0
    counter = 0
    until counter == @students.length
      puts "#{counter + 1}. #{@students[counter][:name]} (#{@students[counter][:cohort]} cohort)  Hobby: #{@students[counter][:hobbies]}".center(20)
      counter += 1
    end
    border
  else
    puts "No students were added, please re-run the program".center(20)
  end
end

#printing the students grouped by cohort
def cohort_print
  #this allows us to avoid printing an empty list if no students are added
  if @students.count > 0
    puts "Select which cohort you would like to see: ".center(20)
    cohort = STDIN.gets.chomp.capitalize.to_sym
    counter = 0
    #will print out the students that match the requested cohort
    @students.each do |student|
      if @student[:cohort] == cohort
        puts "#{counter + 1}. #{@students[counter][:name]} (#{@students[counter][:cohort]} cohort)  Hobby: #{@students[counter][:hobbies]}".center(20)
        counter =+ 1
      end
    end
  else
    puts "No students were added, please re-run the program".center(20)
  end
end

#print the total number of students
def print_footer
  puts "Overall, we have #{@students.count} great #{@students.count > 1 ? "students" : "student"}".center(20)
  border
end

#shows the students that begin with a certain letter only
def sort_students_by_letter
  letter = "V"
  students_select = @students.select{|student| @student[:name][0] == letter}
  puts students_select.center(20)
end

#shows the students that have less than 12 characters in their name
def sort_students_by_length
  length = 12
  students_select = @students.select{|student| @student[:name].length < 12}
  puts students_select.center(20)
end

def save_students(filename = "students.csv")
#open the file so we can write to it
  file = File.open(filename, "w")

#iterate over the students array
  @students.each do |student|
    student_data = [student[:name],student[:cohort],student[:hobbies]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "The file has been saved"
end

#load students from a hardcoded value
def load_students(filename = "students.csv")
  #opens the file with a read parameter
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort, hobbies = line.chomp.split(',')
    add_student(name, cohort, hobbies)
  end
  file.close
end

def request_filename(selection)
  puts "Please enter a filename: "
  filename = STDIN.gets.chomp
  selection == "3" ? save_students(filename) : load_students(filename)
end

def try_load_students
  filename = ARGV.first                               #first argument from the command line
  if filename.nil? then load_students                 #get out of method if it isn't given
  elsif File.exists?(filename)                        #checks to see if file exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else                                                #if the file doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

#call the method to start the program
try_load_students
interactive_menu
