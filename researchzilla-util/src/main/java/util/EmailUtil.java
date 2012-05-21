package util;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

/**
 * User: yumingzhe
 * Date: 5/20/12
 * Time: 9:33 PM
 */
public class EmailUtil {

    //TODO complete sendEmail function
    public static void sendEmail(String smtp, int port, String username, String password, String from, String subject, String msg, String to) {
        Email emailAgent = new SimpleEmail();

        emailAgent.setHostName(smtp);
        emailAgent.setSmtpPort(port);
        emailAgent.setAuthentication("yumingzhe.pt@gmail.com", "YMZ7565092");
        emailAgent.setSSL(true);
        try {
            emailAgent.setFrom(from);
            emailAgent.setSubject(subject);
            emailAgent.setCharset("utf8");
            emailAgent.setMsg(msg);
            emailAgent.addTo(to);
            emailAgent.send();
        } catch (EmailException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        String msg = "你好 " + "'" + "yumingzhe" + "'" + ",\n" +
                "\n" +
                "你请求在researchzilla网站获取账号，并指定此邮箱地址 (" + "yumingzhe@live.cn" + ") 为你的联系地址。\n" +
                "\n" +
                "如果你没有发过该请求，请忽视本邮件。输入你邮箱地址者的IP地址为" + "192.168.1.1" + "。请勿回复本邮件。\n" +
                "\n" +
                "如果你的确发过该请求，请点击以下链接来通过验证： 这个链接\n" +
                "http://localhost/confirm?id=31111&secret=" + "23rjlll43l24j2l32h4lj2l3j2l34l" + "\n" +
                "\n" +
                "在通过验证后，你就可以使用新账号了。\n" +
                "\n" +
                "如果你在24小时内没有通过验证，你的账号将被删除。\n" +
                "\n";
        EmailUtil.sendEmail("smtp.gmail.com", 465, "yumingzhe.pt@gmail.com", "YMZ7565092", "admin@researchzilla", "网站用户注册验证‏", msg, "yumingzhe@live.cn");
    }
}
