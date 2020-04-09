<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>员工列表</title>
    <link href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<%--员工修改--%>
<div class="modal fade" id="empUpdate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">修改员工</h4>
            </div>
            <div class="modal-body">
                <%--表单--%>
                <form class="form-horizontal" id="updateEmp" action="${pageContext.request.contextPath}/emp.do" method="post">
                    <input type="hidden" name="_method" value="put">
                    <input type="hidden" name="id" id="emp_id">
                    <div class="form-group">
                        <label for="empName_update" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="empName_update" name="name" placeholder="最少2位" onblur="regformName($('#empName_update'))">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="empAge_update" class="col-sm-2 control-label">年龄</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="empAge_update" name="age" placeholder="输入年龄" onblur="regformAge($('#empAge_update'))">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="empEmail_update" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="empEmail_update" name="email" placeholder="Email@163.com" onblur="regformEmail($('#empEmail_update'))">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="sex"  value="男">男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="sex"  value="女">女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">选择部门</label>
                        <div class="col-sm-3">
                            <%--部门提交部门id即可--%>
                            <select class="form-control" name="dept_id">
                                <option value="1">开发部</option>
                                <option value="2">测试部</option>
                                <option value="3">人事部</option>
                                <option value="4">组织部</option>
                                <option value="5">财务部</option>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <button type="submit" class="btn btn-primary" id="emp_update_btn" onclick=alert("修改成功")>更新</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>



<!-- 员工添加 -->
<div class="modal fade" id="empAdd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">新增员工</h4>
            </div>
            <div class="modal-body">
                <%--表单--%>
                <form class="form-horizontal" id="addEmp" action="${pageContext.request.contextPath}/emp.do" method="post">
                    <div class="form-group">
                        <label for="empName" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="empName" name="name" placeholder="最少2位" onblur="regformName($('#empName'))">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="empAge" class="col-sm-2 control-label">年龄</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="empAge" name="age" placeholder="18-60" onblur="regformAge($('#empAge'))">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="empEmail" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control" id="empEmail" name="email" placeholder="Email@163.com" onblur="regformEmail($('#empEmail'))">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="sex"  value="男" checked>男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="sex"  value="女">女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">选择部门</label>
                        <div class="col-sm-3">
                            <%--部门提交部门id即可--%>
                            <select class="form-control" name="dept_id">
                                <option value="1">开发部</option>
                                <option value="2">测试部</option>
                                <option value="3">人事部</option>
                                <option value="4">组织部</option>
                                <option value="5">财务部</option>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <button type="submit" class="btn btn-primary" id="emp_add_btn" onclick="alert('添加成功')">保存</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <%--标题--%>
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
            <span style="color:yellowgreen;">你好:${user}</span>
        </div>
    </div>
    <%--按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary" id="emp_add_model">新增</button>
            <button class="btn btn-danger" id="emp_delete_all" onclick="alert('别点了，【批量删除】还没做呢\n哈哈哈……')">删除</button>
        </div>
    </div>
    <%--显示表格数据--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover">
                <tr>
                    <th><input type="checkbox" id="check_all"></th>
                    <th>id</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>年龄</th>
                    <th>email</th>
                    <th>所在部门</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${pageInfo.list}" var="emp">
                    <tr class="ck1">
                        <td><input type="checkbox" class="check_item"></td>
                        <td>${emp.id}</td>
                        <td>${emp.name}</td>
                        <td>${emp.sex}</td>
                        <td>${emp.age}</td>
                        <td>${emp.email}</td>
                        <td>${emp.dept.deptName}</td>
                        <td>
                             <button class="btn btn-primary btn-sm" onclick="open_update_form()" id="${emp.id}">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                编辑</button>
                            <form action="${pageContext.request.contextPath}/emp.do?id=${emp.id}" method="post">
                                <input type="hidden" name="_method" value="DELETE">
                                <button class="btn btn-danger btn-sm" onclick="del()">
                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                    删除</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <%--显示分页信息--%>
    <div class="row">
        <%--分页文字信息--%>
        <div class="col-md-6">
            当前第${pageInfo.pageNum}页,共有${pageInfo.pages}页,总共有${pageInfo.total}条记录
        </div>
        <%--分页条信息--%>
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li><a href="${pageContext.request.contextPath}/emps.do?page=1">首页</a></li>
                    <c:if test="${pageInfo.hasPreviousPage}">
                        <li>
                            <a href="${pageContext.request.contextPath}/emps.do?page=${pageInfo.pageNum-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:forEach items="${pageInfo.navigatepageNums}" var="pageNum">
                        <c:if test="${pageNum==pageInfo.pageNum}">
                            <li class="active"><a href="#">${pageNum}</a></li>
                        </c:if>
                        <c:if test="${pageNum!=pageInfo.pageNum}">
                            <li><a href="${pageContext.request.contextPath}/emps.do?page=${pageNum}">${pageNum}</a></li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${pageInfo.hasNextPage}">
                        <li>
                            <a href="${pageContext.request.contextPath}/emps.do?page=${pageInfo.pageNum+1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <li><a href="${pageContext.request.contextPath}/emps.do?page=${pageInfo.pages}">尾页</a></li>
                </ul>
            </nav>
        </div>
    </div>
