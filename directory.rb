
def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"

  students = []

  name = gets.chomp

  while !name.empty? do
    students << {name: name, cohort: :November, cob: :Canada, height: :CuriouslySmall}
    if students.count == 1
    puts "Now we have #{students.count} student"
  else
    puts "Now we have #{students.count} students"
  end
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts '-------------'
end

def print(students)
students.each_with_index do |student, index|
  if student[:name][0].chr == 's' || student[:name][0].chr == 'S'
  puts "#{index+1}. #{student[:name].capitalize} (#{student[:cohort]} cohort). They are from #{student[:cob]} and #{student[:height]}."
  end
end
end

def print_footer(students)
puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
