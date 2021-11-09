package admin.model.vo;

import java.sql.Date;

public class OneList {
	private int oNo;
	private String oTitle;
	private String oId;
	private String oNickName;
	private String oName;
	private Date odate;
	
	public OneList() {}

	public OneList(int oNo, String oTitle, String oId, String oNickName, String oName, Date odate) {
		super();
		this.oNo = oNo;
		this.oTitle = oTitle;
		this.oId = oId;
		this.oNickName = oNickName;
		this.oName = oName;
		this.odate = odate;
	}
	
	public int getoNo() {
		return oNo;
	}

	public void setoNo(int oNo) {
		this.oNo = oNo;
	}

	public String getoTitle() {
		return oTitle;
	}

	public void setoTitle(String oTitle) {
		this.oTitle = oTitle;
	}

	public String getoId() {
		return oId;
	}

	public void setoId(String oId) {
		this.oId = oId;
	}

	public String getoNickName() {
		return oNickName;
	}

	public void setoNickName(String oNickName) {
		this.oNickName = oNickName;
	}

	public String getoName() {
		return oName;
	}

	public void setoName(String oName) {
		this.oName = oName;
	}

	public Date getOdate() {
		return odate;
	}

	public void setOdate(Date odate) {
		this.odate = odate;
	}

	@Override
	public String toString() {
		return "OneList [oNo=" + oNo + ", oTitle=" + oTitle + ", oId=" + oId + ", oNickName=" + oNickName + ", oName="
				+ oName + ", odate=" + odate + "]";
	}

	
}
