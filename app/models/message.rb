class Message < ApplicationRecord
  belongs_to :recipient, class_name: 'User', foreign_key: 'reciever'
  belongs_to :sender, class_name: 'User', foreign_key: 'sender'
  scope :unread, -> { where read: false }
end
