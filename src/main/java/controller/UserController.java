package controller;

import bean.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import service.UserService;

import javax.servlet.http.HttpServletRequest;

@RequestMapping("/User")
@Controller
public class UserController {
    @Autowired
    private UserService userService;
    //先查询要注册的用户名是否已经存在，然后再注册
    @RequestMapping("/register.do")
    public String register(User user,HttpServletRequest request){
        String name=userService.select(user);
        if(name==null){
            userService.addUser(user);
            return "login";
        }
        request.setAttribute("msg","用户名已存在，请重新注册");
        return "login";
    }
    @RequestMapping("/login.do")
    public String login(String name, String password, HttpServletRequest request){
        User user=userService.login(name);
        //判断用户名是否为空
        if(user!=null){
            //密码正确
            if(user.getPassword().equals(password)){
                request.getSession().setAttribute("user",user.getName());
                return "redirect:../emps.do";
            }
            //密码错误
            else {
                request.setAttribute("msg","密码错误");
                return "login";
            }
        }
        //用户名为空
        request.setAttribute("msg","用户名不存在");
        return "login";
    }
}
