json.success  true

json.delivered_orders @carts do |cart|
  venue = cart.four_square_venue
  if cart.is_order? && cart.is_delivered? && !cart.feed_back 
    has_paid = cart.cart_payment.present? ? true : false
    has_pato = cart.pato.present? ? true : false
    delivery_type = cart.delivery_type.present? ?  Cart::DELIVERY_TYPE.index(cart.delivery_type) : ""
    category = venue.present? ? venue.categories.collect{|c| c[:name]}.join(", ") : ""   
    json.id                         cart.id
    json.is_order                   cart.is_order
    json.is_ready                   cart.is_order_ready
    json.is_changed                 cart.is_changed
    json.is_delivered               cart.is_delivered 
    json.delivery_type              delivery_type 
    json.has_payment                has_paid 
    json.has_pato                   has_pato 
    json.four_square_id             venue.present? ? venue.four_square_id.to_s : ""
    json.name                       venue.present? ? venue.name.to_s : ""
    json.rating                     venue.present? ? venue.rating.to_s : ""
    json.categories                 category
    json.original_photo_url         venue.present? ? venue.original_photo_url.to_s : ""
    json.small_photo_url            venue.present? ? venue.small_photo_url.to_s : ""
    json.thumb_photo_url            venue.present? ? venue.thumb_photo_url.to_s : ""   
    json.second_original_photo_url  venue.present? ? venue.second_original_photo_url.to_s : ""
    json.second_small_photo_url     venue.present? ? venue.second_small_photo_url.to_s : ""
    json.second_thumb_photo_url     venue.present? ? venue.second_thumb_photo_url.to_s : ""   
  end
end


json.orders @carts do |cart|
  venue = cart.four_square_venue
  if cart.is_order? && !cart.is_delivered?
    has_paid = cart.cart_payment.present? ? true : false
    has_pato = cart.pato.present? ? true : false
    delivery_type = cart.delivery_type.present? ?  Cart::DELIVERY_TYPE.index(cart.delivery_type) : "" 
    category = venue.present? ? venue.categories.collect{|c| c[:name]}.join(", ") : ""    
    json.id                         cart.id
    json.is_order                   cart.is_order
    json.is_ready                   cart.is_order_ready
    json.is_changed                 cart.is_changed
    json.delivery_type              delivery_type 
    json.has_payment                has_paid
    json.is_delivered               cart.is_delivered  
    json.has_pato                   has_pato 
    json.four_square_id             venue.present? ? venue.four_square_id.to_s : ""
    json.name                       venue.present? ? venue.name.to_s : ""
    json.rating                     venue.present? ? venue.rating.to_s : ""
    json.categories                 category
    json.original_photo_url         venue.present? ? venue.original_photo_url.to_s : ""
    json.small_photo_url            venue.present? ? venue.small_photo_url.to_s : ""
    json.thumb_photo_url            venue.present? ? venue.thumb_photo_url.to_s : ""   
    json.second_original_photo_url  venue.present? ? venue.second_original_photo_url.to_s : ""
    json.second_small_photo_url     venue.present? ? venue.second_small_photo_url.to_s : ""
    json.second_thumb_photo_url     venue.present? ? venue.second_thumb_photo_url.to_s : ""    
  end
end

json.conferences @conferences do |conference|
    organizer_id = conference.organizer_id.present? ? conference.organizer_id : nil
    orgnanizer = Organizer.where(id: organizer_id).first
    orgnanizer_name = orgnanizer.present? ? orgnanizer.name : ""
    json.id                    conference.id
    json.title                conference.topic.present? ? conference.topic.title : ""
    json.started_at           conference.start_date  
    json.ended_at             conference.end_date
    json.location             conference.location 
    json.organizer_id         conference.organizer_id
    json.organizer_name       orgnanizer_name  
    json.status               conference.conference_status 
    json.specialities         conference.get_specialities
end
