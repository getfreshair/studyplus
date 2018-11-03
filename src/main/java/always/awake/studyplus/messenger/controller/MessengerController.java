package always.awake.studyplus.messenger.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import always.awake.studyplus.messenger.model.Service.MessengerService;


@Controller
public class MessengerController {

	@Autowired
	MessengerService ms;

	@RequestMapping(value="selectFriendList.ms")
	public @ResponseBody List<Object> selectFriendList(@RequestParam int member_Code, 
			HttpServletResponse response){
		
		List<Object> friendList = ms.selectFriendList(member_Code);

		return friendList;
	}
	
	@RequestMapping(value="openChat.ms")
	public ModelAndView openChat(@RequestParam("member1_Nickname")String member1_Nickname, @RequestParam("member2_Nickname")String member2_Nickname, ModelAndView mv){
		System.out.println(member1_Nickname + ", " + member2_Nickname);
		
		mv.addObject("member1_Nickname", member1_Nickname);
		mv.addObject("member2_Nickname", member2_Nickname);

		mv.setViewName("messenger/chatting");
		return mv;
	}
	
	@RequestMapping(value="selectMessageList.ms")
	public @ResponseBody List<Object> selectMessageList(@RequestParam int member_Code, @RequestParam String receiverNickName,
			HttpServletResponse response){
		
		List<Object> messageList = ms.selectMessageList(member_Code, receiverNickName);

		return messageList;
	}
	
	@RequestMapping(value="insertMessage.ms")
	public @ResponseBody int insertMessage(@RequestParam String msg_content, @RequestParam String sender_member_nickname, @RequestParam int receiver_member_code,
			@RequestParam int status, @RequestParam int type) {
		
		ms.insertMessage(msg_content, sender_member_nickname, receiver_member_code, status, type);
		
		return 1;
	}
	
	@RequestMapping(value="selectUnreadMessage.ms")
	public @ResponseBody int selectUnreadMessage(@RequestParam int member_Code) {
		
		int msgCount = ms.selectUnreadMessage(member_Code);
		
		return msgCount;
	}
	
	@RequestMapping(value="unreadToRead.ms")
	public @ResponseBody int unreadToRead(@RequestParam int member_Code, @RequestParam String receiverNickName) {
		
		int updateCount = ms.unreadToRead(member_Code, receiverNickName);
		
		return updateCount;
	}
	
	@RequestMapping(value="eachUnreadMsg.ms")
	public @ResponseBody int eachUnreadMsg(@RequestParam int member_Code, int eachFriendMemberCode) {
		
		int msgCount = ms.selectEachUnreadMessage(member_Code, eachFriendMemberCode);
		
		return msgCount;
	}
	
	@RequestMapping(value="selcectMemberProfile.ms")
	public @ResponseBody String selcectMemberProfile(@RequestParam String member_Nickname) {
		
		String imgName = ms.selcectMemberProfile(member_Nickname);
		
		return imgName;
	}
}
