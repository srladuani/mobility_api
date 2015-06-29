json.success  true

json.suggested_topics @suggested_topics do |s_topic|
    json.id           s_topic.topic.id 
    json.title        s_topic.topic.title
    json.description  s_topic.topic.description 
    json.user_name    s_topic.user.present? ? _topic.user.full_name : "" 
end
