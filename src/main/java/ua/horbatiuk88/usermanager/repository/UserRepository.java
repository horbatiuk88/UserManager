package ua.horbatiuk88.usermanager.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ua.horbatiuk88.usermanager.model.User;

public interface UserRepository extends JpaRepository<User, Integer> {

    @Query("select u from User u where u.name = :name")
    User getByName(@Param("name") String name);
}
