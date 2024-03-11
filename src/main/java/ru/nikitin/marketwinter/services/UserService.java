package ru.nikitin.marketwinter.services;

import ru.nikitin.marketwinter.entites.SystemUser;
import ru.nikitin.marketwinter.entites.User;
import org.springframework.security.core.userdetails.UserDetailsService;

public interface UserService
//{
        extends UserDetailsService {
    User findByUserName(String username);
    boolean save(SystemUser systemUser);
}
