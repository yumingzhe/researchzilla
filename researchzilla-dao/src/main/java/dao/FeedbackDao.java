package dao;

import pojo.Feedback;
import java.io.Serializable;
import java.util.List;

/**
 * User: wangyan
 * Date: 12-5-23
 * Time: 上午10:27
 */
public interface FeedbackDao {
    public Serializable saveFeedback(Feedback feedback);

    public List<Feedback> getAllFeedback();

    public Feedback getOneFeedbackByID(int id);
}
