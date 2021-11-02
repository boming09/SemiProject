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
	private int fcategory_no;   // faq_카테고리 번호 (faq_category 참조값)
	private String fcategory;	// faq_카테고리명 (faq_category 참조값)
	private int fref_no;        // faq_카테고리 참조번호 (faq_category 참조값)
	private int fcount;			// faq 조회수
	
	public Faq() {}

	public Faq(int faq_no, String title, String reply, int fcategory_no, String fcategory, int fref_no, int fcount) {
		super();
		this.faq_no = faq_no;
		this.title = title;
		this.reply = reply;
		this.fcategory_no = fcategory_no;
		this.fcategory = fcategory;
		this.fref_no = fref_no;
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

	public int getFcategory_no() {
		return fcategory_no;
	}

	public void setFcategory_no(int fcategory_no) {
		this.fcategory_no = fcategory_no;
	}

	public String getFcategory() {
		return fcategory;
	}

	public void setFcategory(String fcategory) {
		this.fcategory = fcategory;
	}

	public int getFref_no() {
		return fref_no;
	}

	public void setFref_no(int fref_no) {
		this.fref_no = fref_no;
	}

	public int getFcount() {
		return fcount;
	}

	public void setFcount(int fcount) {
		this.fcount = fcount;
	}

	@Override
	public String toString() {
		return "Faq [faq_no=" + faq_no + ", title=" + title + ", reply=" + reply + ", fcategory_no=" + fcategory_no
				+ ", fcategory=" + fcategory + ", fref_no=" + fref_no + ", fcount=" + fcount + "]";
	}

	
	
	
	
}
