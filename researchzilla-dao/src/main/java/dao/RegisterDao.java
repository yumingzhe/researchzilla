package dao;

import pojo.Register;

import java.util.List;

/**
 * User: yumingzhe
 * Date: 5/21/12
 * Time: 11:43 AM
 */
public interface RegisterDao {
    public List<Register> getAllRegister();

    public Register getRegisterBySequence(String sequence);

    public void deleteAllRegisterByUID(int uid);
}
