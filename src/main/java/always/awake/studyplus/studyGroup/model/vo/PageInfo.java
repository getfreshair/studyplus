package always.awake.studyplus.studyGroup.model.vo;

public class PageInfo {
	private int location_Code;
	private int category_Code;
	private String searchSGName;
	private int currentPage;
	private int listCount;
	private int limit;
	private int maxPage;
	private int startPage;
	private int endPage;
	
	public PageInfo() {
		super();
	}

	public PageInfo(int location_Code, int category_Code, String searchSGName, int currentPage, int listCount,
			int limit, int maxPage, int startPage, int endPage) {
		super();
		this.location_Code = location_Code;
		this.category_Code = category_Code;
		this.searchSGName = searchSGName;
		this.currentPage = currentPage;
		this.listCount = listCount;
		this.limit = limit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
	}

	public int getLocation_Code() {
		return location_Code;
	}

	public void setLocation_Code(int location_Code) {
		this.location_Code = location_Code;
	}

	public int getCategory_Code() {
		return category_Code;
	}

	public void setCategory_Code(int category_Code) {
		this.category_Code = category_Code;
	}

	public String getSearchSGName() {
		return searchSGName;
	}

	public void setSearchSGName(String searchSGName) {
		this.searchSGName = searchSGName;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	@Override
	public String toString() {
		return "PageInfo [location_Code=" + location_Code + ", category_Code=" + category_Code + ", searchSGName="
				+ searchSGName + ", currentPage=" + currentPage + ", listCount=" + listCount + ", limit=" + limit
				+ ", maxPage=" + maxPage + ", startPage=" + startPage + ", endPage=" + endPage + "]";
	}
	
}
