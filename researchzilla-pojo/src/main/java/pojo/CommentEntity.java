package pojo;

import java.sql.Timestamp;

/**
 * User: yumingzhe
 * Date: 5/19/12
 * Time: 11:03 PM
 */
public class CommentEntity implements Comparable<CommentEntity> {
    private Integer id;
    private Timestamp postTime;
    private String content;
    private File file;
    private Blog blog;
    private Activity activity;
    private SiteUser siteUser;

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public SiteUser getSiteUser() {
        return siteUser;
    }

    public void setSiteUser(SiteUser siteUser) {
        this.siteUser = siteUser;
    }

    public Blog getBlog() {
        return blog;
    }

    public void setBlog(Blog blog) {
        this.blog = blog;
    }

    public Activity getActivity() {
        return activity;
    }

    public void setActivity(Activity activity) {
        this.activity = activity;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Timestamp getPostTime() {
        return postTime;
    }

    public void setPostTime(Timestamp postTime) {
        this.postTime = postTime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public int compareTo(CommentEntity o) {
        return this.getPostTime().compareTo(o.getPostTime());
    }
}
