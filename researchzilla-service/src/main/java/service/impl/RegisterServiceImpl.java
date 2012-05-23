package service.impl;

import dao.RegisterDao;
import pojo.Register;
import service.RegisterService;

import java.io.Serializable;
import java.util.List;

/**
 * User: yumingzhe
 * Date: 5/21/12
 * Time: 8:33 PM
 */
public class RegisterServiceImpl implements RegisterService {
    private RegisterDao registerDao;

    public RegisterDao getRegisterDao() {
        return registerDao;
    }

    public void setRegisterDao(RegisterDao registerDao) {
        this.registerDao = registerDao;
    }

    @Override
    public Register getRegisterBySequence(String sequence) {
        return this.registerDao.getRegisterBySequence(sequence);
    }

    @Override
    public List<Register> getAllRegister() {
        return this.registerDao.getAllRegister();
    }

    @Override
    public void deleteAllRegistersByUID(int uid) {
        this.registerDao.deleteAllRegisterByUID(uid);
    }

    @Override
    public Serializable saveRegister(Register register) {
        return registerDao.saveRegister(register);
    }
}
