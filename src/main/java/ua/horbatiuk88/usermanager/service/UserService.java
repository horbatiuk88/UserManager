package ua.horbatiuk88.usermanager.service;

import ua.horbatiuk88.usermanager.model.User;

import java.util.List;

public interface UserService {

    User getById(int id);

    User getByName(String name);

    List<User> getAll();

    void delete(int id);

    User save(User user);
}
