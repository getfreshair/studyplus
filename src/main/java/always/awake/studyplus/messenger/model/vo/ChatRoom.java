package always.awake.studyplus.messenger.model.vo;

public class ChatRoom {

	private String chatroom_code;
	private String member1_code;
	private String member2_code;
	
	public ChatRoom() {
		super();
	}

	public ChatRoom(String chatroom_code, String member1_code, String member2_code) {
		super();
		this.chatroom_code = chatroom_code;
		this.member1_code = member1_code;
		this.member2_code = member2_code;
	}

	public String getChatroom_code() {
		return chatroom_code;
	}

	public void setChatroom_code(String chatroom_code) {
		this.chatroom_code = chatroom_code;
	}

	public String getMember1_code() {
		return member1_code;
	}

	public void setMember1_code(String member1_code) {
		this.member1_code = member1_code;
	}

	public String getMember2_code() {
		return member2_code;
	}

	public void setMember2_code(String member2_code) {
		this.member2_code = member2_code;
	}

	@Override
	public String toString() {
		return "ChatRoom [chatroom_code=" + chatroom_code + ", member1_code=" + member1_code + ", member2_code="
				+ member2_code + "]";
	}
}
