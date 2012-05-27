package dao;

import pojo.File;

import java.io.Serializable;

/**
 * User: yumingzhe
 * Date: 5/26/12
 * Time: 4:30 PM
 */
public interface FileDao {
    public Serializable saveFile(File file);
    public File getFileById(int id);
}
