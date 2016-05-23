package com.javarush.ilya.dao;


import com.javarush.ilya.entity.User;

import java.util.List;

public interface UserDao {

    public int createUser(User user);
    public User updateUser(User user);
    public void deleteUser(int id);
    public List<User> getAllUsers();
    public User getUser(int id);
    public List<User> getAllUsers(String userName);



}
