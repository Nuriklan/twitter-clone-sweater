package com.sweater.sweater.repository;

import com.sweater.sweater.entity.Message;
import org.springframework.data.repository.CrudRepository;

public interface MessageRepository extends CrudRepository<Message, Integer> {
}
