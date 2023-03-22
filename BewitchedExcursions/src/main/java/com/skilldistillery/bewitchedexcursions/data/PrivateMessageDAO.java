package com.skilldistillery.bewitchedexcursions.data;

import java.util.List;

import com.skilldistillery.bewitchedexcursions.entities.PrivateMessage;

public interface PrivateMessageDAO {

	public PrivateMessage createPrivateMessage(PrivateMessage privateMessage);

	public PrivateMessage findPrivateMessageById(int id);

	public List<PrivateMessage> findAllPrivateMessages();

	public PrivateMessage updatePrivateMessage(PrivateMessage privateMessage);

	public PrivateMessage archivePrivateMessage(int id);

	List<PrivateMessage> findPrivateMessagesBetweenUsers(int senderId, int recieverId);
}
