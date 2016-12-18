package ua.horbatiuk88.usermanager.service;

import org.springframework.data.domain.Page;
import ua.horbatiuk88.usermanager.model.User;

import java.util.List;

public interface UserService {

    User getById(int id);

    List<User> getByName(String name);

    Page<User> getAll(int pageNumber);

    void delete(int id);

    User save(User user);

}
