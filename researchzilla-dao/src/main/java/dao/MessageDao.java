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

    public int getInternalNoticeTotalCount();

    public int getInternalNoticeTotalPage(int pageSize);

    public int getPublicNoticeTotalCount();

    public int getPublicNoticeTotalPage(int pageSize);

    public int getNewsTotalCount();

    public int getNewsTotalPage(int pageSize);

    public List<Message> getInternalNotice(final int pageSize, final int currentPage);

    public List<Message> getPublicNotice(final int pageSize, final int currentPage);

    public List<Message> getNews(final int pageSize, final int currentPage);

    public List<Message> getAllPublicNotice();

    public List<Message> getAllNews();

    public List<Message> getSomeInternalNotice();

    public List<Message> getSomePublicNotice();

    public List<Message> getSomeNews();

    public Message getOneInternalNoticeByID(int id);

    public Message getOnePublicNoticeByID(int id);

    public Message getOneNewsByID(int id);

    public List<Message> getAllMessages();

    public int getMessageTotalCount();

    public int getMessageTotalPage(int pageSize);

    public List<Message> getMessage(final int pageSize, final int currentPage);

    public Message getOneMessageByID(int id);
}
