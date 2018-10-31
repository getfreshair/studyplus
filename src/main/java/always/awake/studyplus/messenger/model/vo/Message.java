package always.awake.studyplus.messenger.model.vo;

import java.sql.Date;

public class Message {

	private String message_code;
	private String message_sender;
	private String message_receiver;
	private String message_content;
	private Date message_sendTime;
	private Date message_readTime;
	private String chatroom_code;
	
	public Message() {
		super();
	}

	public Message(String message_code, String message_sender, String message_receiver, String message_content,
			Date message_sendTime, Date message_readTime, String chatroom_code) {
		super();
		this.message_code = message_code;
		this.message_sender = message_sender;
		this.message_receiver = message_receiver;
		this.message_content = message_content;
		this.message_sendTime = message_sendTime;
		this.message_readTime = message_readTime;
		this.chatroom_code = chatroom_code;
	}

	public String getMessage_code() {
		return message_code;
	}

	public void setMessage_code(String message_code) {
		this.message_code = message_code;
	}

	public String getMessage_sender() {
		return message_sender;
	}

	public void setMessage_sender(String message_sender) {
		this.message_sender = message_sender;
	}

	public String getMessage_receiver() {
		return message_receiver;
	}

	public void setMessage_receiver(String message_receiver) {
		this.message_receiver = message_receiver;
	}

	public String getMessage_content() {
		return message_content;
	}

	public void setMessage_content(String message_content) {
		this.message_content = message_content;
	}

	public Date getMessage_sendTime() {
		return message_sendTime;
	}

	public void setMessage_sendTime(Date message_sendTime) {
		this.message_sendTime = message_sendTime;
	}

	public Date getMessage_readTime() {
		return message_readTime;
	}

	public void setMessage_readTime(Date message_readTime) {
		this.message_readTime = message_readTime;
	}

	public String getChatroom_code() {
		return chatroom_code;
	}

	public void setChatroom_code(String chatroom_code) {
		this.chatroom_code = chatroom_code;
	}

	@Override
	public String toString() {
		return "Message [message_code=" + message_code + ", message_sender=" + message_sender + ", message_receiver="
				+ message_receiver + ", message_content=" + message_content + ", message_sendTime=" + message_sendTime
				+ ", message_readTime=" + message_readTime + ", chatroom_code=" + chatroom_code + "]";
	}
}
