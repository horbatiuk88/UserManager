package ua.horbatiuk88.usermanager.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ua.horbatiuk88.usermanager.model.User;
import ua.horbatiuk88.usermanager.service.UserService;

@Controller
public class UserController {

    private static final Logger LOG = LoggerFactory.getLogger(UserController.class);

    @Autowired(required = true)
    @Qualifier(value = "userServiceImpl")
    private UserService userService;

    @RequestMapping(value = "users", method = RequestMethod.GET)
    public String getAll(Model model) {
        model.addAttribute("userList", this.userService.getAll());
        LOG.debug("successfully loaded all users");

        return "users";
    }

    @RequestMapping(value = "/user/delete/{id}")
    public String delete(@PathVariable int id) {
        this.userService.delete(id);
        LOG.debug("successfully delete user with id {}", id);

        return "redirect:/users";
    }

    @RequestMapping(value = "/user/edit", method = RequestMethod.GET)
    public String edit(Model model) {

        return "redirect:/editForm";
    }

    @RequestMapping(value = "/user/save", method = RequestMethod.POST)
    public String save(@ModelAttribute("user") User user) {
        this.userService.save(user);
        LOG.debug("user successfully saved");

        return "redirect:/users";
    }


}
