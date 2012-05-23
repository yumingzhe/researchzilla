package dao;

import pojo.Subject;

import java.io.Serializable;
import java.util.List;

/**
 * User: wangyan
 * Date: 12-5-23
 * Time: 上午10:02
 */
public interface SubjectDao {
    public Serializable saveSubject(Subject subject);

    public void updateSubject(Subject subject);

    public void deleteSubjectById(int id);

    public List<Subject> getAllSubject();
}
