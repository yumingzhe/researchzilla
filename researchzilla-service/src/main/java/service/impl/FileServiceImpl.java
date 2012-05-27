package service.impl;

import dao.FileDao;
import pojo.File;
import service.FileService;

import java.io.Serializable;

/**
 * User: yumingzhe
 * Date: 5/26/12
 * Time: 4:39 PM
 */
public class FileServiceImpl implements FileService {
    private FileDao fileDao;

    public FileDao getFileDao() {
        return fileDao;
    }

    public void setFileDao(FileDao fileDao) {
        this.fileDao = fileDao;
    }

    @Override
    public Serializable saveFile(File file) {
        return fileDao.saveFile(file);
    }

    @Override
    public File getFileById(int id) {
        return this.fileDao.getFileById(id);
    }
}
