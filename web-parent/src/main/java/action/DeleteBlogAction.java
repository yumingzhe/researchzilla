package action;

import com.opensymphony.xwork2.ActionSupport;

/**
 * User: yumingzhe
 * Date: 5/24/12
 * Time: 1:13 PM
 */
public class DeleteBlogAction extends ActionSupport {
    private int blogId;

    public int getBlogId() {
        return blogId;
    }

    public void setBlogId(int blogId) {
        this.blogId = blogId;
    }

    @Override
    public String execute() throws Exception {
        return super.execute();
    }
}
