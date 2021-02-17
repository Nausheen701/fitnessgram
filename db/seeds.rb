# Instructor.create(name: 'test')

# find which part of faker I'll use

10.times do 
    Instructor.create(name: Faker::Name.name)
end

