
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
puts "The students of Villains Academy"
puts "-------------"

#iterating through the array to list student names
students.each do |student|
  puts student
end

#print the total number of students
puts "Overall, we have #{students.count} great students"
