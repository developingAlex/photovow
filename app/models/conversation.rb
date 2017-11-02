class Conversation < ApplicationRecord
  belongs_to :sender_id, class_name: 'User'
  belongs_to :recipient_id, class_name: 'User'
  
  #this makes a .between class method of the Conversation class and if you feed it two users it will return a list of all conversations between those users
  scope :between, -> (sender, recipient) do
    where(sender: sender, recipient: recipient).or(
      where(recipient: sender, recipient: sender)
      )
    end
  end
end