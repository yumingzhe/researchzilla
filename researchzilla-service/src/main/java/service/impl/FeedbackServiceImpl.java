package service.impl;

import dao.FeedbackDao;
import pojo.Feedback;
import service.FeedbackService;

import java.io.Serializable;
import java.util.List;

/**
 * User: wangyan
 * Date: 12-5-23
 * Time: 上午10:34
 */
public class FeedbackServiceImpl  implements FeedbackService{
    private FeedbackDao feedbackDao;

    public FeedbackDao getFeedbackDao() {
        return feedbackDao;
    }

    public void setFeedbackDao(FeedbackDao feedbackDao) {
        this.feedbackDao = feedbackDao;
    }

    @Override
    public Serializable saveFeedback(Feedback feedback) {
        return this.getFeedbackDao().saveFeedback(feedback);
    }

    @Override
    public List<Feedback> getAllFeedback() {
        return this.getFeedbackDao().getAllFeedback();
    }
}
