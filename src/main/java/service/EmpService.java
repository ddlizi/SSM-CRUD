package service;

import bean.Emp;

import java.util.List;

public interface EmpService {
    List<Emp> findAll();
    void addEmp(Emp emp);
    Emp findEmpById(int id);
    void updateEmp(Emp emp);
    void deleteById(int id);
}
