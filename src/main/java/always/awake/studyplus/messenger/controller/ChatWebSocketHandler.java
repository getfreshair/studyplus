package always.awake.studyplus.messenger.controller;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
import org.springframework.beans.factory.annotation.Autowired;
import always.awake.studyplus.member.model.vo.Member;
import always.awake.studyplus.messenger.model.Service.MessengerService;

public class ChatWebSocketHandler extends TextWebSocketHandler {

	private Map<String,WebSocketSession> users = new ConcurrentHashMap<String,WebSocketSession>();
	
	@Autowired
	private MessengerService ms;
	/*
	 * 클라이언트가 연결되면, 클라이언트의 관련된 WebSocketSession을 users 맵에 저장한다.
	 * 이 users 맵은 채팅 메시지를 연결된 전체 클라이언트에 전달할 때 사용
	 */
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println(session.getId() + " 연결됨");
		Member loginUser;
		Map<String, Object> map;
		map = session.getAttributes();
		loginUser = (Member)map.get("loginUser");

		users.put(loginUser.getMember_Code() + "", session);
	}
	
	/*
	 * 클라이언트가 전송한 메시지를 users 맵에 보관한 전체 WebSocketSession에 다시 전달한다.
	 * 클라이언트는 메시지를 수신하면 채팅 영역에 보여주도록 구현.
	 * 특정 클라이언트가 채팅 메시지를 서버에 보내면 전체 클라이언트는 다시 그 메시지를 받아서 화면에 보여주게 된다.
	 */

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		String msg = message.getPayload();
		msg = msg.substring(4, msg.length());
		
		String sendNickname = msg.substring(0, msg.indexOf(":"));
		String msg_content = msg.substring(msg.indexOf(":")+1, msg.lastIndexOf(":"));
		String receiverNickname = msg.substring(msg.lastIndexOf(":")+1, msg.length());
		
		Member loginUser;
		Map<String, Object> map;
		map = session.getAttributes();
		loginUser = (Member)map.get("loginUser");

		int receiverMemberCode = 0;
		receiverMemberCode = ms.selectReceiverMemberCode(receiverNickname);
		System.out.println(receiverMemberCode);
		
		if(users.get(receiverMemberCode+"") != null) {
			users.get(receiverMemberCode+"").sendMessage(message);
			ms.insertMessage(msg_content, loginUser.getMember_Code(), receiverMemberCode, 1, 0); // 내용, 보내는사람, 받는사람, 상태, 구분
		}else {
			System.out.println("없다 : " + users.get(receiverMemberCode+""));
			ms.insertMessage(msg_content, loginUser.getMember_Code(), receiverMemberCode, 0, 0); // 내용, 보내는사람, 받는사람, 상태, 구분
		}
		users.get(loginUser.getMember_Code()+"").sendMessage(message);
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		System.out.println(session.getId() + " 익셉션 발생 : " + exception.getMessage());
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println(session.getId() + " 연결 종료됨");
		Member loginUser;
		Map<String, Object> map;
		map = session.getAttributes();
		loginUser = (Member)map.get("loginUser");
		
		users.remove(loginUser.getMember_Code() + "");
	}
	
}