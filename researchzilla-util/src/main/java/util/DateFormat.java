package util;

import org.apache.commons.lang3.time.DurationFormatUtils;

/**
 * User: yumingzhe
 * Date: 5/28/12
 * Time: 9:02 PM
 */
public class DateFormat {
    /**
     * @param start start time
     * @param end   end time
     * @return year, month, day, hour, minute, second
     */
    public static String formatPeriod(long start, long end) {
        String period = DurationFormatUtils.formatPeriod(start, end, "y,M,d,H,m,s");
        String[] date = period.split(",");
        String result = "";
        if (date[0] != null && !date[0].equals("0")) {
            result += date[0] + "年";
        }
        if (date[1] != null && !date[1].equals("0")) {
            result += date[1] + "月";
        }
        if (date[2] != null && !date[2].equals("0")) {
            result += date[2] + "天";
        }
        if (date[3] != null && !date[3].equals("0")) {
            result += date[3] + "时";
        }
        if (date[4] != null && !date[4].equals("0")) {
            result += date[4] + "分";
        }
        if (result.equals("")) {
            result += "刚刚";
        }
        return result;
    }
}
