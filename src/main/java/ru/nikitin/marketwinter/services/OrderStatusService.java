package ru.nikitin.marketwinter.services;

import ru.nikitin.marketwinter.entites.OrderStatus;
import ru.nikitin.marketwinter.repositories.OrderRepository;
import ru.nikitin.marketwinter.repositories.OrderStatusRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderStatusService {
    private OrderStatusRepository orderStatusRepository;

    @Autowired
    public void setOrderStatusRepository(OrderStatusRepository orderStatusRepository) {
        this.orderStatusRepository = orderStatusRepository;
    }

    public OrderStatus getStatusById(Long id) {
        return orderStatusRepository.findById(id).orElse(null);
    }
}
