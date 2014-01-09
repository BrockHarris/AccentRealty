class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
    	t.string  :firstname
      t.string  :lastname
      t.string  :address
      t.string  :city
      t.string  :state
      t.string  :zip
      t.string  :email
      t.string  :phone
      t.text    :comments
      t.string  :property_address
      t.string  :property_city
      t.string  :property_state
      t.string  :property_zip
      t.string  :property_type
      t.string  :resident
      t.string  :relationship
      t.string  :bedrooms
      t.string  :baths
      t.string  :condition
      t.string  :lotsize
      t.string  :parking
      t.string  :spaces
      t.string  :listingstatus
      t.string  :basement
      t.string  :sellingdate
      t.string  :heattype
      t.string  :aircontype
      t.string  :homestyle
      t.string  :yearbuilt
      t.string  :movingto
      t.string  :fireplaces
      t.string  :rooms
      t.string  :sqfeet
      t.boolean :pool, :default=>false
      t.boolean :waterfront, :default=>false
      t.boolean :waterview, :default=>false
      t.string  :agentstatus
      t.string  :current_agent_firstname
      t.string  :current_agent_lastname
      t.string  :request_agent_firstname
      t.string  :request_agent_lastname
      t.boolean :read, :default=>false

      t.timestamps
    end
  end
end
