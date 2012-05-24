package service.impl;

import dao.MessageDao;
import pojo.Message;
import service.MessageService;

import java.io.Serializable;
import java.util.List;

/**
 * User: wangyan
 * Date: 12-5-23
 * Time: 上午9:36
 */
public class MessageServiceImpl implements MessageService {
    private MessageDao messageDao;

    public MessageDao getMessageDao() {
        return messageDao;
    }

    public void setMessageDao(MessageDao messageDao) {
        this.messageDao = messageDao;
    }

    @Override
    public Serializable saveMessage(Message message) {
        return this.messageDao.saveMessage(message);
    }

    @Override
    public void updateMessage(Message message) {
        this.messageDao.updateMessage(message);
    }

    @Override
    public void deleteMessageById(int id) {
       this.messageDao.deleteMessageById(id);
    }

    @Override
    public List<Message> getAllInternalNotice() {
        return this.messageDao.getAllInternalNotice();
    }

    @Override
    public List<Message> getAllPublicNotice() {
        return this.messageDao.getAllPublicNotice();
    }


    @Override
    public List<Message> getAllNews() {
        return this.messageDao.getAllNews();
    }

    @Override
    public List<Message> getSomeInternalNotice() {
        return this.messageDao.getSomeInternalNotice();
    }

    @Override
    public List<Message> getSomePublicNotice() {
        return this.messageDao.getSomePublicNotice();
    }

    @Override
    public List<Message> getSomeNews() {
        return this.messageDao.getSomeNews();
    }


}
