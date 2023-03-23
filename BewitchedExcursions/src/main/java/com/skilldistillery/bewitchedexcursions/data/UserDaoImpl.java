package com.skilldistillery.bewitchedexcursions.data;

import java.util.List;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.bewitchedexcursions.entities.User;

@Transactional
@Service
public class UserDaoImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public User login(User user) {
		String jpql = "SELECT u FROM User u WHERE u.username = :name AND u.password = :pass AND u.enabled = 1";

		try {
			user = em.createQuery(jpql, User.class).setParameter("name", user.getUsername())
					.setParameter("pass", user.getPassword()).getSingleResult();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			user = null;
		}
		return user;
	}

	@Override
	public User logout(User user) {
		String jpql = "SELECT u FROM User u WHERE u.username = :name AND u.password = :pass AND u.enabled = 1";

		try {
			user = em.createQuery(jpql, User.class).setParameter("name", user.getUsername())
					.setParameter("pass", user.getPassword()).getSingleResult();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			user = null;
		}
		return user;
	} 

	@Override
	public User createUser(User user) {
		user.setEnabled(true);
		em.persist(user);
		return user;
	}

	@Override
	public User getUserById(int id) {
		return em.find(User.class, id);

	}

	@Override
	public List<User> getAllUsers() {

		String jpql = ("SELECT u FROM User u WHERE u.enabled=1");

		return em.createQuery(jpql, User.class).getResultList();

	}

	@Override
	public User updateUser(User user) {
		User originalUser = em.find(User.class, user.getId());
		originalUser.setFirstName(user.getFirstName());
		originalUser.setLastName(user.getLastName());
		originalUser.setEmailAddress(user.getEmailAddress());
		originalUser.setBiography(user.getBiography());
		originalUser.setProfileImageUrl(user.getProfileImageUrl());
		originalUser.setPassword(user.getPassword());
		return originalUser;

	}

	@Override
	public User archiveUser(int id) {
		User user = em.find(User.class, id);
		if (em.contains(user)) {
			user.setEnabled(false);

		}
		return user;

	}
	
	@Override
	public List<User> searchUsers(String keyword) {
	    String jpql = "SELECT u FROM User u WHERE u.username LIKE :keyword AND u.enabled = 1";

		TypedQuery<User> query = em.createQuery(jpql, User.class);
		query.setParameter("keyword", "%" + keyword + "%");
		return query.getResultList();
	}


	@Override
	public User deleteUser(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User addFriend(User loggedInUser, int id) {
		// TODO Auto-generated method stub
		User user = em.find(User.class,id);
		loggedInUser = em.find(User.class,loggedInUser.getId());
		loggedInUser.getFriends().add(user);
		em.persist(loggedInUser);
		
		return loggedInUser;
	}
}
