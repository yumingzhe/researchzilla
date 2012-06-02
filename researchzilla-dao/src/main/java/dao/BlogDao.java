package dao;

import pojo.Blog;

import java.io.Serializable;
import java.util.List;

/**
 * User: yumingzhe
 * Date: 5/24/12
 * Time: 11:25 AM
 */
public interface BlogDao {
    public Serializable saveBlog(Blog blog);

    public Blog getBlogById(int id);

    public List<Blog> getAllBlogsByUID(int uid);

    public void updateBlog(Blog blog);

    public void deleteBlogById(int id);

    public List searchBlogByTag(String tag);
}
