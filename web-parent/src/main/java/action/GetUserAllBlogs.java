package action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import pojo.Blog;
import service.BlogService;
import service.SiteUserService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * User: yumingzhe
 * Date: 5/29/12
 * Time: 8:22 PM
 */
public class GetUserAllBlogs extends ActionSupport {
    private String uid;
    private BlogService blogService;

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public BlogService getBlogService() {
        return blogService;
    }

    public void setBlogService(BlogService blogService) {
        this.blogService = blogService;
    }

    @Override
    public String execute() throws Exception {
        List<Blog> blogs = blogService.getAllBlogsByUID(Integer.parseInt(uid));
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setAttribute("blogs", blogs);
        return SUCCESS;
    }
}
