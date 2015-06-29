# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

if Role.count == 0
  role = Role.create([{name: 'Doctor'},{name: 'Moderator'}])
end

if Speciality.count == 0
  speciality = Speciality.create([
    {name: 'Abdominal Radiology'},
    {name: 'Addiction Psychiatry'},
    {name: 'Biochemical Genetics'},
    {name: 'Pain Medicine'}
    ])
end

if Organizer.count == 0
  organizers = Organizer.create([
    {name: 'Rashid', email:"rashid@gmail.com", phone:"432434534"},
    {name: 'Chanchal', email:"chanchal@gmail.com", phone:"4324345334"},
    {name: 'Vihsal', email:"vihsal@gmail.com", phone:"332434534"}
    ])
end  
