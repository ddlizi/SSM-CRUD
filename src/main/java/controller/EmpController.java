package controller;

import bean.Emp;
import bean.Msg;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import service.EmpService;
import java.util.List;

@Controller
public class EmpController {
    @Autowired
    private EmpService empService;

    //查询全部，分页查询
    @RequestMapping(value = "/emps.do")
    public ModelAndView findAll(@RequestParam(value="page",defaultValue ="1") Integer page){
        //传入页码，以及每页的大小
        PageHelper.startPage(page,5);
        List<Emp> empList=empService.findAll();
        //查询的结果，连续显示的页数
        PageInfo pageInfo=new PageInfo(empList,5);
        ModelAndView mv=new ModelAndView();
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("list");
        return mv;
    }
    //增加员工
    @RequestMapping(value = "/emp.do",method = RequestMethod.POST)
    public String addEmp(Emp emp){
        empService.addEmp(emp);
        return "redirect:emps.do?page=999";
    }
    //修改前的查询
    @RequestMapping(value = "/emp.do",method = RequestMethod.GET)
    @ResponseBody
    public Msg findUserById(int id){
        Emp emp=empService.findEmpById(id);
        return Msg.seccess().add("emp",emp);
    }
    //修改员工信息
    @RequestMapping(value = "/emp.do",method = RequestMethod.PUT)
    public String updateEmp(Emp emp){
        empService.updateEmp(emp);
        return "redirect:emps.do";
    }
    //删除
    @RequestMapping(value = "/emp.do",method = RequestMethod.DELETE)
    public String deleteById(int id){
        empService.deleteById(id);
        return "redirect:emps.do";
    }
}
