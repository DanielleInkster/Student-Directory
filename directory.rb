
def input_students
  puts "Please enter the name of the student".center(75)
  puts "To finish, just hit return twice".center(75)

  students = []

  name = gets.chomp

  while !name.empty? do
    puts "Please enter the cohort".center(75)
    cohort = gets.chomp
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
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy".center(75)
  puts '-------------'.center(75)
end

def print(students)
students.each_with_index do |student, index|
  puts "#{index+1}. #{student[:name].capitalize} (#{student[:cohort].capitalize} cohort).".center(75)
  end
end

def print_footer(students)
puts "Overall, we have #{students.count} great students".center(75)
end

students = input_students
print_header
print(students)
print_footer(students)
