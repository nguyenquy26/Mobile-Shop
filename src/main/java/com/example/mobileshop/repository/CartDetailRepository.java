package com.example.mobileshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.mobileshop.domain.Cart;
import com.example.mobileshop.domain.CartDetail;
import com.example.mobileshop.domain.Product;

@Repository
public interface CartDetailRepository extends JpaRepository<CartDetail, Long> {
    boolean existsByCartAndProduct(Cart cart, Product product);

    CartDetail findByCartAndProduct(Cart cart, Product product);
}
