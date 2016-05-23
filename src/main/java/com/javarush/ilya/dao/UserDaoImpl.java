package com.javarush.ilya.dao;

import com.javarush.ilya.entity.User;
import com.javarush.ilya.util.HibernateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class UserDaoImpl implements UserDao{


    public UserDaoImpl() {
        System.out.println("UserDaoImpl()");
    }

    @Autowired
    private HibernateUtil hibernateUtil;

    @Override
    public int createUser(User user) {
        return (Integer) hibernateUtil.create(user);
    }

    @Override
    public User updateUser(User user) {
        user.setCreatedDate(user.getCreatedDate());
        return hibernateUtil.update(user);
    }

    @Override
    public void deleteUser(int id) {
            User user = new User();
            user.setId(id);
            hibernateUtil.delete(user);
    }

    @Override
    public List<User> getAllUsers() {
        return hibernateUtil.fetchAll(User.class);
    }

    @Override
    public User getUser(int id) {
        return hibernateUtil.fetchById(id, User.class);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<User> getAllUsers(String userName) {
        List<User> users = hibernateUtil.fetchAll(User.class);
        List<User> trueUsers = new ArrayList<>();
        for (User user :users) if (user.getName().equals(userName)) trueUsers.add(user);
        return trueUsers;
    }
}
