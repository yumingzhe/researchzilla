package util;

import org.apache.commons.lang3.RandomStringUtils;

import java.security.NoSuchAlgorithmException;

/**
 * User: yumingzhe
 * Date: 5/19/12
 * Time: 10:25 PM
 */
public class TestMD5Util {
    public static void main(String[] args) {
        try {
            String result = MD5Util.hashString("zhangsan");
            System.out.println(result);
            result = MD5Util.hashString("YUMINGZHE");
            System.out.println(result);
            result = MD5Util.hashString("wangwu");
            System.out.println(result);
            result = MD5Util.hashString("ymz7565092");
            System.out.println(result);
            result = MD5Util.hashString("zhang#feng789");
            System.out.println(result);
            result = MD5Util.hashString("berkeley university");
            System.out.println(result);
            System.out.println("-----------------------------");
            for (int i = 0; i < 10; i++) {
                System.out.println(RandomStringUtils.randomAlphanumeric(12));
            }


        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

    }
}
