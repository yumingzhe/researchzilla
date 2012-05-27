package service;

import pojo.File;

import java.io.Serializable;

/**
 * User: yumingzhe
 * Date: 5/26/12
 * Time: 4:38 PM
 */
public interface FileService {
    public Serializable saveFile(File file);

    public File getFileById(int id);
}
