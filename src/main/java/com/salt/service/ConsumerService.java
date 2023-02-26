package com.salt.service;

import com.salt.Entity.ConsumerEntity;
import com.salt.Repo.ConsumerRepo;
import com.salt.dto.Consumer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

@Service
public class ConsumerService {

    private final ConsumerRepo consumerRepo;

    @Autowired
    public ConsumerService(ConsumerRepo consumerRepo) {
        this.consumerRepo = consumerRepo;
    }


    public void registerConsumer(Consumer consumer){
        try {
            ConsumerEntity cEntity = new ConsumerEntity();
            cEntity.setNama(consumer.getNama());
            cEntity.setAlamat(consumer.getAlamat());
            cEntity.setKota(consumer.getKota());
            cEntity.setProvinsi(consumer.getProvinsi());
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            cEntity.setTglRegistrasi(sdf.parse(consumer.getTglRegistrasi()));
            cEntity.setStatus(consumer.getStatus());
            consumerRepo.save(cEntity);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
    }

    public List<ConsumerEntity> getAll(){
        return consumerRepo.findAll();
    }
}
