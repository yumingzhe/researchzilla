package util;

import com.sun.xml.internal.ws.addressing.model.ActionNotSupportedException;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

import java.io.Serializable;

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
        emailAgent.setAuthentication("yumingzhe.pt@gmail.com", "123456");
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

    public static void sendActivateEmailString(String smtp, int port, String username, String password, String registerName, String sender, String subject, String receiver, String remoteAddress, Serializable id, String secret, int ttl) throws EmailException {
        String msg = "你好 " + "'" + registerName + "'" + ",\n" +
                "\n" +
                "你请求在researchzilla网站获取账号，并指定此邮箱地址 (" + receiver + ") 为你的联系地址。\n" +
                "\n" +
                "如果你没有发过该请求，请忽视本邮件。输入你邮箱地址者的IP地址为" + remoteAddress + "。请勿回复本邮件。\n" +
                "\n" +
                "如果你的确发过该请求，请点击以下链接来通过验证： \n" +
                " http://localhost:8080/confirm?uid=" + id.toString() + "&secret=" + secret + " \n" +
                "\n" +
                "在通过验证后，你就可以使用新账号了。\n" +
                "\n" +
                "如果你在" + ttl + "小时内没有通过验证，你的账号将被删除。\n" +
                "\n";

        Email emailAgent = new SimpleEmail();

        emailAgent.setHostName(smtp);
        emailAgent.setSmtpPort(port);
        emailAgent.setAuthentication(username, password);
        emailAgent.setSSL(true);
        emailAgent.setFrom(sender);
        emailAgent.setSubject(subject);
        emailAgent.setCharset("utf8");
        emailAgent.setMsg(msg);
        emailAgent.addTo(receiver);
        emailAgent.send();
    }

    public static void sendPasswordRestEmail(String smtp, int port, String username, String password, String registerName,
                                             String sender, String subject, String receiver, Serializable id, String secret) {

        String msg = "你好，‘" + registerName + "‘, 请点击下面的链接重新设置你在researchzilla的密码，如果无法点击，请完整的复制下面的网址到浏览器地址栏打开该网址：\n" +
                "\n" +
                "        http://localhost:8080/forgetpasswordAction?id=" + id + "&secret=" + secret + "\n" +
                "\n" +
                "        如果你没有要求过重设密码，请直接忽略这个邮件即可。\n" +
                "\n";

        Email emailAgent = new SimpleEmail();

        emailAgent.setHostName(smtp);
        emailAgent.setSmtpPort(port);
        emailAgent.setAuthentication(username, password);
        emailAgent.setSSL(true);
        try {
            emailAgent.setFrom(sender);
            emailAgent.setSubject(subject);
            emailAgent.setCharset("utf8");
            emailAgent.setMsg(msg);
            emailAgent.addTo(receiver);
            emailAgent.send();
        } catch (EmailException e) {
            e.printStackTrace();
        }
    }

    public static void sendNewPasswordEmail(String smtp, int port, String username, String password, String registerName, String newPassword,
                                            String sender, String subject, String receiver) {
        String msg = " 用户名:" + registerName + "\n 密码: " + newPassword;
        Email emailAgent = new SimpleEmail();

        emailAgent.setHostName(smtp);
        emailAgent.setSmtpPort(port);
        emailAgent.setAuthentication(username, password);
        emailAgent.setSSL(true);
        try {
            emailAgent.setFrom(sender);
            emailAgent.setSubject(subject);
            emailAgent.setCharset("utf8");
            emailAgent.setMsg(msg);
            emailAgent.addTo(receiver);
            emailAgent.send();
        } catch (EmailException e) {
            e.printStackTrace();
        }
    }
}
