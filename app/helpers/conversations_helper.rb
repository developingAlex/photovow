module ConversationsHelper

  # given a logged in user and a conversation that that user is a part of
  # this function will return the other user involved in that conversation
  def other_conversation_participant(conversation)
    if conversation.sender == current_user
      conversation.recipient
    else
      conversation.sender
    end
  end

  # similar functionality as other_conversation_participant but returns 
  # the full name of the user instead of the user object itself.
  def other_conversation_participant_fullname(conversation)
    if conversation.sender == current_user
      conversation.recipient.fullname
    else
      conversation.sender.fullname
    end
  end

  # helper to determine if a message's author is the current user, for 
  # visual distinction between sender and reciever messages.
  
end
