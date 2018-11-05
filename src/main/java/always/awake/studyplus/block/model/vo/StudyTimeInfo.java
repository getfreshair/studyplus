package always.awake.studyplus.block.model.vo;

import java.util.HashMap;

public class StudyTimeInfo {
	private int code ;
	private HashMap<Integer,Double> timesMap;
	private String studyDate;
	private int totalTime ;
	private int loginUserCode;
	
	public StudyTimeInfo() { }

	public StudyTimeInfo(int code, HashMap<Integer, Double> timesMap, String studyDate, int totalTime,
			int loginUserCode) {
		super();
		this.code = code;
		this.timesMap = timesMap;
		this.studyDate = studyDate;
		this.totalTime = totalTime;
		this.loginUserCode = loginUserCode;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public HashMap<Integer, Double> getTimesMap() {
		return timesMap;
	}

	public void setTimesMap(HashMap<Integer, Double> timesMap) {
		this.timesMap = timesMap;
	}

	public String getStudyDate() {
		return studyDate;
	}

	public void setStudyDate(String studyDate) {
		this.studyDate = studyDate;
	}

	public int getTotalTime() {
		return totalTime;
	}

	public void setTotalTime(int totalTime) {
		this.totalTime = totalTime;
	}

	public int getLoginUserCode() {
		return loginUserCode;
	}

	public void setLoginUserCode(int loginUserCode) {
		this.loginUserCode = loginUserCode;
	}

	@Override
	public String toString() {
		return "StudyTimeInfo [code=" + code + ", timesMap=" + timesMap + ", studyDate=" + studyDate + ", totalTime="
				+ totalTime + ", loginUserCode=" + loginUserCode + "]";
	}

}
