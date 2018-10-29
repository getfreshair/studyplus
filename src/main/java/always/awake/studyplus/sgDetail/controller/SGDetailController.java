package always.awake.studyplus.sgDetail.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SGDetailController {
	
	@RequestMapping(value="studyGroupDetailPage.sgd")
	public String studyGroupDetailPage() {
		return "studyGroupDetail/groupDetailPage";
	}
}
