json.success  true

json.conferences @conferences do |conference|
    organizer_id = conference.organizer_id.present? ? conference.organizer_id : nil
    orgnanizer = Organizer.where(id: organizer_id).first
    orgnanizer_name = orgnanizer.present? ? orgnanizer.name : ""
    invitaion = conference.invitations.where(doctor_id: @user.id).first
    invitation_status = invitaion.present? ? invitation.status : ""
    json.id                    conference.id
    json.title                conference.topic.present? ? conference.topic.title : ""
    json.started_at           conference.start_date  
    json.ended_at             conference.end_date
    json.location             conference.location 
    json.organizer_id         conference.organizer_id
    json.organizer_name       orgnanizer_name  
    json.status               conference.conference_status 
    json.specialities         conference.get_specialities
    if @user.role.id.eql? Role::ROLE[:doctor]
        json.invitation_status    invitation_status
    end    
end
