class Event < ActiveRecord::Base
  belongs_to :user
#    test
    has_many :groups_events
    has_many :groups, through: :group_events
end