package util;

import java.sql.Timestamp;
import java.util.Date;

/**
 * User: yumingzhe
 * Date: 5/20/12
 * Time: 9:09 PM
 */
public class TestDate {
    public static void main(String[] args) {
        Timestamp timestamp = new Timestamp(new Date().getTime());
        System.out.println("current time : " + timestamp.toString());
        Timestamp timestamp1 = new Timestamp(new Date().getTime() - 1000 * 60 * 60 * 24);
        System.out.println("24h previous :" + timestamp1.toString());

    }
}
