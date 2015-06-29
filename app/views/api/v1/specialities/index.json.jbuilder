json.success  true

json.specialities @specialities do |speciality|
    json.id     speciality.id 
    json.name   speciality.name
end
