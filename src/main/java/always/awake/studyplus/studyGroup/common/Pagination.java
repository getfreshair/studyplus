package always.awake.studyplus.studyGroup.common;

import always.awake.studyplus.studyGroup.model.vo.PageInfo;

public class Pagination {
	public static PageInfo getPageInfo(int currentPage, int listCount, String searchSGName, int location_Code, int category_Code) {
		PageInfo pi = null;
		
		int limit = 9;
		int maxPage;
		int startPage;
		int endPage;
		
		maxPage = (int)((double)listCount / limit + 0.9);
		startPage = (((int)((double)currentPage / limit + 0.9)) - 1) * limit + 1;
		endPage = startPage + limit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		int offset = (currentPage - 1) * limit;
		
		pi = new PageInfo(location_Code, category_Code, searchSGName, currentPage, listCount, limit, maxPage, startPage, endPage, offset);
		
		return pi;
	}
}