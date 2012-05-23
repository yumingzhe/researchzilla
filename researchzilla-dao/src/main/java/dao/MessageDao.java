package dao;

import pojo.Message;

import java.io.Serializable;
import java.util.List;

/**
 * User: wangyan
 * Date: 12-5-23
 * Time: 上午9:02
 */
public interface MessageDao {
    public Serializable saveMessage(Message message);

    public void updateMessage(Message message);

    public void deleteMessageById(int id);

    public List<Message> getAllMessage();
}
