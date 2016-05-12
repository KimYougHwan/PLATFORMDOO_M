package co.kr.doosam.part.vo;

import java.sql.Date;


public class PartSearchVo {

	private int	oid;
	private String	partsNumber;
	private String 	beforePartsNumber;
	private String 	afterPartsNumber;
	private String 	partsNameEn;
	private String 	partsNameKo;
	private String 	type;
	private String 	code;
	private String 	brandCode;
	
	private int 	unitOid;
	private int 	currencyOid;
	private String 	modelCode;
	private String 	itemCode;
	private String 	noMoreOrder;
	private int 	usageCnt;
	private String 	cbu;
	private String 	lep;
	private int 	packingUnitBoxBig;
	private int 	packingUnitBoxMiddle;
	private int 	packingUnitBoxSmall;
	private int 	packingUnitVinylCnt;
	private int 	packingUnitBoxCnt;
	private int 	weight;
	private int 	width;
	private int 	vertical;
	private int 	height;
	private int 	bulk;
	private String 	createUser;
	private Date 	createDate;
	private String 	modifyUser;
	private Date 	modifyDate;
	private String  quantity;
	private String  price;
	
	private int page;
	private String userId;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
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
	public String getBeforePartsNumber() {
		return beforePartsNumber;
	}
	public void setBeforePartsNumber(String beforePartsNumber) {
		this.beforePartsNumber = beforePartsNumber;
	}
	public String getAfterPartsNumber() {
		return afterPartsNumber;
	}
	public void setAfterPartsNumber(String afterPartsNumber) {
		this.afterPartsNumber = afterPartsNumber;
	}
	public String getPartsNameEn() {
		return partsNameEn;
	}
	public void setPartsNameEn(String partsNameEn) {
		this.partsNameEn = partsNameEn;
	}
	public String getPartsNameKo() {
		return partsNameKo;
	}
	public void setPartsNameKo(String partsNameKo) {
		this.partsNameKo = partsNameKo;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getBrandCode() {
		return brandCode;
	}
	public void setBrandCode(String brandCode) {
		this.brandCode = brandCode;
	}
	public int getUnitOid() {
		return unitOid;
	}
	public void setUnitOid(int unitOid) {
		this.unitOid = unitOid;
	}
	public int getCurrencyOid() {
		return currencyOid;
	}
	public void setCurrencyOid(int currencyOid) {
		this.currencyOid = currencyOid;
	}
	public String getModelCode() {
		return modelCode;
	}
	public void setModelCode(String modelCode) {
		this.modelCode = modelCode;
	}
	public String getItemCode() {
		return itemCode;
	}
	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}
	public String getNoMoreOrder() {
		return noMoreOrder;
	}
	public void setNoMoreOrder(String noMoreOrder) {
		this.noMoreOrder = noMoreOrder;
	}
	public int getUsageCnt() {
		return usageCnt;
	}
	public void setUsageCnt(int usageCnt) {
		this.usageCnt = usageCnt;
	}
	public String getCbu() {
		return cbu;
	}
	public void setCbu(String cbu) {
		this.cbu = cbu;
	}
	public String getLep() {
		return lep;
	}
	public void setLep(String lep) {
		this.lep = lep;
	}
	public int getPackingUnitBoxBig() {
		return packingUnitBoxBig;
	}
	public void setPackingUnitBoxBig(int packingUnitBoxBig) {
		this.packingUnitBoxBig = packingUnitBoxBig;
	}
	public int getPackingUnitBoxMiddle() {
		return packingUnitBoxMiddle;
	}
	public void setPackingUnitBoxMiddle(int packingUnitBoxMiddle) {
		this.packingUnitBoxMiddle = packingUnitBoxMiddle;
	}
	public int getPackingUnitBoxSmall() {
		return packingUnitBoxSmall;
	}
	public void setPackingUnitBoxSmall(int packingUnitBoxSmall) {
		this.packingUnitBoxSmall = packingUnitBoxSmall;
	}
	public int getPackingUnitVinylCnt() {
		return packingUnitVinylCnt;
	}
	public void setPackingUnitVinylCnt(int packingUnitVinylCnt) {
		this.packingUnitVinylCnt = packingUnitVinylCnt;
	}
	public int getPackingUnitBoxCnt() {
		return packingUnitBoxCnt;
	}
	public void setPackingUnitBoxCnt(int packingUnitBoxCnt) {
		this.packingUnitBoxCnt = packingUnitBoxCnt;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	public int getWidth() {
		return width;
	}
	public void setWidth(int width) {
		this.width = width;
	}
	public int getVertical() {
		return vertical;
	}
	public void setVertical(int vertical) {
		this.vertical = vertical;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public int getBulk() {
		return bulk;
	}
	public void setBulk(int bulk) {
		this.bulk = bulk;
	}
	public String getCreateUser() {
		return createUser;
	}
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getModifyUser() {
		return modifyUser;
	}
	public void setModifyUser(String modifyUser) {
		this.modifyUser = modifyUser;
	}
	public Date getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	
	
	
}
