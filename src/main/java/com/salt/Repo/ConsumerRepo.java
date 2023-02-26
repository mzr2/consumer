package com.salt.Repo;

import com.salt.Entity.ConsumerEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ConsumerRepo extends JpaRepository<ConsumerEntity, Integer> {
}
