package action;

import com.opensymphony.xwork2.ActionSupport;
import pojo.Blog;
import service.BlogService;

/**
 * User: yumingzhe
 * Date: 6/2/12
 * Time: 1:25 PM
 */
public class UpdateBlogAction extends ActionSupport {
    private String blogid;
    private String title;
    private String description;
    private String content;
    private String tag;
    private BlogService blogService;
    private String access;
    private String comment;

    public String getBlogid() {
        return blogid;
    }

    public void setBlogid(String blogid) {
        this.blogid = blogid;
    }

    public String getAccess() {
        return access;
    }

    public void setAccess(String access) {
        this.access = access;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

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
        Blog blog = blogService.getBlogById(Integer.parseInt(blogid));
        blog.setTitle(this.title);
        blog.setDescription(this.description);
        blog.setContent(this.content);
        blog.setTag(this.tag);
        if (this.comment.equals("On"))
            blog.setComment(true);
        if (this.comment.equals("Off"))
            blog.setComment(false);
        if (this.access.equals("1"))
            blog.setAccess("private");
        if (this.access.equals("2"))
            blog.setAccess("public");
        if (this.access.equals("3"))
            blog.setAccess("group");
        blogService.updateBlog(blog);
        return SUCCESS;
    }
}
