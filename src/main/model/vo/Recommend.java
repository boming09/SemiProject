package main.model.vo;

import java.util.List;

import book.model.vo.Book;



public class Recommend {

	
	private List<Book> WBookList;
	private List<Book> NBookList;
	private List<Book> PBookList;
	private List<Book> bestList;
	
	public Recommend() {}
	
	public Recommend(List<Book> wBookList, List<Book> nBookList, List<Book> pBookList, List<Book> bestList) {
		super();
		WBookList = wBookList;
		NBookList = nBookList;
		PBookList = pBookList;
		this.bestList = bestList;
	}

	public Recommend(List<Book> wBookList, List<Book> nBookList, List<Book> pBookList) {
		super();
		WBookList = wBookList;
		NBookList = nBookList;
		PBookList = pBookList;
	}

	
	
	public List<Book> getBestList() {
		return bestList;
	}

	public void setBestList(List<Book> bestList) {
		this.bestList = bestList;
	}

	public List<Book> getWBookList() {
		return WBookList;
	}

	public void setWBookList(List<Book> wBookList) {
		WBookList = wBookList;
	}

	public List<Book> getNBookList() {
		return NBookList;
	}

	public void setNBookList(List<Book> nBookList) {
		NBookList = nBookList;
	}

	public List<Book> getPBookList() {
		return PBookList;
	}

	public void setPBookList(List<Book> pBookList) {
		PBookList = pBookList;
	}

	@Override
	public String toString() {
		return "Recommend [WBookList=" + WBookList + ", NBookList=" + NBookList + ", PBookList=" + PBookList
				+ ", bestList=" + bestList + "]";
	}

	
	
}
