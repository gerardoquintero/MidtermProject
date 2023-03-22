package com.skilldistillery.bewitchedexcursions.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.bewitchedexcursions.entities.PrivateMessage;

@Transactional
@Service
public class PrivateMessageDAOImpl implements PrivateMessageDAO {

	@PersistenceContext
	private EntityManager em;
	@Override
	
	public PrivateMessage createPrivateMessage(PrivateMessage privateMessage) {
		em.persist(privateMessage);

		return privateMessage;
	}

	@Override
	public PrivateMessage findPrivateMessageById(int id) {
		return em.find(PrivateMessage.class, id);
	}

	@Override
	public List<PrivateMessage> findAllPrivateMessages() {
		String query = "SELECT privateMessage FROM PrivateMessage privateMessage WHERE privateMessage.enabled = 1";
		return em.createQuery(query, PrivateMessage.class).getResultList();
	}
	@Override
	public List<PrivateMessage> findPrivateMessagesBetweenUsers(int senderId, int recieverId) {
	    String query = "SELECT pm FROM PrivateMessage pm WHERE (pm.sender.id = :senderId AND pm.reciever.id = :recieverId) OR (pm.sender.id = :recieverId AND pm.reciever.id = :senderId)";
	    return em.createQuery(query, PrivateMessage.class)
	             .setParameter("senderId", senderId)
	             .setParameter("recieverId", recieverId)
	             .getResultList();
	}


	@Override
	public PrivateMessage updatePrivateMessage(PrivateMessage privateMessage) {
		return em.merge(privateMessage);
	}

	@Override
	public PrivateMessage archivePrivateMessage(int id) {
		PrivateMessage privateMessage = em.find(PrivateMessage.class, id);
		if (em.contains(privateMessage)) {
			privateMessage.setEnabled(false);
		}
		return privateMessage;
	}

}
