package co.kr.doosam.order.vo;

import java.util.Date;

public class selectDetailVo {
	private static final long serialVersionUID = 1855224989336650320L;
	
	public selectDetailVo(){}
	
	private String	code;
	private String	pCode;
	private String	codeNm;

	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getpCode() {
		return pCode;
	}
	public void setpCode(String pCode) {
		this.pCode = pCode;
	}
	public String getCodeNm() {
		return codeNm;
	}
	public void setCodeNm(String codeNm) {
		this.codeNm = codeNm;
	}
	
}
