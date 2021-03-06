json.success  true

json.conferences @conferences do |conference|
    invitaion = conference.invitations.where(doctor_id: @user.id).first
    invitation_status = invitaion.present? ? invitation.status : ""
    json.id                   conference.id
    json.title                conference.topic.present? ? conference.topic.title : ""
    json.started_at           conference.start_date  
    json.ended_at             conference.end_date
    json.location             conference.location 
    json.organizer_id         conference.organizer.present? ? conference.organizer.id : "" 
    json.organizer_name       conference.organizer.present? ? conference.organizer.name : ""  
    json.status               conference.conference_status 
    json.specialities         conference.get_specialities
    if @user.role.id.eql? Role::ROLE[:doctor]
        json.invitation_status    invitation_status
    end    
end
