package action;

import com.opensymphony.xwork2.ActionSupport;
import pojo.Blog;
import pojo.CommentEntity;
import pojo.SiteUser;
import service.ActivityService;
import service.BlogService;
import service.SiteUserService;

import java.util.Iterator;
import java.util.Set;

/**
 * User: yumingzhe
 * Date: 5/24/12
 * Time: 1:13 PM
 */
public class DeleteBlogAction extends ActionSupport {
    private String blogid;
    private BlogService blogService;
    private SiteUserService siteUserService;
    private ActivityService activityService;
    private String uid;

    public ActivityService getActivityService() {
        return activityService;
    }

    public void setActivityService(ActivityService activityService) {
        this.activityService = activityService;
    }

    public SiteUserService getSiteUserService() {
        return siteUserService;
    }

    public void setSiteUserService(SiteUserService siteUserService) {
        this.siteUserService = siteUserService;
    }

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

    public String getBlogid() {
        return blogid;
    }

    public void setBlogid(String blogid) {
        this.blogid = blogid;
    }

    @Override
    public String execute() throws Exception {
        Blog blog = blogService.getBlogById(Integer.parseInt(blogid));
        Set<CommentEntity> commentEntities = blog.getCommentEntities();
        Iterator iterator = commentEntities.iterator();
        while (iterator.hasNext()) {
            String sql = "delete from Activity where commentId=" + ((CommentEntity) iterator.next()).getId();
            activityService.executeSQL(sql);
        }
        String sql = "delete from Activity where blogId=" + blog.getId();
        activityService.executeSQL(sql);
        /*SiteUser siteUser = blog.getSiteUser();
        siteUser.getBlogs().remove(blog);
        //blog.setSiteUser(null);
        siteUserService.updateSiteUser(siteUser);*/
//        blogService.deleteBlogById(Integer.parseInt(blogid));
        blogService.deleteBlogById(blogid);
        return SUCCESS;
    }
}
