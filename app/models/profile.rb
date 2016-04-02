class Profile < ActiveRecord::Base
  belongs_to :user
    
    validates :first_name, :last_name, :dob, :gender, presence: true
    
    mount_uploader :profile_pic, ProfilePicUploader
    
    extend FriendlyId
    friendly_id :full_name, use: :slugged
    
    def full_name
        [first_name, last_name].join(' ')
    end

end
