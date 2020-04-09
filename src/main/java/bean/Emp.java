package bean;

public class Emp {
    private int id;
    private String name;
    private String sex;
    private int age;
    private String email;
    private int dept_id;
    private Dept dept;

    public Emp() {
    }

    public Emp(int id, String name, String sex, int age, String email, int dept_id, Dept dept) {
        this.id = id;
        this.name = name;
        this.sex = sex;
        this.age = age;
        this.email = email;
        this.dept_id = dept_id;
        this.dept = dept;
    }

    public Emp(String name, String sex, int age, String email, int dept_id, Dept dept) {
        this.name = name;
        this.sex = sex;
        this.age = age;
        this.email = email;
        this.dept_id = dept_id;
        this.dept = dept;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getDept_id() {
        return dept_id;
    }

    public void setDept_id(int dept_id) {
        this.dept_id = dept_id;
    }

    public Dept getDept() {
        return dept;
    }

    public void setDept(Dept dept) {
        this.dept = dept;
    }

    @Override
    public String toString() {
        return "Emp{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", sex='" + sex + '\'' +
                ", age=" + age +
                ", email='" + email + '\'' +
                ", dept_id=" + dept_id +
                ", dept=" + dept +
                '}';
    }
}
