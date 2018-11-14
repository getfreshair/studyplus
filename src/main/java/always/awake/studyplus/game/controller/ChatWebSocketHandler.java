package always.awake.studyplus.game.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import always.awake.studyplus.game.model.service.GameService;
import always.awake.studyplus.game.model.vo.PlayGameUsers;
import always.awake.studyplus.member.model.vo.Member;

public class ChatWebSocketHandler extends TextWebSocketHandler {

	@Autowired
	private GameService gs;

	private Map<String,WebSocketSession> users = new ConcurrentHashMap<String,WebSocketSession>();

	/*
	 * 클라이언트가 연결되면, 클라이언트의 관련된 WebSocketSession을 users 맵에 저장한다.
	 * 이 users 맵은 채팅 메시지를 연결된 전체 클라이언트에 전달할 때 사용
	 */

	// 연결 시 
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

		System.out.println("게임 세션 : " + session.getId() + " 연결됨");
		Member loginUser;
		Map<String, Object> map;
		map = session.getAttributes();
		loginUser = (Member)map.get("loginUser");
		int result = gs.inusertGameUserInfo(loginUser.getMember_Code());
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
		Member loginUser;
		Map<String, Object> map;
		map = session.getAttributes();
		loginUser = (Member)map.get("loginUser");
		
		// 요청 값이 게임인 경우
		if(msg.substring(0, 8).equals("gameMsg:")) { 
			// 입장일 경우 처리할 부분 
			if(msg.substring(msg.lastIndexOf(":") + 1 , msg.length()).equals("입장")) {
				//List<Object> ulist = gs.selectGamePlayer(loginUser.getMember_Code());
				List<Integer> playUserCodeList = gs.selectGamePlayerList();
			}
			// 퇴장 처리
			else if (msg.substring(msg.lastIndexOf(":") + 1 , msg.length()).equals("퇴장")) {
				System.out.println("퇴장이다");
			}
			/*users.get(member.code).sendMessage(message);*/
		} else {
			System.out.println("시스템 오류 발생...");
		}
		


		/*if(msg.substring(msg.indexOf(":")+1, msg.length()).equals("입장")) { // 로그인시 친구에게 알리기 위해

			List<Member> loginUserFriends = ms.selectFriendList(loginUser.getMember_Code());

			for(Member m : loginUserFriends) {

				if(users.get(m.getMember_Code() + "") != null) {

					users.get(m.getMember_Code() + "").sendMessage(message);
				}
			}
		}*/
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		System.out.println(session.getId() + " 익셉션 발생 : " + exception.getMessage());
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("게임 " + session.getId() + " 연결 종료됨");
		Member loginUser;
		Map<String, Object> map;
		map = session.getAttributes();
		loginUser = (Member)map.get("loginUser");
		int result = gs.deleteGameUserInfo(loginUser.getMember_Code());
		sendMsgLogout(loginUser);
		users.remove(loginUser.getMember_Code() + "");
	}
	
	public void sendMsgLogout(Member loginUser) throws Exception {// 로그아웃 시 친구들에게 알림  // // 친구 퇴장 프로세스 1)

		CharSequence msg = "msg:" + loginUser.getMember_Nickname() + ":퇴장";
		TextMessage message = new TextMessage(msg);

		handleTextMessage(users.get(loginUser.getMember_Code() + ""), message);
	}
}