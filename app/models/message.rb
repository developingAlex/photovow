class Message < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :conversation

  def is_written_by(user)
    if self.author == user
      true
    else
      false
    end
  end
  
end
