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

    public List<Message> getAllInternalNotice();

    public List<Message> getAllPublicNotice();

    public List<Message> getAllNews();

    public List<Message> getSomeInternalNotice();

    public List<Message> getSomePublicNotice();

    public List<Message> getSomeNews();

    public Message getOneInternalNotice(String name);

    public Message getOnePublicNotice(String name);

    public Message getOneNews(String name);
}
