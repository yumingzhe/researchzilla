package service.impl;

import dao.BlogDao;
import pojo.Blog;
import service.BlogService;

import java.io.Serializable;

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
}
