class Enquiry < ActiveRecord::Base
    validates :email, :enquiry_type, :message, presence: true
end
