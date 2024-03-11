package ru.nikitin.marketwinter.repositories;

import ru.nikitin.marketwinter.entites.Category;
import ru.nikitin.marketwinter.entites.Product;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoryRepository extends CrudRepository<Category, Long> {
}
