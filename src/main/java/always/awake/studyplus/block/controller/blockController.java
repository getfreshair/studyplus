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
	public void blockTimesTempSave(@RequestParam("todayStudyTime") String studyTime,
			@RequestParam("groupList") String groupList, @RequestParam("goalList") String goalList,
			HttpServletResponse response) {
		System.out.println(groupList);
		System.out.println(goalList);

		// 파일 기록 
		// 현재 시간대 설정
		String timeZone =new SimpleDateFormat("HH").format(new GregorianCalendar().getTimeInMillis());
		writeTimeDataFile(0,/*Double.parseDouble(studyTime)*/174000,timeZone);
		try {
			response.getWriter().println("데이타 임시 저장 성공");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void writeTimeDataFile(int dateCount,double studyTime,String timeZone) {
		
		System.out.println("dateCount : " +  dateCount + " / studyTime : " + studyTime + " / timeZone : " + timeZone);
		// 저장할 파일 경로
		String path = "C:\\studyPlanner\\timmerDatas\\";
		
		// 저장할 파일 명
		Calendar cal = new GregorianCalendar();
		cal.add(Calendar.DATE, dateCount);
		if(dateCount < 0) {
			cal.add(Calendar.HOUR_OF_DAY, 24);
		}
		String fileName = new SimpleDateFormat("yyyy-MM-dd-").format(cal.getTimeInMillis())+"StudyTime.txt";
		
		// 공부한 시간대 초기화
		Calendar cal1 = new GregorianCalendar();
		cal1.add(Calendar.DATE, dateCount);
		cal1.set(Calendar.HOUR_OF_DAY, Integer.parseInt(timeZone));
		cal1.set(Calendar.MINUTE, 0);
		cal1.set(Calendar.SECOND, 0);
		
		// 파일 생성
		File file = new File(path + fileName);
		 
		// 날짜변경 체크용 변수
		int check = 0;
		int sumStudyTime = 0;
		int saveTimeZone = Integer.parseInt(timeZone)-1;
		try {
			// I/O Stream 생성
			BufferedWriter bw = new BufferedWriter(new FileWriter(file, true));
			
			// 현재 시간대를 기준으로 현재시간의 지나간 시간
			long checkTime = cal.getTimeInMillis() - cal1.getTimeInMillis();
			
			// 시간대별 공부 시간 저장
			// 현재 시간대 이전의 공부시간이 존재할 경우
			if ((studyTime ) > (checkTime/1000)) {
				double checkTimeZone = Math.ceil(((studyTime - (checkTime / 1000.0)) / 3600.0));
				// 현재 시간대의 공부량 기록
				bw.write("[" + saveTimeZone + "]" + (checkTime / 1000));
				sumStudyTime+= (checkTime / 1000);
				bw.newLine();
				// 공부한 시간 기준으로 이전 시간대만큼 반복
				for (int i = 1; i <= checkTimeZone; i++) {
					// 이전시간대와 비교 시간대가 일치하지 않을 경우 
					if (i != checkTimeZone) {
						bw.write("[" + (saveTimeZone - i) + "]3600");
						bw.newLine();
						sumStudyTime+= 3600;
						if((saveTimeZone - i) < 0){
							check++;
							break;
						}
					// 이전 시간대와 비교 시간대가 일치할 경우
					} else {
						// 이전시간대의 날짜가 넘어가는 경우 체크
						bw.write("[" + (saveTimeZone - i) + "]"
								+ (studyTime - (3600 * (i - 1)) - (checkTime / 1000)));
						bw.newLine();
					}
				}
			} else {
				bw.write("[" + saveTimeZone + "]" + studyTime);
				bw.newLine();
			}
			bw.flush();
			bw.close();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 재귀호출로 남은 공부 처리 
		if(check == 1 ) {
			// (날짜 / 남은시간/ 타임존)을 인자로 메소드 재귀호출
			System.out.println("sumStudyTime : " + sumStudyTime);
			System.out.println("studyTime-sumStudyTime : " + (studyTime-sumStudyTime));
			writeTimeDataFile(--dateCount,studyTime-sumStudyTime,"23");
		}
		
	}

	@RequestMapping(value = "saveStudyTime.bl")
	public String saveStudyTime() {

		return "redirect:studyPlannerMain.me";
	}

}
