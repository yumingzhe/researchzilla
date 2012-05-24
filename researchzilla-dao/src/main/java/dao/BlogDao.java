package dao;

import pojo.Blog;

import java.io.Serializable;

/**
 * User: yumingzhe
 * Date: 5/24/12
 * Time: 11:25 AM
 */
public interface BlogDao {
    public Serializable saveBlog(Blog blog);
}
