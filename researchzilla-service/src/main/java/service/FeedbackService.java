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
}
