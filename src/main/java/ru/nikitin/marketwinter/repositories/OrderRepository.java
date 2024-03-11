package ru.nikitin.marketwinter.repositories;

import ru.nikitin.marketwinter.entites.Order;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderRepository extends CrudRepository<Order, Long> {
}
