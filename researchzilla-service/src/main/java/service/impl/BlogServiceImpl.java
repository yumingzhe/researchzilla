package service.impl;

import dao.BlogDao;
import pojo.Blog;
import service.BlogService;

import java.io.Serializable;
import java.util.List;

/**
 * User: yumingzhe
 * Date: 5/24/12
 * Time: 11:28 AM
 */
public class BlogServiceImpl implements BlogService {
    private BlogDao blogDao;

    public BlogDao getBlogDao() {
        return blogDao;
    }

    public void setBlogDao(BlogDao blogDao) {
        this.blogDao = blogDao;
    }

    @Override
    public Serializable saveBlog(Blog blog) {
        return blogDao.saveBlog(blog);
    }

    @Override
    public Blog getBlogById(int id) {
        return blogDao.getBlogById(id);
    }

    @Override
    public List<Blog> getAllBlogsByUID(int uid) {
        return blogDao.getAllBlogsByUID(uid);
    }

    @Override
    public void updateBlog(Blog blog) {
        this.blogDao.updateBlog(blog);
    }

    @Override
    public void deleteBlogById(int id) {
        this.blogDao.deleteBlogById(id);
    }
}
