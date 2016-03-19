class Group < ActiveRecord::Base
    require 'csv'
    
  belongs_to :group_category
    has_many :memberships
    has_many :users, through: :memberships
    
    has_many :group_events
    has_many :events, through: :group_events  
    
    has_many :photos
    has_many :posts
    
       def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            
            group_hash = row.to_hash
            group = Group.where(id: group_hash["id"])
            
            if group.count == 1
                group.first.update_attributes(group_hash)
            else
                Group.create!(group_hash)
            end
        end
    end

    
end
