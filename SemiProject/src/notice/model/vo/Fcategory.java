package notice.model.vo;

public class Fcategory {
	/*
	CATEGORY_NO	NUMBER
	CATEGORY_TYPE	VARCHAR2(40 BYTE)
	REF_NO	NUMBER
	*/
	private int fcate_no;
	private String fcate_type;
	private int fref_no;
	
	public Fcategory () {}

	public Fcategory(int fcate_no, String fcate_type, int fref_no) {
		super();
		this.fcate_no = fcate_no;
		this.fcate_type = fcate_type;
		this.fref_no = fref_no;
	}

	public int getFcate_no() {
		return fcate_no;
	}

	public void setFcate_no(int fcate_no) {
		this.fcate_no = fcate_no;
	}

	public String getFcate_type() {
		return fcate_type;
	}

	public void setFcate_type(String fcate_type) {
		this.fcate_type = fcate_type;
	}

	public int getFref_no() {
		return fref_no;
	}

	public void setFref_no(int fref_no) {
		this.fref_no = fref_no;
	}

	@Override
	public String toString() {
		return "Fcategory [fcate_no=" + fcate_no + ", fcate_type=" + fcate_type + ", fref_no=" + fref_no + "]";
	}
	
	
}
