package always.awake.studyplus.groupMessenger.controller;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import always.awake.studyplus.groupMessenger.model.service.GroupMessengerService;
import always.awake.studyplus.member.model.service.MemberService;
import always.awake.studyplus.member.model.vo.Member;

public class ChatWebSocketHandler extends TextWebSocketHandler {

	@Autowired
	private GroupMessengerService ms;

	private Map<String,WebSocketSession> users = new ConcurrentHashMap<String,WebSocketSession>();

	/*
	 * 클라이언트가 연결되면, 클라이언트의 관련된 WebSocketSession을 users 맵에 저장한다.
	 * 이 users 맵은 채팅 메시지를 연결된 전체 클라이언트에 전달할 때 사용
	 */

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

		System.out.println("그룹 채팅 " + session.getId() + " 연결됨");
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
		
		if(msg.substring(0, 9).equals("groupMsg:")) { // 그룹 메시지일 때
			
			msg = msg.substring(9, msg.length());
			int group_Code = Integer.parseInt(msg.substring(msg.lastIndexOf(":")+1, msg.length()));
			List<Member> groupMember = ms.selectGroupMemberList(group_Code);

			for(Member m : groupMember) {

				if(users.get(m.getMember_Code() + "") != null) {
	
					users.get(m.getMember_Code() + "").sendMessage(message);
				}
			}
		}
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		System.out.println(session.getId() + " 익셉션 발생 : " + exception.getMessage());
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("그룹채팅 " + session.getId() + " 연결 종료됨");
		Member loginUser;
		Map<String, Object> map;
		map = session.getAttributes();
		loginUser = (Member)map.get("loginUser");

		users.remove(loginUser.getMember_Code() + "");
	}
}