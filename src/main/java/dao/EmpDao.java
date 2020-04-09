package dao;

import bean.Emp;

import java.util.List;

public interface EmpDao {
    //查询全部，分页查询
    List<Emp> findAll();
    //增加
    void addEmp(Emp emp);
    //修改前的查询
    Emp findEmpById(int id);
    //更新用户
    void updateEmp(Emp emp);
    //删除用户，当个删除
    void deleteById(int id);
}
