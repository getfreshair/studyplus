package always.awake.studyplus.messenger.controller;


import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import always.awake.studyplus.member.model.vo.Member;
import always.awake.studyplus.messenger.model.Service.MessengerService;

@Controller
public class MessengerController {

	@Autowired
	MessengerService ms;

	@RequestMapping(value="selectFriendList.ms")
	public @ResponseBody List<Object> selectFriendList(@RequestParam int member_Code, 
			HttpServletResponse response){
		
		List<Object> friendList = ms.selectFriendList(member_Code);

		System.out.println(friendList);
		return friendList;
	}
}
