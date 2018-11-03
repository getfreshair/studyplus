package always.awake.studyplus.messenger.model.vo;

import java.sql.Date;

public class Message {

	private int message_code;
	private int sender_message_code;
	private int receiver_message_code;
	private int receiver_group_code;
	private int message_status;
	private int message_type;
	private Date message_send_date;
	private String message_content;
	private String sender_nickName;
	private String sender_img_name;
	
	public Message() {
		super();
	}

	public Message(int message_code, int sender_message_code, int receiver_message_code, int receiver_group_code,
			int message_status, int message_type, Date message_send_date, String message_content,
			String sender_nickName, String sender_img_name) {
		super();
		this.message_code = message_code;
		this.sender_message_code = sender_message_code;
		this.receiver_message_code = receiver_message_code;
		this.receiver_group_code = receiver_group_code;
		this.message_status = message_status;
		this.message_type = message_type;
		this.message_send_date = message_send_date;
		this.message_content = message_content;
		this.sender_nickName = sender_nickName;
		this.sender_img_name = sender_img_name;
	}

	public int getMessage_code() {
		return message_code;
	}

	public void setMessage_code(int message_code) {
		this.message_code = message_code;
	}

	public int getSender_message_code() {
		return sender_message_code;
	}

	public void setSender_message_code(int sender_message_code) {
		this.sender_message_code = sender_message_code;
	}

	public int getReceiver_message_code() {
		return receiver_message_code;
	}

	public void setReceiver_message_code(int receiver_message_code) {
		this.receiver_message_code = receiver_message_code;
	}

	public int getReceiver_group_code() {
		return receiver_group_code;
	}

	public void setReceiver_group_code(int receiver_group_code) {
		this.receiver_group_code = receiver_group_code;
	}

	public int getMessage_status() {
		return message_status;
	}

	public void setMessage_status(int message_status) {
		this.message_status = message_status;
	}

	public int getMessage_type() {
		return message_type;
	}

	public void setMessage_type(int message_type) {
		this.message_type = message_type;
	}

	public Date getMessage_send_date() {
		return message_send_date;
	}

	public void setMessage_send_date(Date message_send_date) {
		this.message_send_date = message_send_date;
	}

	public String getMessage_content() {
		return message_content;
	}

	public void setMessage_content(String message_content) {
		this.message_content = message_content;
	}

	public String getSender_nickName() {
		return sender_nickName;
	}

	public void setSender_nickName(String sender_nickName) {
		this.sender_nickName = sender_nickName;
	}

	public String getSender_img_name() {
		return sender_img_name;
	}

	public void setSender_img_name(String sender_img_name) {
		this.sender_img_name = sender_img_name;
	}

	@Override
	public String toString() {
		return "Message [message_code=" + message_code + ", sender_message_code=" + sender_message_code
				+ ", receiver_message_code=" + receiver_message_code + ", receiver_group_code=" + receiver_group_code
				+ ", message_status=" + message_status + ", message_type=" + message_type + ", message_send_date="
				+ message_send_date + ", message_content=" + message_content + ", sender_nickName=" + sender_nickName
				+ ", sender_img_name=" + sender_img_name + "]";
	}
}
