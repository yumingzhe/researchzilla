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
        return messageDao.saveMessage(message);
    }

    @Override
    public void updateMessage(Message message) {
        messageDao.updateMessage(message);
    }

    @Override
    public void deleteMessageById(int id) {
       messageDao.deleteMessageById(id);
    }

    @Override
    public List<Message> getAllInternalNotice() {
        return messageDao.getAllInternalNotice();
    }

    @Override
    public List<Message> getAllPublicNotice() {
        return messageDao.getAllPublicNotice();
    }


    @Override
    public List<Message> getAllNews() {
        return messageDao.getAllNews();
    }

    @Override
    public List<Message> getSomeInternalNotice() {
        return messageDao.getSomeInternalNotice();
    }

    @Override
    public List<Message> getSomePublicNotice() {
        return messageDao.getSomePublicNotice();
    }

    @Override
    public List<Message> getSomeNews() {
        return messageDao.getSomeNews();
    }

    @Override
    public Message getOneInternalNotice(String name) {
        return messageDao.getOneInternalNotice(name);
    }

    @Override
    public Message getOnePublicNotice(String name) {
        return messageDao.getOnePublicNotice(name);
    }

    @Override
    public Message getOneNews(String name) {
        return messageDao.getOneNews(name);
    }


}
