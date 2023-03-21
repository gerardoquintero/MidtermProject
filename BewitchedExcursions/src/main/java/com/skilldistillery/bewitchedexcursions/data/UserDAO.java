package com.skilldistillery.bewitchedexcursions.data;

import java.util.List;

import com.skilldistillery.bewitchedexcursions.entities.User;

public interface UserDAO {

	public User login(User user);

	public User logout(User user);

	public User createUser(User user);

	public User getUserById(int Id);

	public List<User> getAllUsers();

	public User updateUser(int id,User user);

	public User archiveUser(int id);

	public User deleteUser(User user);

	List<User> searchUsers(String keyword);

}
