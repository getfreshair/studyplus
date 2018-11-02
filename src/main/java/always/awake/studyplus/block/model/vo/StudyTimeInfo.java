package always.awake.studyplus.block.model.vo;

import java.util.HashMap;

public class StudyTimeInfo {
	private int code ;
	private HashMap<Integer,Double> timesMap;
	private String studyDate;
	

	
	public StudyTimeInfo() { }



	public StudyTimeInfo(int code, HashMap<Integer, Double> timesMap, String studyDate) {
		super();
		this.code = code;
		this.timesMap = timesMap;
		this.studyDate = studyDate;
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



	@Override
	public String toString() {
		return "StudyTimeInfo [code=" + code + ", timesMap=" + timesMap + ", studyDate=" + studyDate + "]";
	}


	
	
}
