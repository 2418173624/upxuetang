package com.up.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {
    @RequestMapping("/hello")
    public String users(){
        return "hello";
    }

    @RequestMapping("/new")
    public ModelAndView news(){
        ModelAndView mondelAndView=new ModelAndView();
        mondelAndView.setViewName("new");
        mondelAndView.addObject("nums",100);
        return mondelAndView;
    }
}
