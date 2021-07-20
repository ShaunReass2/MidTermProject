package com.skilldistillery.Contracting.data;

import com.skilldistillery.Contracting.entities.Message;

public interface MessageDAO {

	Message createMessage(Message message, int id, int userId);
	Message editMessage(Message message, int messageId);

}
