package action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import pojo.Blog;
import service.BlogService;

import javax.servlet.http.HttpServletRequest;

/**
 * User: yumingzhe
 * Date: 5/29/12
 * Time: 1:47 PM
 */
public class GetSpecifiedBlogAction extends ActionSupport {
    private String blogid;
    private BlogService blogService;
    private String type;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public BlogService getBlogService() {
        return blogService;
    }

    public void setBlogService(BlogService blogService) {
        this.blogService = blogService;
    }

    public String getBlogid() {
        return blogid;
    }

    public void setBlogid(String blogid) {
        this.blogid = blogid;
    }

    @Override
    public String execute() throws Exception {
        Blog blog = blogService.getBlogById(Integer.parseInt(blogid));
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setAttribute("specifiedblog", blog);
        if (type == null)
            return SUCCESS;
        if (type.equals("update"))
            return "update";
        return INPUT;
    }
}
