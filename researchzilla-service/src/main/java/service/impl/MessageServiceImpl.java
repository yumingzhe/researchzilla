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
       this.deleteMessageById(id);
    }

    @Override
    public List<Message> getAllMessage() {
        return this.messageDao.getAllMessage();
    }
}
