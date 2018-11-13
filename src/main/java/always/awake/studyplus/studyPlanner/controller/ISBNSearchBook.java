package always.awake.studyplus.studyPlanner.controller;

//네이버 검색 API 예제 - blog 검색
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class ISBNSearchBook {
	
public static String bookIsbn(String searchTit) {
    StringBuffer response = new StringBuffer();

	String clientId = "jbnrMpjhUYr0t3MsTWPX";//애플리케이션 클라이언트 아이디값";
    String clientSecret = "bN5p0u6Hps";//애플리케이션 클라이언트 시크릿값";
    try {
        String text = URLEncoder.encode(searchTit, "UTF-8");
        String apiURL = "https://openapi.naver.com/v1/search/book.json?query="+ text; // json 결과
        URL url = new URL(apiURL);
        HttpURLConnection con = (HttpURLConnection)url.openConnection();
        con.setRequestMethod("GET");
        con.setRequestProperty("X-Naver-Client-Id", clientId);
        con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
        int responseCode = con.getResponseCode();
        BufferedReader br;
        if(responseCode==200) { // 정상 호출
            br = new BufferedReader(new InputStreamReader(con.getInputStream()));
        } else {  // 에러 발생
            br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
        }
        String inputLine;
        while ((inputLine = br.readLine()) != null) {
            response.append(inputLine);
        }
        br.close();
        //System.out.println(response.toString());
        
        return response.toString();
        
    } catch (Exception e) {
        System.out.println(e);
    }
	return response.toString();
}


}
