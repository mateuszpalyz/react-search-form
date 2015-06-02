include FFaker

40.times do
  first_name = Name.first_name
  last_name = Name.last_name
  Person.create({first_name: first_name, last_name: last_name, email: "#{first_name.downcase}#{last_name.downcase}@example.com"})
end
