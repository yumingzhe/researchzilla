package action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.commons.mail.SimpleEmail;
import org.hibernate.Query;
import org.hibernate.Session;
import pojo.SiteUser;
import util.HibernateUtil;

import java.util.Iterator;
import java.util.List;

public class ForgetPasswordAction extends ActionSupport{
    private String username;
    private String email;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    public String execute() throws Exception{
        Session session = HibernateUtil.getSession();
        session.beginTransaction();
        String sql = "from SiteUser u where u.username=?";
        Query query = session.createQuery(sql);
        query.setString(0, this.username);
        List list = query.list();
        Iterator iterator = list.iterator();
        SiteUser person = (SiteUser) iterator.next();
        session.getTransaction().commit();

        if(person!=null){
            SimpleEmail email = new SimpleEmail();
            //设置发送主机的服务器地址
            email.setHostName("smtp.qq.com");
            //设置收件人邮箱
            email.addTo(person.getEmail(),person.getUsername());
            //发件人邮箱
            email.setFrom("940851386@qq.com", "wangyan");
            //如果要求身份验证，设置用户名、密码，分别为发件人在邮件服务器上注册的用户名和密码
            email.setAuthentication("940851386", "13156264244MEGAN");
            //设置邮件的主题
            email.setSubject("欢迎使用找回密码功能！如果该操作不是您执行的请忽略本邮件！");
            //邮件正文消息
            email.setMsg("Your password is  "+person.getPassword());
            email.send();
            System.out.println("The SimpleEmail send sucessful!!!");
            return  SUCCESS;
        } else{
            ActionContext ctx = ActionContext.getContext();
            ctx.getSession().put("indicate", "未查找到该用户！");
            return INPUT;
        }

    }
}
