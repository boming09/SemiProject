package notice.model.vo;

public class Faq {
	/*
	FAQ_NO	NUMBER
	TITLE	VARCHAR2(100 BYTE)
	REPLY	VARCHAR2(4000 BYTE)
	CATEGORY_NO	NUMBER
	MANAGER_NO	NUMBER
	COUNT	NUMBER
	*/
	private int faq_no;		// 게시글 faq 번호
	private String title;	// 질문 제목
	private String reply;	// 답변 내용
	private String fcategory;	// faq 카테고리명 (faq_category 참조값)
	private int fcount;			// faq 조회수
	
	public Faq() {}

	public Faq(int faq_no, String title, String reply, String fcategory, int fcount) {
		super();
		this.faq_no = faq_no;
		this.title = title;
		this.reply = reply;
		this.fcategory = fcategory;
		this.fcount = fcount;
	}

	public int getFaq_no() {
		return faq_no;
	}

	public void setFaq_no(int faq_no) {
		this.faq_no = faq_no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	public String getFcategory() {
		return fcategory;
	}

	public void setFcategory(String fcategory) {
		this.fcategory = fcategory;
	}

	public int getFcount() {
		return fcount;
	}

	public void setFcount(int count) {
		this.fcount = count;
	}

	@Override
	public String toString() {
		return "Faq [faq_no=" + faq_no + ", title=" + title + ", reply=" + reply + ", fcategory=" + fcategory
				+ ", fcount=" + fcount + "]";
	}

	
	
	
}
