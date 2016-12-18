package ua.horbatiuk88.usermanager.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ua.horbatiuk88.usermanager.model.User;
import ua.horbatiuk88.usermanager.service.UserService;

@Controller
public class UserController {

    private static final Logger LOG = LoggerFactory.getLogger(UserController.class);

    @Autowired(required = true)
    @Qualifier(value = "userServiceImpl")
    private UserService userService;

    @RequestMapping(value = "/users/{pageNumber}", method = RequestMethod.GET)
    public String getAll(@PathVariable Integer pageNumber, Model model) {
        Page<User> page = this.userService.getAll(pageNumber);

        int current = page.getNumber() + 1;
        int begin = Math.max(1, current - 5);
        int end = Math.min(begin + 10, page.getTotalPages());

        model.addAttribute("userList", page);
        model.addAttribute("beginIndex", begin);
        model.addAttribute("endIndex", end);
        model.addAttribute("currentIndex", current);

        LOG.debug("successfully loaded all users");

        return "users";
    }

    @RequestMapping(value = "/user/delete/{id}/{pageNumber}")
    public String delete(@PathVariable("id") int id, @PathVariable("pageNumber") Integer pageNumber) {
        this.userService.delete(id);
        LOG.debug("successfully delete user with id {}", id);

        return "redirect:/users/" + pageNumber;
    }

    @RequestMapping(value = "/user/edit/{id}/{pageNumber}", method = RequestMethod.GET)
    public String edit(@PathVariable("id") int id, @PathVariable("pageNumber") Integer pageNumber, Model model) {
        model.addAttribute("user", this.userService.getById(id));
        model.addAttribute("pageNumber", pageNumber);

        return "editForm";
    }

    @RequestMapping(value = "/user/save/{pageNumber}", method = RequestMethod.POST)
    public String save(@PathVariable Integer pageNumber, @ModelAttribute("user") User user) {
        this.userService.save(user);
        LOG.debug("user successfully saved");

        return "redirect:/users/" + pageNumber;
    }

    @RequestMapping(value = "/user/findUser", method = RequestMethod.GET)
    public String getByName(@RequestParam("name") String name, Model model) {
        User foundUser = this.userService.getByName(name);
        if (foundUser == null) {
            model.addAttribute("name", name);
            return "noFoundUser";
        }
        model.addAttribute("user", foundUser);

        return "foundUser";
    }
}
