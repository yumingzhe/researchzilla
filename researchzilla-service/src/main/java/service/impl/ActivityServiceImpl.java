package service.impl;

import dao.ActivityDao;
import pojo.Activity;
import service.ActivityService;

import java.io.Serializable;

/**
 * User: yumingzhe
 * Date: 5/24/12
 * Time: 3:30 PM
 */
public class ActivityServiceImpl implements ActivityService {
    private ActivityDao activityDao;

    public ActivityDao getActivityDao() {
        return activityDao;
    }

    public void setActivityDao(ActivityDao activityDao) {
        this.activityDao = activityDao;
    }

    @Override
    public Serializable saveActivity(Activity activity) {
        return activityDao.saveActivity(activity);
    }
}
