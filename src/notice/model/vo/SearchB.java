package notice.model.vo;

public class SearchB {
	
	private String SearchType;
	private String Search;

	public SearchB() {}

	public SearchB(String searchType, String search) {
		super();
		SearchType = searchType;
		Search = search;
	}

	public String getSearchType() {
		return SearchType;
	}

	public void setSearchType(String searchType) {
		SearchType = searchType;
	}

	public String getSearch() {
		return Search;
	}

	public void setSearch(String search) {
		Search = search;
	}

	@Override
	public String toString() {
		return "SearchB [SearchType=" + SearchType + ", Search=" + Search + "]";
	}
	
	
}
