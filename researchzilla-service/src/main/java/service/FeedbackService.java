package service;

import pojo.Feedback;
import java.io.Serializable;
import java.util.List;

/**
 * User: wangyan
 * Date: 12-5-23
 * Time: 上午10:32
 */
public interface FeedbackService {
    public Serializable saveFeedback(Feedback feedback);

    public List<Feedback> getAllFeedback();

    public int getFeedbackTotalCount();

    public int getFeedbackTotalPage(int pageSize);

    public List<Feedback> getFeedback(final int pageSize, final int currentPage);

    public Feedback getOneFeedbackByID(int id);

    public void deleteOneFeedbackByID(int id);
}
