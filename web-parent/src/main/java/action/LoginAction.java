package action;

import com.opensymphony.xwork2.ActionSupport;
import pojo.Student;
import service.StudentService;

import java.util.List;

public class LoginAction extends ActionSupport {
    private String username;
    private String password;
    private StudentService studentService;

    public StudentService getStudentService() {
        return studentService;
    }

    public void setStudentService(StudentService studentService) {
        this.studentService = studentService;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String execute() throws Exception {
        List<Student> students = studentService.getAllStudents();
        for (Student student : students) {
            if (student.getName().equals(this.username) && student.getPassword().equals(this.password))
                return SUCCESS;
        }
        return INPUT;
    }
}
