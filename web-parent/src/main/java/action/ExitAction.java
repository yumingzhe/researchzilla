package action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * User: Administrator
 * Date: 12-5-30
 * Time: 下午5:41
 */
public class ExitAction extends ActionSupport {
    @Override
    public String execute() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession actionSession = request.getSession();
        Object object = actionSession.getAttribute("user");
        if (object != null) {
            try {
                request.getSession().removeAttribute("user");
            } catch (Exception e) {
                object = null;
            }
        }
        return SUCCESS;
    }
}
