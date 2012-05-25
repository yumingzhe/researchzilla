package service.impl;

import dao.SubjectDao;
import pojo.Subject;
import service.SubjectService;

import java.io.Serializable;
import java.util.List;

/**
 * User: wangyan
 * Date: 12-5-23
 * Time: 上午10:12
 */
public class SubjectServiceImpl implements SubjectService {
    private SubjectDao subjectDao;

    public SubjectDao getSubjectDao() {
        return subjectDao;
    }

    public void setSubjectDao(SubjectDao subjectDao) {
        this.subjectDao = subjectDao;
    }

    @Override
    public Serializable saveSubject(Subject subject) {
        return subjectDao.saveSubject(subject);
    }

    @Override
    public void updateSubject(Subject subject) {
        subjectDao.updateSubject(subject);
    }

    @Override
    public void deleteSubjectById(int id) {
        subjectDao.deleteSubjectById(id);
    }

    @Override
    public List<Subject> getAllSubject() {
        return subjectDao.getAllSubject();
    }
}
