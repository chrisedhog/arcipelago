class Message < ActiveRecord::Base
    
    def self.reverse_order
        order(created_at: :desc)
    end
    
    def self.messages_to_me(user_id)
        where(receiver_id: user_id)
    end
    
    def self.unread
        where(read: false)
    end
    
end
