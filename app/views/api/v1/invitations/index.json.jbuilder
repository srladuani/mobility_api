json.success  true

json.invitations @invitations do |invitation|
    conference = invitation.conference
    json.invitation_id      invitation.id 
    json.conference_id        conference.id
    json.title                conference.topic.present? ? conference.topic.title : ""
    json.started_at           conference.start_date  
    json.ended_at             conference.end_date
    json.location             conference.location 
    json.organizer_id         conference.organizer.present? ? conference.organizer.id : "" 
    json.organizer_name       conference.organizer.present? ? conference.organizer.name : ""  
    json.status               conference.conference_status
    json.specialities         conference.get_specialities
    json.invitaion_status     invitation.status     
end
