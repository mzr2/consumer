package com.salt.controller;

import com.salt.Entity.ConsumerEntity;
import com.salt.dto.Consumer;
import com.salt.service.ConsumerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ConsumerController {
    private final ConsumerService consumerService;

    @Autowired
    public ConsumerController(ConsumerService consumerService) {
        this.consumerService = consumerService;
    }

    @GetMapping(value = "/")
    public String page(ModelMap modelMap){
        Consumer consumer = new Consumer();
        modelMap.addAttribute("consumer", consumer);
        return "consumer";
    }

    @PostMapping(value = "add")
    public String addConsumer(@ModelAttribute("consumer") Consumer consumer){
        System.out.println(consumer);
        consumerService.registerConsumer(consumer);
        return "consumer";
    }
}
