package service.impl;

import bean.Emp;
import dao.EmpDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.EmpService;

import java.util.List;

@Service
public class EmpServiceImpl implements EmpService {
    @Autowired
    private EmpDao empDao;

    @Override
    public List<Emp> findAll() {
        return empDao.findAll();
    }

    @Override
    public void addEmp(Emp emp) {
      empDao.addEmp(emp);
    }

    @Override
    public Emp findEmpById(int id) {
        return empDao.findEmpById(id);
    }

    @Override
    public void updateEmp(Emp emp) {
        empDao.updateEmp(emp);
    }

    @Override
    public void deleteById(int id) {
        empDao.deleteById(id);
    }
}
