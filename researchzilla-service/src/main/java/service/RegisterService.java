package service;

import pojo.Register;

import java.io.Serializable;
import java.util.List;

/**
 * User: yumingzhe
 * Date: 5/21/12
 * Time: 8:32 PM
 */
public interface RegisterService {
    public Register getRegisterBySequence(String sequence);

    public List<Register> getAllRegister();

    public void deleteAllRegistersByUID(int uid);

    public Serializable saveRegister(Register register);
}
