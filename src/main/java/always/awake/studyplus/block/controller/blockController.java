
package always.awake.studyplus.block.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.client.HttpClient;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import always.awake.studyplus.block.model.service.BlockService;
import always.awake.studyplus.block.model.vo.StudyTimeInfo;
import always.awake.studyplus.game.model.vo.PlayGameUsers;
import always.awake.studyplus.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class blockController {

	@Autowired
	private BlockService bs;

	// 차단메인화면 전환용 메소드
	@RequestMapping("showBlockMain.bl")
	public String showBlockMain(HttpServletRequest requeest, Model model) {

		HashMap<String, Object> dataMap = bs
				.selectStudyTimes(((Member) (requeest.getSession().getAttribute("loginUser"))).getMember_Code());
		model.addAttribute("dataMap", dataMap);
		
		File statusFile = new File("C:\\studyPlanner\\programData\\status\\RunStatus");
		try {
			BufferedWriter bw = new BufferedWriter(new FileWriter(statusFile));
			bw.write("start");
			bw.flush();
			bw.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "block/blockMain";
	}

	// 위치 차단 설정 화면 전환용 메소드
	@RequestMapping("showLocation.bl")
	public ModelAndView showLocation(ModelAndView mv) {

		List<String> list = getBlockLocationInfo();

		mv.addObject("list", list);
		mv.setViewName("block/blockLocation");
		
		return mv;
	}

	// 프로그램 차단 설정 화면 전환용 메소드
	@RequestMapping("showWeb.bl")
	public ModelAndView showWeb(ModelAndView mv) {
		mv.setViewName("block/blockWeb");
		return mv;
	}

	// 웹 차단 설정 화면 전환용 메소드
	@RequestMapping("showProgram.bl")
	public ModelAndView showProgram(ModelAndView mv) {
		mv.setViewName("block/blockProgram");
		return mv;
	}

	// 웹 차단 설정 메인 컨트롤 화면 전환용 메소드
	@RequestMapping("showSettingMain.bl")
	public String showSettingMain(HttpServletRequest request, Model model) {
		return "block/blockSettingMain";
	}

	// 스케쥴 정보 받아오는 메소드
	public StringBuilder getScheduleData() {


		File schedulaData = new File("C:\\studyPlanner\\programData\\settingDatas\\scheduleData");

		StringBuilder scheduleData = new StringBuilder();

		try {

			if (!schedulaData.exists()) {
				schedulaData.createNewFile();
			}

			BufferedReader br = new BufferedReader(new FileReader(schedulaData));
			String temp = "";
			while ((temp = br.readLine()) != null) {
				scheduleData.append(temp);
			}

			br.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (scheduleData.toString().equals("")) {
			scheduleData.append("emptyData");
		}
		return scheduleData;
	}

	// 시간표 설정 화면 전환용 메소드
	@RequestMapping("showSchedule.bl")
	public ModelAndView showSchedule(ModelAndView mv) {

		
		mv.setViewName("block/blockSchedule");

		return mv;
	}
	@RequestMapping("selectScheduleData.bl")
	public void selectScheduleData(HttpServletResponse response) {
		StringBuilder scheduleData = getScheduleData();
		
		
		try {
			response.getWriter().println(scheduleData.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	};

	// 임시파일 저장용 메소드
	@RequestMapping("blockTimesTempSave.bl")
	public void blockTimesTempSave(@RequestParam("todayStudyTime") String studyTime,
			@RequestParam("groupTimmerInfo") String groupTimmerInfo,
			@RequestParam("goalTimmerInfo") String goalTimmerInfo, HttpServletResponse response) {


		// 현재 시간대 설정
		String timeZone = new SimpleDateFormat("HH").format(new GregorianCalendar().getTimeInMillis());
		// 개인 공부 시간 임시 파일 생성
		writeTimeDataFile("PersonalStudyTime", 0, Double.parseDouble(studyTime), timeZone);

		// 그룹 공부시간 임시 파일 생성
		if (!groupTimmerInfo.equals("") && groupTimmerInfo != null) {
			// Data를 필요한 형태로 추출
			String[] splitInfo = groupTimmerInfo.split(",");
			String groupCode = splitInfo[0].substring(splitInfo[0].indexOf(":") + 1);
			double groupStudyTime = Double.parseDouble(splitInfo[1].substring(splitInfo[1].indexOf(":") + 1));

			writeTimeDataFile("GroupStudyTime[" + groupCode + "]", 0, groupStudyTime, timeZone);
		}

		// 목표 공부시간 임시 파일 생성
		if (!goalTimmerInfo.equals("") && goalTimmerInfo != null) {
			// Data를 필요한 형태로 추출
			String[] splitInfo = goalTimmerInfo.split(",");
			String goalCode = splitInfo[0].substring(splitInfo[0].indexOf(":") + 1);
			double goalStudyTime = Double.parseDouble(splitInfo[1].substring(splitInfo[1].indexOf(":") + 1));
			writeTimeDataFile("GoalStudyTime[" + goalCode + "]", 0, goalStudyTime, timeZone);
		}

		try {
			response.getWriter().println("데이타 임시 저장 성공");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// 파일 생성용 메소드
	public void writeTimeDataFile(String division, int dateCount, double studyTime, String timeZone) {
		// 저장할 파일 경로
		String path = "C:\\studyPlanner\\timmerDatas\\";

		// 저장할 파일 명
		Calendar cal = new GregorianCalendar();
		cal.add(Calendar.DATE, dateCount);
		if (dateCount < 0) {
			cal.set(Calendar.HOUR_OF_DAY, 24);
			cal.set(Calendar.MINUTE, 0);
			cal.set(Calendar.SECOND, 0);
			cal.set(Calendar.MILLISECOND, 0);
		}
		String fileName = new SimpleDateFormat("yyyy-MM-dd_").format((cal.getTimeInMillis() - 1000)) + division
				+ ".txt";
		// 공부한 시간대 초기화
		Calendar cal1 = new GregorianCalendar();
		cal1.add(Calendar.DATE, dateCount);
		cal1.set(Calendar.HOUR_OF_DAY, Integer.parseInt(timeZone));
		cal1.set(Calendar.MINUTE, 0);
		cal1.set(Calendar.SECOND, 0);
		cal1.set(Calendar.MILLISECOND, 0);

		// 파일 생성
		File file = new File(path + fileName);

		// 날짜변경 체크용 변수
		int check = 0;
		int sumStudyTime = 0;
		int saveTimeZone = Integer.parseInt(timeZone);
		try {
			// I/O Stream 생성
			BufferedWriter bw = new BufferedWriter(new FileWriter(file, true));

			// 현재 시간대를 기준으로 현재시간의 지나간 시간
			long checkTime = cal.getTimeInMillis() - cal1.getTimeInMillis();

			// 시간대별 공부 시간 저장
			// 현재 시간대 이전의 공부시간이 존재할 경우
			if ((studyTime) > (checkTime / 1000)) {
				double checkTimeZone = Math.ceil(((studyTime - (checkTime / 1000.0)) / 3600.0));
				// 현재 시간대의 공부량 기록
				bw.write("[" + saveTimeZone + "]" + (checkTime / 1000));
				sumStudyTime += (checkTime / 1000);
				bw.newLine();
				// 공부한 시간 기준으로 이전 시간대만큼 반복
				for (int i = 1; i <= checkTimeZone; i++) {
					// 이전시간대와 비교 시간대가 일치하지 않을 경우
					if (i != checkTimeZone) {
						if ((saveTimeZone - i) < 0) {
							check++;
							break;
						}
						bw.write("[" + (saveTimeZone - i) + "]3600");
						bw.newLine();
						sumStudyTime += 3600;
						// 이전 시간대와 비교 시간대가 일치할 경우
					} else {
						// 이전시간대의 날짜가 넘어가는 경우 체크
						bw.write("[" + (saveTimeZone - i) + "]" + (studyTime - (3600 * (i - 1)) - (checkTime / 1000)));
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
		// 재귀호출로 남은 공부시간 처리
		if (check == 1) {
			// (날짜 / 남은시간/ 타임존)을 인자로 메소드 재귀호출
			writeTimeDataFile(division, --dateCount, studyTime - sumStudyTime, "23");
		}

	}

	// 공부시간 저장용 메소드
	@RequestMapping(value = "saveStudyTime.bl")
	public String insertStudyTime(HttpServletRequest requeest, Model model) {

		HashMap<String, ArrayList<StudyTimeInfo>> list = readStudyTimeFiles();

		int result = bs.insertStudyTimes(list,
				((Member) (requeest.getSession().getAttribute("loginUser"))).getMember_Code());

		
		File statusFile = new File("C:\\studyPlanner\\programData\\status\\RunStatus");
		try {
			BufferedWriter bw = new BufferedWriter(new FileWriter(statusFile));
			bw.write("pause");
			bw.flush();
			bw.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:studyPlannerMainPage.sp";
	}

	// 파일 정보 받기용 메소드
	public HashMap<String, ArrayList<StudyTimeInfo>> readStudyTimeFiles() {

		// 전체 리스트를 저장할 리스트
		HashMap<String, ArrayList<StudyTimeInfo>> totalList = new HashMap<String, ArrayList<StudyTimeInfo>>();
		// 개인 또는 그룹 공부시간 정보를 저장할 리스트
		ArrayList<StudyTimeInfo> StudyTimeList = new ArrayList<StudyTimeInfo>();
		// 목표 공부시간 정보를 저장할 리스트
		ArrayList<StudyTimeInfo> goalTimeList = new ArrayList<StudyTimeInfo>();
		File dir = new File("C:\\studyPlanner\\timmerDatas\\");
		File[] timmerDataFileList = dir.listFiles();

		for (File tempFile : timmerDataFileList) {
			// 파일이름으로 유효성 체크 && 저장할 컬렉션 분류
			if (tempFile.getName().contains("PersonalStudyTime") || tempFile.getName().contains("GroupStudyTime[")) {
				extractionData(tempFile.getName(), StudyTimeList);
			} else if (tempFile.getName().contains("GoalStudyTime[")) {
				extractionData(tempFile.getName(), goalTimeList);
			} else {
				System.out.println(tempFile.getName() + "은 studyPlusTimmer파일과 관련없는 파일입니다.");
			}
		}

		// 파일이 존재하지 않을 경우
		if (timmerDataFileList.length == 0) {
			return null;
			// 파일이 존재할 경우
		} else {
			// 그룹 또는 개인 공부시간 파일이 존재할 경우
			if (StudyTimeList.size() != 0) {
				totalList.put("studyTimeList", StudyTimeList);
			}
			// 목표 공부시간 파일이 존재할 경우
			if (goalTimeList.size() != 0) {
				totalList.put("goalTimeList", goalTimeList);

				// 총 공부시간 저장
				for (int i = 0; i < goalTimeList.size(); i++) {
					StudyTimeInfo temp = goalTimeList.get(i);
					int totalTime = 0;
					Set key = temp.getTimesMap().keySet();
					for (Iterator iterator = key.iterator(); iterator.hasNext();) {
						totalTime += temp.getTimesMap().get(iterator.next());
					}
					goalTimeList.get(i).setTotalTime(totalTime);
				}

			}
			return totalList;
		}
	}

	// 파일 정보 추출용 메소드
	public void extractionData(String fileName, ArrayList<StudyTimeInfo> list) {
		// 파일 정보를 저장할 vo
		StudyTimeInfo timeInfo = new StudyTimeInfo();
		// 그룹,목표 공부시간일 경우 code 추출
		if (fileName.contains("GoalStudyTime[") || fileName.contains("GroupStudyTime[")) {
			timeInfo.setCode(
					Integer.parseInt(fileName.substring(fileName.indexOf("[") + 1, fileName.lastIndexOf("]"))));
		} else {
			// 쓰레기값
			timeInfo.setCode(-99);
		}
		// 공부한 날짜 추출
		timeInfo.setStudyDate(fileName.substring(0, fileName.indexOf("_")));

		// 시간대별로 공부시간을 임시저장할 Map
		HashMap<Integer, Double> timesMap = new HashMap<Integer, Double>();
		try {
			BufferedReader br = new BufferedReader(new FileReader("C:\\studyPlanner\\timmerDatas\\" + fileName));
			String temp = "";
			while ((temp = br.readLine()) != null) {
				// 시간대 저장할 변수
				int timeZone = Integer.parseInt(temp.substring(temp.indexOf("[") + 1, temp.indexOf("]")));
				// 공부시간 저장할 변수
				double studyTime = Double.parseDouble(temp.substring(temp.lastIndexOf("]") + 1));

				// 중복되는 시간대 값 처리
				if (timesMap.get(timeZone) != null) {
					timesMap.put(timeZone, timesMap.get(timeZone) + studyTime);
				} else {
					timesMap.put(timeZone, studyTime);
				}
			}
			// Stream 반환
			br.close();
			// 공부시간 정보 저장
			timeInfo.setTimesMap(timesMap);
			// 리스트에 공부시간 정보 객체 저장
			list.add(timeInfo);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// 임시 파일 삭제
			File deleteFile = new File("C:\\studyPlanner\\timmerDatas\\" + fileName);
			deleteFile.delete();
		}
	}

	// 차단할 시간표 정보를 저장용
	@RequestMapping("blockScheduleSave.bl")
	public void blockScheduleSave(@RequestParam("scheduleData") String scheduleData, HttpServletResponse response) {


		File schedulaData = new File("C:\\studyPlanner\\programData\\settingDatas\\scheduleData");
		try {
			BufferedWriter bw = new BufferedWriter(new FileWriter(schedulaData));
			bw.write(scheduleData);
			bw.flush();
			bw.close();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			response.getWriter().println("스케쥴 정보 저장 성공!");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "saveBlockLocationDataOnMap.bl")
	public void saveBlockLocationDataOnMap(String inputLocation2,HttpServletResponse response) {
		writeBlockLocationData(inputLocation2);
		
		try {
			response.getWriter().println(inputLocation2.substring(inputLocation2.lastIndexOf(":")+1, inputLocation2.length()));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	// 차단할 위치정보 저장용 (맵으로 )  
	// 차단할 위치정보 저장용 (주소로 ) 
	@RequestMapping(value = "saveBlockLocationData.bl")
	public void saveBlockLocationData(String inputLocation,HttpServletResponse response) {
		writeBlockLocationData(inputLocation);
		
		try {
			response.getWriter().println(inputLocation.substring(inputLocation.lastIndexOf(":")+1, inputLocation.length()));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	// 위치 차단 정보 기록용
	public void writeBlockLocationData(String locationInfo) {

		File locationData = new File("C:\\studyPlanner\\programData\\settingDatas\\locationData");
		try {
			BufferedWriter bw = new BufferedWriter(new FileWriter(locationData, true));
			bw.write(locationInfo);
			bw.newLine();
			bw.flush();
			bw.close();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}

	// 위치 차단 정보 조회용
	public List<String> getBlockLocationInfo() {
		File locationData = new File("C:\\studyPlanner\\programData\\settingDatas\\locationData");
		ArrayList<String> list = new ArrayList<String>();
		try {
			BufferedReader br = new BufferedReader(new FileReader(locationData));
			String temp = "";
			while ((temp = br.readLine()) != null) {
				list.add(temp);
			}

			br.close();

		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	// 게임중인 유저 리스트 조회용 메소드
	@RequestMapping("selectUserList.bl")
	public @ResponseBody List<Object> selectUserList(HttpServletRequest request) {
		List<Object> plist = bs
				.selectGamePlayerList(((Member) (request.getSession().getAttribute("loginUser"))).getMember_Code());
		System.out.println(plist);
		return plist;
	}

	// 게임중인 유저 정보 죄회용 메소드
	@RequestMapping("renewalPlayer.bl")
	public @ResponseBody PlayGameUsers renewalPlayer(String msg) {
		int member_code = Integer.parseInt(msg.substring(0, msg.indexOf(":")));

		PlayGameUsers pgu = bs.selectPlayer(member_code);

		return pgu;
	}

	@RequestMapping("selectBlockProgramList.bl")
	public @ResponseBody ArrayList<String> selectBlockProgramList() {
		ArrayList<String> bplist = new ArrayList<String>();
		File file = new File("C:\\studyPlanner\\programData\\settingDatas\\blockProgramList");
		try {
			BufferedReader br = new BufferedReader(new FileReader(file));
			String temp = "";
			while ((temp = br.readLine()) != null) {
				bplist.add(temp);
			}
			br.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return bplist;
	}

	@RequestMapping("saveBlockProgram.bl")
	public void saveBlockProgram(MultipartFile file, HttpServletResponse response) {
		String fileName = file.getOriginalFilename();
		File saveFile = new File("C:\\studyPlanner\\programData\\settingDatas\\blockProgramList");
		try {
			BufferedWriter bw = new BufferedWriter(new FileWriter(saveFile, true));
			bw.write(fileName);
			bw.newLine();
			bw.flush();
			bw.close();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		try {
			response.getWriter().println(fileName);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/*@RequestMapping("getLocationInformation.bl")
	public void getLocationInformation(HttpServletResponse response) {

		HttpClient client = new HttpClient();
				new PostMe("http://localhost:8001/studyplus/WEB-INF/views/getLocationInformation.jsp");
		
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");

			response.getWriter().println("테스트");

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}*/
	
	@RequestMapping("deleteBlockProgram.bl")
	public @ResponseBody ArrayList<String> deleteBlockProgram(String deleteIndex) {
		String[] checkNum = deleteIndex.split(",");
		int cnt = 0;;
		
		
		ArrayList<String> bplist = new ArrayList<String>();
		File file = new File("C:\\studyPlanner\\programData\\settingDatas\\blockProgramList");
		try {
			BufferedReader br = new BufferedReader(new FileReader(file));
			String temp = "";
			while ((temp = br.readLine()) != null) {
				bplist.add(temp);
			}
			br.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		for (int i = 0; i < checkNum.length; i++) {
			int index = Integer.parseInt(checkNum[i])  - cnt;
			bplist.remove(index);
			cnt ++;
		}
		
		try {
			BufferedWriter bw = new BufferedWriter(new FileWriter("C:\\\\studyPlanner\\\\programData\\\\settingDatas\\\\blockProgramList"));
			for (int i = 0; i < bplist.size(); i++) {
				bw.write(bplist.get(i));
				bw.newLine();
			}
			bw.flush();
			bw.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return bplist;
	}
	
	@RequestMapping("selectWebSiteList.bl")
	public @ResponseBody ArrayList<String> selectWebSiteList() {
		ArrayList<String> bplist = new ArrayList<String>();
		File file = new File("C:\\studyPlanner\\programData\\settingDatas\\blockWebList");
		try {
			BufferedReader br = new BufferedReader(new FileReader(file));
			String temp = "";
			while ((temp = br.readLine()) != null) {
				bplist.add(temp);
			}
			br.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return bplist;
	}

	@RequestMapping("saveWebSite.bl")
	public void saveWebSite(String URLName, HttpServletResponse response) {
		File saveFile = new File("C:\\studyPlanner\\programData\\settingDatas\\blockWebList");
		try {
			BufferedWriter bw = new BufferedWriter(new FileWriter(saveFile, true));
			bw.write(URLName);
			bw.newLine();
			bw.flush();
			bw.close();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		try {
			response.getWriter().println(URLName);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping("deleteWebSite.bl")
	public @ResponseBody ArrayList<String> deleteWebSite(String deleteIndex) {
		String[] checkNum = deleteIndex.split(",");
		int cnt = 0;;
		
		
		ArrayList<String> bplist = new ArrayList<String>();
		File file = new File("C:\\studyPlanner\\programData\\settingDatas\\blockWebList");
		try {
			BufferedReader br = new BufferedReader(new FileReader(file));
			String temp = "";
			while ((temp = br.readLine()) != null) {
				bplist.add(temp);
			}
			br.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		for (int i = 0; i < checkNum.length; i++) {
			int index = Integer.parseInt(checkNum[i])  - cnt;
			bplist.remove(index);
			cnt ++;
		}
		
		try {
			BufferedWriter bw = new BufferedWriter(new FileWriter("C:\\studyPlanner\\programData\\settingDatas\\blockWebList"));
			for (int i = 0; i < bplist.size(); i++) {
				bw.write(bplist.get(i));
				bw.newLine();
			}
			bw.flush();
			bw.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return bplist;
	}
	
	@RequestMapping("deleteLocation.bl")
	public @ResponseBody ArrayList<String> deleteLocation(String deleteIndex) {
		String[] checkNum = deleteIndex.split(",");
		int cnt = 0;;
		
		
		ArrayList<String> bplist = new ArrayList<String>();
		File file = new File("C:\\studyPlanner\\programData\\settingDatas\\locationData");
		try {
			BufferedReader br = new BufferedReader(new FileReader(file));
			String temp = "";
			while ((temp = br.readLine()) != null) {
				bplist.add(temp);
			}
			br.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		for (int i = 0; i < checkNum.length; i++) {
			int index = Integer.parseInt(checkNum[i])  - cnt;
			bplist.remove(index);
			cnt ++;
		}
		
		try {
			BufferedWriter bw = new BufferedWriter(new FileWriter("C:\\studyPlanner\\programData\\settingDatas\\locationData"));
			for (int i = 0; i < bplist.size(); i++) {
				bw.write(bplist.get(i));
				bw.newLine();
			}
			bw.flush();
			bw.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return bplist;
	}
}
