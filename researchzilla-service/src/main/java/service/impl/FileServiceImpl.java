package service.impl;

import dao.FileDao;
import pojo.File;
import service.FileService;

import java.io.Serializable;
import java.util.List;

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

    @Override
    public List<File> getUserAllFilesByUID(int uid) {
        return (List<File>) this.fileDao.getUserAllFilesByUID(uid);
    }

    @Override
    public void deleteFile(File file) {
        this.fileDao.deleteFile(file);
    }
}
