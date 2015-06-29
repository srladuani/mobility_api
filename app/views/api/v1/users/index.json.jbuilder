json.success  true

json.doctors @doctors do |doctor|
    json.id     doctor.id 
    json.name   doctor.full_name
    json.email  doctor.email
    json.phone  doctor.phone
    json.country doctor.country
    json.role_id doctor.role_id 
end
