package dao;

import bean.User;

public interface UserDao {
    //注册前的查询
    String select(User user);
    //用户注册
    void addUser(User user);
    //用户登录
    User login(String name);
}
