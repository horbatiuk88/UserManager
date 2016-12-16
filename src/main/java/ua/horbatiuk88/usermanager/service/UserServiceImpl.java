package ua.horbatiuk88.usermanager.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.horbatiuk88.usermanager.model.User;
import ua.horbatiuk88.usermanager.repository.UserRepository;

import java.util.List;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    private static final Logger LOG = LoggerFactory.getLogger(UserServiceImpl.class);

    @Autowired
    private UserRepository userRepository;

    @Override
    public User getById(int id) {
        LOG.debug("getting user from repo with id {}", id);
        return this.userRepository.findOne(id);
    }

    @Override
    public User getByName(String name) {
        LOG.debug("getting user from repo with name {}", name);
        return this.userRepository.getByName(name);
    }

    @Override
    public List<User> getAll() {
        LOG.debug("getting all users from repo");
        return this.userRepository.findAll();
    }

    @Override
    public void delete(int id) {
        LOG.debug("deleting user with id {}", id);
        this.userRepository.delete(id);
    }

    @Override
    public User save(User user) {
        LOG.debug("saving user {}", user);
        return this.userRepository.save(user);
    }
}
