package pojo;

import java.sql.Timestamp;

/**
 * User: yumingzhe
 * Date: 5/20/12
 * Time: 11:06 AM
 */
public class SiteLetter {


    public class Message {
        private Integer messageId;
        private Integer senderId;
        private Integer receiverId;
        private String title;
        private String content;
        private Timestamp sendTime;
        private Boolean read;

        public Integer getMessageId() {
            return messageId;
        }

        public void setMessageId(Integer messageId) {
            this.messageId = messageId;
        }

        public Integer getSenderId() {
            return senderId;
        }

        public void setSenderId(Integer senderId) {
            this.senderId = senderId;
        }

        public Integer getReceiverId() {
            return receiverId;
        }

        public void setReceiverId(Integer receiverId) {
            this.receiverId = receiverId;
        }

        public String getTitle() {
            return title;
        }

        public void setTitle(String title) {
            this.title = title;
        }
    }
}
