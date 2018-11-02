package always.awake.studyplus.messenger.controller;

import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;

public class HandshakeInterceptor extends HttpSessionHandshakeInterceptor{

	 @Override
	    public boolean beforeHandshake(ServerHttpRequest request,ServerHttpResponse response, WebSocketHandler wsHandler,
	         Map<String, Object> attributes) throws Exception {    
	    
	        // 위의 파라미터 중, attributes 에 값을 저장하면 웹소켓 핸들러 클래스의 WebSocketSession에 전달된다
	        System.out.println("Before Handshake");
//	          
//	          
//	        ServletServerHttpRequest ssreq = (ServletServerHttpRequest) request;
//	        System.out.println("URI:"+request.getURI());
//	  
//	        HttpServletRequest req =  ssreq.getServletRequest();
//	 
//	        String member2_Nickname = req.getParameter("member2_Nickname");
//	        System.out.println("member2_Nickname :"+member2_Nickname);
////	        attributes.put("userId", userId);
//	  
////	        // HttpSession 에 저장된 이용자의 아이디를 추출하는 경우
////	        String id = (String)req.getSession().getAttribute("id");
////	        attributes.put("userId", id);
////	        System.out.println("HttpSession에 저장된 id:"+id);
	         
	        return super.beforeHandshake(request, response, wsHandler, attributes);
	    }
}
