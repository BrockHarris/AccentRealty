class Evaluation < ActiveRecord::Base
  attr_accessible :firstname, :lastname, :address, :city, :state, :zip, :email, :phone, :comments, :property_address, 
  								:property_city, :property_state, :property_zip, :property_type, :resident, :relationship, :bedrooms, 
  								:baths, :condition, :lotsize, :parking,:spaces, :listingstatus, :basement, :sellingdate, :heattype,
									:aircontype, :homestyle, :yearbuilt, :movingto, :fireplaces, :rooms, :sqfeet, :pool, :waterfront,
      						:waterview, :agentstatus, :current_agent_firstname, :current_agent_lastname, :request_agent_firstname,
   								:request_agent_lastname, :read, :response_subject, :response_body, :admin_id
end
