package mypage.model.vo;

public class PageInfo {
	private int page;					// 요청하는 페이지
	private int listCount;				// 전체 게시글 수
	private int pageLimit;				// 하단에 보여질 페이지 목록 수
	private int mypagemyreviewLimit;	// 한페이지에 보여질 게시글 최대 수
	private int maxPage;				// 전체 페이지에서 가장 마지막 페이지
	private int startPage;				// 하단에 보여질 페이지 목록 시작 값
	private int endPage;				// 하단에 보여질 페이지 목록 끝 값
	
	public PageInfo(int page, int listCount, int pageLimit, int mypagemyreviewLimit) {
		
		this.page = page;
		this.listCount = listCount;
		this.pageLimit = pageLimit;
		this.mypagemyreviewLimit = mypagemyreviewLimit;
		
		// mapPage : 전체 페이지에서 가장 마지막 페이지
		this.maxPage = (int)Math.ceil((double)listCount / mypagemyreviewLimit);		
		// startPage : 하단에 보여질 페이지 목록 시작 값
		this.startPage = (page - 1) / pageLimit * pageLimit + 1;
		// endPage : 하단에 보여질 페이지 목록 끝 값
		this.endPage = startPage + pageLimit - 1;
		
		// 마지막 페이지 수가 총 페이지 수보다 클 수 없으므로
		if(this.maxPage < this.endPage)
			this.endPage = this.maxPage;			
	}

	public PageInfo(int page, int listCount, int pageLimit, int mypagemyreviewLimit, int maxPage, int startPage,
			int endPage) {
		super();
		this.page = page;
		this.listCount = listCount;
		this.pageLimit = pageLimit;
		this.mypagemyreviewLimit = mypagemyreviewLimit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	public int getPageLimit() {
		return pageLimit;
	}

	public void setPageLimit(int pageLimit) {
		this.pageLimit = pageLimit;
	}

	public int getMypagemyreviewLimit() {
		return mypagemyreviewLimit;
	}

	public void setMypagemyreviewLimit(int mypagemyreviewLimit) {
		this.mypagemyreviewLimit = mypagemyreviewLimit;
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
		return "PageInfo [page=" + page + ", listCount=" + listCount + ", pageLimit=" + pageLimit
				+ ", mypagemyreviewLimit=" + mypagemyreviewLimit + ", maxPage=" + maxPage + ", startPage=" + startPage
				+ ", endPage=" + endPage + "]";
	}

	
	
}
