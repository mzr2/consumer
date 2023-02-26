package com.salt.controller;

import com.salt.Entity.ConsumerEntity;
import com.salt.service.ConsumerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/data")
public class ConsumerDataController {
    private final ConsumerService consumerService;

    @Autowired
    public ConsumerDataController(ConsumerService consumerService) {
        this.consumerService = consumerService;
    }

    @RequestMapping(value = "getdata", method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<Iterable<ConsumerEntity>> getData() {
        try {
            return new ResponseEntity<>(consumerService.getAll(), HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }
}
