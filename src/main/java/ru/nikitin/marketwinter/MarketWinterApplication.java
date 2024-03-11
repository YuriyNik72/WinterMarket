package ru.nikitin.marketwinter;

import ru.nikitin.marketwinter.entites.ProductDTO;
import ru.nikitin.marketwinter.repositories.TestRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.util.ArrayList;
import java.util.List;

import static java.util.stream.Collectors.toCollection;

@SpringBootApplication
public class MarketWinterApplication implements CommandLineRunner {
	public static void main(String[] args) {
		SpringApplication.run(MarketWinterApplication.class, args);
	}

	private TestRepository repository;

	public MarketWinterApplication(@Autowired TestRepository repository) {
		this.repository = repository;
	}

	@Override
	public void run(String... args) throws Exception {
		List<ProductDTO> products = repository.getProducts(1).stream().collect(toCollection(ArrayList::new));
		System.out.println(products);
	}
}