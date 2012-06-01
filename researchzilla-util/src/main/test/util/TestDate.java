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
        Date date1 = new Date();
        date1.setDate(1);
        date1.setMonth(5);
        date1.setYear(2012);

        Date date2 = new Date();
        date2.setMonth(5);
        date2.setYear(2012);
        date2.setDate(1);
        System.out.println(DateFormat.formatPeriod(date1.getTime(), date2.getTime()));
    }
}
