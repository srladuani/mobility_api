json.success  true

json.organizers @organizers do |organizer|
    json.id     organizer.id 
    json.name   organizer.name
    json.email  organizer.email
    json.phone  organizer.phone 
end
