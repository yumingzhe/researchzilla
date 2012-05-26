package action;

import com.opensymphony.xwork2.ActionSupport;
import pojo.Activity;
import pojo.Blog;
import pojo.SiteUser;
import service.ActivityService;
import service.BlogService;
import service.SiteUserService;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.*;

/**
 * User: yumingzhe
 * Date: 5/24/12
 * Time: 11:12 AM
 */
public class PostBlogAction extends ActionSupport {
    private String title;
    private String content;
    private String tag;
    private String description;
    private String access;
    private Boolean comment;
    private Timestamp postDate;
    private String posterId;
    private SiteUserService siteUserService;
    private BlogService blogService;
    private ActivityService activityService;

    public ActivityService getActivityService() {
        return activityService;
    }

    public void setActivityService(ActivityService activityService) {
        this.activityService = activityService;
    }

    public BlogService getBlogService() {
        return blogService;
    }

    public void setBlogService(BlogService blogService) {
        this.blogService = blogService;
    }

    public String getPosterId() {
        return posterId;
    }

    public void setPosterId(String posterId) {
        this.posterId = posterId;
    }

    public SiteUserService getSiteUserService() {
        return siteUserService;
    }

    public void setSiteUserService(SiteUserService siteUserService) {
        this.siteUserService = siteUserService;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAccess() {
        return access;
    }

    public void setAccess(String access) {
        this.access = access;
    }

    public Boolean getComment() {
        return comment;
    }

    public void setComment(Boolean comment) {
        this.comment = comment;
    }

    public Timestamp getPostDate() {
        return postDate;
    }

    public void setPostDate(Timestamp postDate) {
        this.postDate = postDate;
    }

    @Override
    public void validate() {
        if (this.title == null) {
            this.addFieldError("title", "You must enter a valid title");
        }
        if (this.content == null) {
            this.addFieldError("content", "You must enter some content");
        }
        if (this.description == null) {
            this.addFieldError("description", "Description can not be empty");
        }
        if (this.comment == null) {
            this.comment = true;
        }
        if (this.posterId == null) {
            this.posterId = "1";
        }

    }

    @Override
    public String execute() throws Exception {
        SiteUser siteUser = siteUserService.getSiteUserByUID(Integer.parseInt(posterId));

        Blog blog = new Blog();
        blog.setTitle(this.title);
        blog.setContent(this.content);
        blog.setDescription(this.description);
        blog.setTag(this.tag);
        blog.setComment(this.comment);
        blog.setAccess(this.access);
        blog.setPostDate(new Timestamp(new Date().getTime()));
        blog.setSiteUser(siteUser);

        Activity activity = new Activity();
        activity.setActivityOccurTime(new Timestamp(new Date().getTime()));
        activity.setSiteUser(siteUser);
        activity.setBlog(blog);
        blog.setActivity(activity);

        blogService.saveBlog(blog);//this will add blog and activity record into Table 'researchzilla_blog' and 'reaserchzilla_activity'
        return SUCCESS;
    }
}
