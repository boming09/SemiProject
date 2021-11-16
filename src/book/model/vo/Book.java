package book.model.vo;

import java.util.Date;
import java.util.List;

public class Book {

	private int bid;				// 도서 번호
	private String btitle;			// 도서 제목
	private int cid;				// 카테고리 번호
	private String cname;			// 카테고리 이름(카테고리 번호 참조 값)
	private int userNo;				// 저자(= user_no 참조 값) null
	private String author;			// 저자 이름 not null
	private String editor;			// 역자
	private Date publicationDate;	// 출판일
	private String publisher;		// 출판사
	private int price;				// 정가
	private int stock;				// 재고
	private double saleRate;		// 할인률
	private int salePrice;			// 할인가
	private String bintro;			// 책소개
	private String burl;			// URL
	private String filepath;		// 상세이미지
	private String aintro;			// 저자소개
	private String bimg;			// 도서 이미지
	private int starScore;			// 별점
	private double avgScore;		// 평점
	private int sumScore;			// 별점 합계
	private int reviewCount;        // 작가마이페이지 내도서 리뷰
	private String bToday;			// 오늘의 책
	
	private List<Reply> replyList;		// 댓글목록
//	BOOK_ID	NUMBER
//	BOOK_NAME	VARCHAR2(20 BYTE)
//	CATEGORY_ID	NUMBER
//	AUTHOR	NUMBER
//	EDITOR	VARCHAR2(20 BYTE)
//	PUBLICATION_DATE	DATE
//	PUBLISHER	VARCHAR2(50 BYTE)
//	PRICE	NUMBER
//	STOCK	NUMBER
//	SALE_RATE	NUMBER
//	SALE_PRICE	NUMBER
//	BOOK_INTRO	VARCHAR2(4000 BYTE)
//	BOOK_URL	VARCHAR2(4000 BYTE)
//	FILE_PATH	VARCHAR2(4000 BYTE)
//	AUTHOR_INTRO	VARCHAR2(4000 BYTE)
//	BOOK_IMG	VARCHAR2(4000 BYTE)
	
	public Book() {}
	public Book(int bid, String btitle, int cid, String cname, int userNo, String author, String editor,
			Date publicationDate, String publisher, int price, int stock, double saleRate, int salePrice, String bintro,
			String burl, String filepath, String aintro, String bimg, int starScore, double avgScore, int sumScore,
			int reviewCount, String bToday, List<Reply> replyList) {
		super();
		this.bid = bid;
		this.btitle = btitle;
		this.cid = cid;
		this.cname = cname;
		this.userNo = userNo;
		this.author = author;
		this.editor = editor;
		this.publicationDate = publicationDate;
		this.publisher = publisher;
		this.price = price;
		this.stock = stock;
		this.saleRate = saleRate;
		this.salePrice = salePrice;
		this.bintro = bintro;
		this.burl = burl;
		this.filepath = filepath;
		this.aintro = aintro;
		this.bimg = bimg;
		this.starScore = starScore;
		this.avgScore = avgScore;
		this.sumScore = sumScore;
		this.reviewCount = reviewCount;
		this.bToday = bToday;
		this.replyList = replyList;
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getEditor() {
		return editor;
	}
	public void setEditor(String editor) {
		this.editor = editor;
	}
	public Date getPublicationDate() {
		return publicationDate;
	}
	public void setPublicationDate(Date publicationDate) {
		this.publicationDate = publicationDate;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public double getSaleRate() {
		return saleRate;
	}
	public void setSaleRate(double saleRate) {
		this.saleRate = saleRate;
	}
	public int getSalePrice() {
		return salePrice;
	}
	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}
	public String getBintro() {
		return bintro;
	}
	public void setBintro(String bintro) {
		this.bintro = bintro;
	}
	public String getBurl() {
		return burl;
	}
	public void setBurl(String burl) {
		this.burl = burl;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public String getAintro() {
		return aintro;
	}
	public void setAintro(String aintro) {
		this.aintro = aintro;
	}
	public String getBimg() {
		return bimg;
	}
	public void setBimg(String bimg) {
		this.bimg = bimg;
	}
	public int getStarScore() {
		return starScore;
	}
	public void setStarScore(int starScore) {
		this.starScore = starScore;
	}
	public double getAvgScore() {
		return avgScore;
	}
	public void setAvgScore(double avgScore) {
		this.avgScore = avgScore;
	}
	public int getSumScore() {
		return sumScore;
	}
	public void setSumScore(int sumScore) {
		this.sumScore = sumScore;
	}
	public int getReviewCount() {
		return reviewCount;
	}
	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}
	public String getbToday() {
		return bToday;
	}
	public void setbToday(String bToday) {
		this.bToday = bToday;
	}
	public List<Reply> getReplyList() {
		return replyList;
	}
	public void setReplyList(List<Reply> replyList) {
		this.replyList = replyList;
	}
	@Override
	public String toString() {
		return "Book [bid=" + bid + ", btitle=" + btitle + ", cid=" + cid + ", cname=" + cname + ", userNo=" + userNo
				+ ", author=" + author + ", editor=" + editor + ", publicationDate=" + publicationDate + ", publisher="
				+ publisher + ", price=" + price + ", stock=" + stock + ", saleRate=" + saleRate + ", salePrice="
				+ salePrice + ", bintro=" + bintro + ", burl=" + burl + ", filepath=" + filepath + ", aintro=" + aintro
				+ ", bimg=" + bimg + ", starScore=" + starScore + ", avgScore=" + avgScore + ", sumScore=" + sumScore
				+ ", reviewCount=" + reviewCount + ", bToday=" + bToday + ", replyList=" + replyList + "]";
	}
		
		
}
