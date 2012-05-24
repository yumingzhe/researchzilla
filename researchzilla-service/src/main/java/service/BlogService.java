package service;

import pojo.Blog;

import java.io.Serializable;

/**
 * User: yumingzhe
 * Date: 5/24/12
 * Time: 11:27 AM
 */
public interface BlogService {
    public Serializable saveBlog(Blog blog);
}
