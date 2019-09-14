
def input_students
  puts "Please enter the name of the student".center(75)
  puts "To finish, just hit return twice".center(75)

  students = []

  name = gets.chop

  while !name.empty? do
    puts "Please enter the cohort".center(75)
    cohort = gets.chop
    if cohort.empty?
      cohort = "TBD"
    end

    students << {name: name, cohort: cohort}
    if students.count == 1
    puts "Now we have #{students.count} student".center(75)
  else
    puts "Now we have #{students.count} students".center(75)
  end
  puts "Please enter the name of the next student".center(75)
    name = gets.chop
  end
  students.sort_by{|student| student[:cohort]}
end


def print_header(students)
  if students.length > 0
  puts "The students of Villains Academy".center(75)
  puts '-------------'.center(75)
end
end

def print(students)
  if students.length > 0
students.each_with_index do |student, index|
  puts "#{index+1}. #{student[:name].capitalize} (#{student[:cohort].capitalize} cohort).".center(75)
end
else puts "No students".center(75)
end
end


def print_footer(students)
  if students.length > 0
puts "Overall, we have #{students.count} great students".center(75)
end
end

students = input_students
print_header(students)
print(students)
print_footer(students)
