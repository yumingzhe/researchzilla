package action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import pojo.Blog;
import service.BlogService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * User: yumingzhe
 * Date: 6/2/12
 * Time: 4:23 PM
 */
public class SearchBlogByTag extends ActionSupport {
    private String tag;
    private BlogService blogService;

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public BlogService getBlogService() {
        return blogService;
    }

    public void setBlogService(BlogService blogService) {
        this.blogService = blogService;
    }

    @Override
    public String execute() throws Exception {
        List<Blog> blogs = blogService.searchBlogByTag(tag);
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setAttribute("tagresult", blogs);
        return SUCCESS;
    }
}
