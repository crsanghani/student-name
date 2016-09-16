
#putting all the students in to an array
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]


#print the array of students
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

#iterating through the array to list student names
def print(names)
  names.each do |name|
    puts name
  end
end

#print the total number of students
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

#calling the methods

print_header
print(students)
print_footer(students)
