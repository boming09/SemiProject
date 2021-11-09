package book.model.vo;

public class Search {
	private String searchCondition;
	private String searchValue;
	private String sort;
	private String category;
	
	public Search() {}

	public Search(String searchCondition, String searchValue) {
		super();
		this.searchCondition = searchCondition;
		this.searchValue = searchValue;
	}

	public Search(String searchCondition, String searchValue, String sort) {
		super();
		this.searchCondition = searchCondition;
		this.searchValue = searchValue;
		this.sort = sort;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}
	
	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}
	
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "Search [searchCondition=" + searchCondition + ", searchValue=" + searchValue + ", sort=" + sort
				+ ", category=" + category + "]";
	}

}
