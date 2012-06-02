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
    public int getInternalNoticeTotalCount() {
        return messageDao.getInternalNoticeTotalCount();
    }

    @Override
    public int getInternalNoticeTotalPage(int pageSize) {
        return messageDao.getInternalNoticeTotalPage(pageSize);
    }

    @Override
    public int getPublicNoticeTotalCount() {
        return messageDao.getPublicNoticeTotalCount();
    }

    @Override
    public int getPublicNoticeTotalPage(int pageSize) {
        return messageDao.getPublicNoticeTotalPage(pageSize);
    }

    @Override
    public int getNewsTotalCount() {
        return messageDao.getNewsTotalCount();
    }

    @Override
    public int getNewsTotalPage(int pageSize) {
        return messageDao.getNewsTotalPage(pageSize);
    }

    @Override
    public List<Message> getInternalNotice(final int pageSize, final int currentPage) {
        return messageDao.getInternalNotice(pageSize,currentPage);
    }

    @Override
    public List<Message> getPublicNotice(int pageSize, int currentPage) {
        return messageDao.getPublicNotice(pageSize,currentPage);
    }

    @Override
    public List<Message> getNews(int pageSize, int currentPage) {
        return messageDao.getNews(pageSize,currentPage);
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
    public Message getOneInternalNoticeByID(int id) {
        return messageDao.getOneInternalNoticeByID(id);
    }

    @Override
    public Message getOnePublicNoticeByID(int id) {
        return messageDao.getOnePublicNoticeByID(id);
    }

    @Override
    public Message getOneNewsByID(int id) {
        return messageDao.getOneNewsByID(id);
    }

    @Override
    public List<Message> getAllMessages() {
        return messageDao.getAllMessages();
    }

    @Override
    public int getMessageTotalCount() {
        return messageDao.getMessageTotalCount();
    }

    @Override
    public int getMessageTotalPage(int pageSize) {
        return messageDao.getMessageTotalPage(pageSize);
    }

    @Override
    public List<Message> getMessage(int pageSize, int currentPage) {
        return messageDao.getMessage(pageSize,currentPage);
    }

    @Override
    public Message getOneMessageByID(int id) {
        return messageDao.getOneMessageByID(id);
    }


}
