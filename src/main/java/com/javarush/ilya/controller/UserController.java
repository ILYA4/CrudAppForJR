package com.javarush.ilya.controller;

import com.javarush.ilya.entity.User;
import com.javarush.ilya.service.UserService;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class UserController {

    private static final Logger logger = Logger.getLogger(UserController.class);

    public UserController() {
        System.out.println("UserController()");
    }


    @Autowired
    private UserService userService;

    @RequestMapping("createUser")
    public ModelAndView createUser(@ModelAttribute User user){
        logger.info("Creating user: "+user);
        return new ModelAndView("userForm");
    }
    @RequestMapping("editUser")
    public ModelAndView editUser(@RequestParam int id, @ModelAttribute User user){
        logger.info("Editing user: " +id+" "+user);
        user = userService.getUser(id);
        return new ModelAndView("userEditForm", "userObject", user);
    }

    @RequestMapping("saveUser")
    public ModelAndView saveUser(@ModelAttribute User user){
        logger.info("Saving user: "+user);
        if (user.getId()==0){
            userService.createUser(user);
        }else {userService.updateUser(user);}
        return new ModelAndView("redirect:getAllUsers");
    }

    @RequestMapping("deleteUser")
    public ModelAndView deleteUser(@RequestParam int id){
        logger.info("Deleting user with id: "+id);
        userService.deleteUser(id);
        return new ModelAndView("redirect:getAllUsers");
    }

    @RequestMapping(value = {"getAllUsers", "/"})
    public ModelAndView getAllUsers(@RequestParam (required = false) Integer page) {
        logger.info("Getting the all Users.");
        List<User> userList = userService.getAllUsers();
        ModelAndView modelAndView = new ModelAndView("userList");
        PagedListHolder<User> pagedListHolder =new PagedListHolder<>(userList);
        pagedListHolder.setPage(5);
        modelAndView.addObject("maxPages",pagedListHolder.getPageCount());

        if(page==null || page < 1 || page > pagedListHolder.getPageCount())page=1;

        modelAndView.addObject("page", page);
        if(page == null || page < 1 || page > pagedListHolder.getPageCount()){
            pagedListHolder.setPage(0);
            modelAndView.addObject("userList", pagedListHolder.getPageList());
        }
        else if(page <= pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(page-1);
            modelAndView.addObject("userList", pagedListHolder.getPageList());
        }

        return modelAndView;
    }

    @RequestMapping("searchUser")
    public ModelAndView searchUser(@RequestParam("searchName") String searchName){
        logger.info("Searching user with name: "+searchName);
        List<User> userList = userService.getAllUsers(searchName);
        return new ModelAndView("userList", "userList", userList);
    }

}
