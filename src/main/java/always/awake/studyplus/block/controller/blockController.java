package always.awake.studyplus.block.controller;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import always.awake.studyplus.block.model.service.BlockService;
import always.awake.studyplus.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class blockController {

	@Autowired
	private BlockService bs;

	@RequestMapping("showBlockMain.bl")
	public String showBlockMain(HttpServletRequest requeest, Model model) {

		HashMap<String, Object> dataMap = bs
				.selectStudyTimes(((Member) (requeest.getSession().getAttribute("loginUser"))).getMember_Code());
		model.addAttribute("dataMap", dataMap);
		return "block/blockMain";
	}

	@RequestMapping("blockTimesTempSave.bl")
	public void blockTimesTempSave(@RequestParam("todayStudyTime") String todayStudyTime,
			@RequestParam("groupList") String groupList, @RequestParam("goalList") String goalList,
			HttpServletResponse response) {
		System.out.println(groupList);
		System.out.println(goalList);

		///////////////// 오늘의 공부시간 대간대별 임시 저장 ///////////////////
		String path = "C:\\studyPlanner\\timmerDatas\\";
		String fileName = "toDayStudyTime.txt";
		String timeZone = new SimpleDateFormat("HH").format(new Date());
		// 공부시간대 체크
		Calendar cal1 = new GregorianCalendar();
		cal1.set(Calendar.HOUR_OF_DAY, Integer.parseInt(timeZone));
		cal1.set(Calendar.MINUTE, 0);
		cal1.set(Calendar.SECOND,0);
		cal1.set(Calendar.MILLISECOND, 0);
		Calendar cal2 = new GregorianCalendar();
		
		File file = new File(path + fileName);
		try {
			BufferedWriter bw = new BufferedWriter(new FileWriter(file, true));
			long checkTime = cal2.getTimeInMillis()-cal1.getTimeInMillis(); 
			// 전 시간대별 공부시간 체크
			if((Double.parseDouble(todayStudyTime)*1000)>checkTime) {
				double checkTimeZone = Math.ceil(((Long.parseLong(todayStudyTime)-(checkTime/1000))/3600.0));
				bw.write("[" + timeZone + "]" + (checkTime/1000));
				bw.newLine();
				for (int i = 1; i <= checkTimeZone; i++) {
					if(i != checkTimeZone) {
						bw.write("[" + (Integer.parseInt(timeZone)-i) + "]3600");
						bw.newLine();
					} else {
						bw.write("[" + (Integer.parseInt(timeZone)-i) + "]" + (Integer.parseInt(todayStudyTime)-(3600*(i-1))-(checkTime/1000)));
						bw.newLine();
					}
				}
			} else {
				bw.write("[" + timeZone + "]" + todayStudyTime);
				bw.newLine();
			}
			bw.flush();
			bw.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		///////////////////////////////////////////////////////////
		try {
			response.getWriter().println("데이타 임시 저장 성공");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@RequestMapping(value = "saveStudyTime.bl")
	public String saveStudyTime() {
		
		return "redirect:studyPlannerMain.me";
	}

}
