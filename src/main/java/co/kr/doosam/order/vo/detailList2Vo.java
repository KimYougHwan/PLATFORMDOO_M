package co.kr.doosam.order.vo;

public class detailList2Vo {
	private static final long serialVersionUID = -4665651754723308801L;
	
	public detailList2Vo(){}
	
	private int oid;
	private String partsNumber;
	private String partsNameKo;
	private int createDate;

	public int getOid() {
		return oid;
	}
	public void setOid(int oid) {
		this.oid = oid;
	}
	public String getPartsNumber() {
		return partsNumber;
	}
	public void setPartsNumber(String partsNumber) {
		this.partsNumber = partsNumber;
	}
	public String getPartsNameKo() {
		return partsNameKo;
	}
	public void setPartsNameKo(String partsNameKo) {
		this.partsNameKo = partsNameKo;
	}
	public int getCreateDate() {
		return createDate;
	}
	public void setCreateDate(int createDate) {
		this.createDate = createDate;
	}
	
}
