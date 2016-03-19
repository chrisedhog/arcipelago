class Profile < ActiveRecord::Base
  belongs_to :user
    

    validates :first_name, :last_name, :dob, :gender, presence: true
    
    mount_uploader :profile_pic, ProfilePicUploader

end
