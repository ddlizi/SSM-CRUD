package service;

import bean.User;

public interface UserService {
    String select(User user);
    void addUser(User user);
    User login(String name);
}
