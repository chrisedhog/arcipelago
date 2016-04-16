class Event < ActiveRecord::Base
  belongs_to :user

    has_many :group_events
    has_many :groups, through: :group_events
    
    validates :street, :suburb, :postcode, :state, presence: true
    
    geocoded_by :full_street_address
    after_validation :geocode
    
    acts_as_votable

    
    def full_street_address
        [street, suburb, state, postcode, country].compact.join(',') 
    end
    
end