</div>
<script type="text/javascript">
    //打开新增模态框时，清空所有样式以及文字信息
    $("#emp_add_model").click(function(){
        $("#empAdd form")[0].reset();
        $("#empAdd form").find("*").removeClass("has-success has-error");
        $("#empAdd form").find(".help-block").text("");
        $("#empAdd").modal({
            backdrop:"static"
        });
    });
    //打开更新模态框时，清空所有样式以及文字信息
    var open_update_form=function(){
            $("#empUpdate form")[0].reset();
            $("#empUpdate form").find("*").removeClass("has-success has-error");
            $("#empUpdate form").find(".help-block").text("");
            // var a=$("#emp_update_btn").attr("id",$(this).attr("id"))
            $("#empUpdate").modal({
                backdrop:"static"
            });
    }
    var regform=function(ele){
        //移除样式
        ele.parent().removeClass("has-error has-success")
        //移除span标签的内容
        ele.next("span").text("")
        //添加错误样式
        ele.parent().addClass("has-error")
    }
    var regformName=function(id){
        var empName=id.val();
        var regName=/(^[a-zA-Z0-9_-]{2,16}$)|(^[\u2E80-\u9FFF]{2,8})/
        if(!regName.test(empName)){
            regform(id)
            id.next("span").text("用户名至少2位且必须为数字、字母、下划线或-")
        }
        else {
            id.next("span").text("")
            id.parent().removeClass("has-error has-success")
            id.parent().addClass("has-success")
        }
    }
    var regformAge=function(id){
        var empAge=id.val();
        if(empAge<=0 || empAge>100){
            regform(id)
            id.next("span").text("请输入正确(靠谱)的年龄")
        }else if(empAge<18){
            regform(id)
            id.next("span").text("未成年不要")
        }else if(empAge>=60){id
            regform(id)
            id.next("span").text("年过花甲不要")
        }
        else {
            id.parent().removeClass("has-error has-success")
            id.next("span").text("")
            id.parent().addClass("has-success")
        }
    }
    var regformEmail=function(id){
        var empEmail=id.val();
        var regEmail=/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/
        if(regEmail.test(empEmail)){
            id.parent().removeClass("has-error has-success")
            id.next("span").text("")
            id.parent().addClass("has-success")
        }else {
            regform(id)
            id.next("span").text("邮箱格式不正确")
        }
    }
    //新增用户的按钮是否可用
    setInterval(function(){
        if($("#empName").parent().hasClass("has-success") && $("#empAge").parent().hasClass("has-success") && $("#empEmail").parent().hasClass("has-success")){
            $("#emp_add_btn").attr("disabled",false)
        }else {
            $("#emp_add_btn").attr("disabled",true)
        }
    },500)

    setInterval(function(){
        if($("#empName_update").parent().hasClass("has-error") || $("#empAge_update").parent().hasClass("has-error") || $("#empEmail_update").parent().hasClass("has-error")){
            $("#emp_update_btn").attr("disabled",true)
        }else {
            $("#emp_update_btn").attr("disabled",false)
        }
    },500)
    //全选/全不选
    $("#check_all").click(function(){
        $(".check_item").prop("checked",$(this).prop("checked"))
    })

    $(".ck1 input").click(function() {
        if ($(".ck1 input:checked").length == $(".check_item").length) {
            $("#check_all").prop("checked", true)
        }
        else {
            $("#check_all").prop("checked", false)
        }
    });
    //批量删除
    $("#emp_delete_all").click(function(){
        var empNames="";
        $.each($(".check_item"),function(){
            empNames+=$(this).parents("tr").find("td:eq(2)").text()+",";
        });
        empNames.substring(0,empNames.length-1);
    })


    var del=function(){
        var result=window.confirm("确定要删除吗");
        if(result){
            return true;
        }
        return window.event.returnValue=false;
    }

    //修改员工时，将该员工信息显示在模态框上
    $(".btn.btn-primary.btn-sm").click(function(){
        var update_id=$(this).attr("id")
        $.ajax({
            url:"${pageContext.request.contextPath}/emp.do?id="+update_id,
            type:"GET",
            success:function(result){
                var emp=result.extend.emp;
                $("#emp_id").val(emp.id)
                $("#empName_update").val(emp.name);
                $("#empAge_update").val(emp.age);
                $("#empEmail_update").val(emp.email);
                $("#empUpdate input[name=sex]").val([emp.sex]);
                $("#empUpdate select").val([emp.dept_id]);
            }
        })
    })



    <%--$(".btn.btn-danger.btn-sm").click(function(){--%>
        <%--var btn_id=$(this).attr("id")--%>
        <%--if(confirm("确认删除吗？")){--%>
            <%--$.ajax({--%>
                <%--url:"${pageContext.request.contextPath}/emp.do?id="+btn_id,--%>
                <%--type:"DELETE",--%>
                <%--success:function(result){--%>
                    <%--alert(result)--%>
                <%--}--%>
            <%--});--%>
        <%--}--%>
        <%--emps();--%>
    <%--})--%>
</script>
</body>
</html>
