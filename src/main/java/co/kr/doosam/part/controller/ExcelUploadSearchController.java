package co.kr.doosam.part.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.View;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.tomcat.util.http.fileupload.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import co.kr.doosam.common.ExcelRead;
import co.kr.doosam.common.ReadOption;
import co.kr.doosam.part.service.ExcelUploadService;
import co.kr.doosam.part.vo.PartSearchVo;

@Controller
public class ExcelUploadSearchController {
	
	@Autowired
	ExcelUploadService excelUploadService;
	
	@RequestMapping(value="/part/excelUploadSearch", method={RequestMethod.POST, RequestMethod.GET})
	public String excelUploadSearch(Model model, PartSearchVo partSearchVo, HttpServletRequest req){
		
//		List<PartSearchVo> selectPart = new ArrayList<PartSearchVo>();
//		
//		int page = 1;
//		String partNumber = "partnumber"; 
//		
//		selectPart = excelUploadService.findByPartNumberAndPage(partNumber, page);
//			
//		model.addAttribute("selectPart",selectPart);

		return "part/excelUploadSearch";
	}
	
	@RequestMapping(value="/part/getMoreExcelUploadList", method={RequestMethod.POST, RequestMethod.GET})
	public @ResponseBody List<PartSearchVo> getMoreExcelUploadList(Model model, PartSearchVo partSearchVo, HttpServletRequest req){
		
		List<PartSearchVo> selectPart = new ArrayList<PartSearchVo>();
		
		int page = 0;
		
		page = partSearchVo.getPage()*20;
				
		partSearchVo.setPage(page);
		partSearchVo.setUserId("tester");
		
		selectPart = excelUploadService.findByUserIdAndPage(partSearchVo);
			
		return selectPart;

	}
	
	@SuppressWarnings("deprecation")
	@Transactional
	@RequestMapping(value="/part/excelDownload", method={RequestMethod.POST, RequestMethod.GET})
	public void excelDownload(@RequestParam(value="checkList") String checkList, Model model, PartSearchVo partSearchVo, HttpServletRequest req, HttpServletResponse response) throws IOException{
		
		partSearchVo.setUserId("tester");
		String userId = "tester";
		String[] list = checkList.split(",");

		List<PartSearchVo> excelList = new ArrayList<PartSearchVo>();

		try{
			for(String oid : list){
				partSearchVo.setOid(Integer.parseInt(oid));
				excelUploadService.updateByOidAndUserId(partSearchVo);
			}
			
			excelList = excelUploadService.findByUserIdAndCheck(userId);
			excelUploadService.updateByUserId(userId);
			
		}catch(Exception e){
			throw new RuntimeException(e.getMessage(),e);
		}
		
		@SuppressWarnings("resource")
		HSSFWorkbook workbook = new HSSFWorkbook();

		HSSFSheet sheet = workbook.createSheet("Sheet1");

		//Font 설정.
		HSSFFont font = workbook.createFont();
		font.setFontName(HSSFFont.FONT_ARIAL);

		//제목의 스타일 지정
		HSSFCellStyle titlestyle = workbook.createCellStyle();
		titlestyle.setFillForegroundColor(HSSFColor.SKY_BLUE.index);
		titlestyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
		titlestyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		titlestyle.setFont(font);

		//Row 생성
		HSSFRow row = sheet.createRow((short)0);
		//Cell 생성
		HSSFCell cell1 = row.createCell((short)0 );
		cell1.setCellValue("No");
		cell1.setCellStyle(titlestyle);

		HSSFCell cell2 = row.createCell((short)1);
		cell2.setCellValue("브랜드");
		cell2.setCellStyle(titlestyle);

		HSSFCell cell3 = row.createCell((short)2);
		cell3.setCellValue("카테고리");
		cell3.setCellStyle(titlestyle);

		HSSFCell cell4 = row.createCell((short)3);
		cell4.setCellValue("부품번호");
		cell4.setCellStyle(titlestyle);
		
		HSSFCell cell5 = row.createCell((short)4);
		cell5.setCellValue("부품명");
		cell5.setCellStyle(titlestyle);
		
		HSSFCell cell6 = row.createCell((short)5);
		cell6.setCellValue("생가");
		cell6.setCellStyle(titlestyle);
		
		HSSFCell cell7 = row.createCell((short)6);
		cell7.setCellValue("수량");
		cell7.setCellStyle(titlestyle);
		
		HSSFCell cell8 = row.createCell((short)7);
		cell8.setCellValue("총액");
		cell8.setCellStyle(titlestyle);

		//내용 스타일 지정
		HSSFCellStyle style = workbook.createCellStyle();
		style.setFont(font);

		//내용중 가운데 정렬 추가
		HSSFCellStyle styleCenter = workbook.createCellStyle();
		styleCenter.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		styleCenter.setFont(font);

		int i=0;
		
		for(PartSearchVo item : excelList){
		    row = sheet.createRow((short)(i+1));
		   
		    cell1 = row.createCell((short)0 );
		    cell1.setCellValue(item.getOid());
		    cell1.setCellStyle(styleCenter);
		    
		    cell2 = row.createCell((short)1);
		    cell2.setCellValue(item.getBrandCode());
		    cell2.setCellStyle(style);
		    
		    cell3 = row.createCell((short)2);
		    cell3.setCellValue("카테고리");
		    cell3.setCellStyle(style);
		    
		    cell4 = row.createCell((short)3);
		    cell4.setCellValue(item.getPartsNumber());
		    cell4.setCellStyle(style);
		    
		    cell5 = row.createCell((short)4);
		    cell5.setCellValue(item.getPartsNameKo() + "(" + item.getPartsNameEn() + ")");
		    cell5.setCellStyle(style);
		    
		    cell6 = row.createCell((short)5);
		    cell6.setCellValue(item.getPrice());
		    cell6.setCellStyle(style);
		    
		    cell7 = row.createCell((short)6);
		    cell7.setCellValue(item.getQuantity());
		    cell7.setCellStyle(style);
		    
		    cell8 = row.createCell((short)7);
		    cell8.setCellValue(item.getPrice() + "*" + item.getQuantity());
		    cell8.setCellStyle(style);
		    
		    i++;
		}

		Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy_MM_dd");
        
		String fileName = "FindParts_"+sdf.format(d)+"_" + userId + ".xls";

//		// 실제로 저장될 파일 풀 경로
//		File file = new File("D:\\", realName);
//
//		//엑셀 파일을 만듬
//		FileOutputStream fileOutput = new FileOutputStream(file);
//	    
//		workbook.write(fileOutput);
//		fileOutput.close();

		OutputStream os = response.getOutputStream();
		
		//response.setContentType("Application/Msexcel");
        //response.setHeader("Content-Disposition", "ATTachment; Filename="+fileName);
        
        response.setContentType("application/vnd.ms-excel"); 
        response.setHeader("Content-Disposition", "attachment; filename="+fileName);
        
        workbook.write(os);
		os.close();
	}
	
	@Transactional
	@RequestMapping(value="/part/excelUpload", method={RequestMethod.GET,RequestMethod.POST})
	public String excelUploadSearch(Model model, MultipartHttpServletRequest request) throws IOException{

		MultipartFile excelFile = request.getFile("excelFile");
	        if(excelFile==null || excelFile.isEmpty()){
	            throw new RuntimeException("엑셀파일을 선택해 주세요");
	        }
	 
	        File destFile = new File("D:\\"+excelFile.getOriginalFilename());
	        try {
	            excelFile.transferTo(destFile);
	        } catch (IllegalStateException | IOException e) {
	            throw new RuntimeException(e.getMessage(),e);
	 
	        }
	        
	        ReadOption readOption = new ReadOption();
			readOption.setFilePath(destFile.getAbsolutePath());
			readOption.setOutputColumns("A", "B");
			readOption.setStartRow(2);

			List<Map<String, String>> excelContent = ExcelRead.read(readOption);
			List<PartSearchVo> selectPart = new ArrayList<PartSearchVo>();
			
			PartSearchVo partSearchVo = null;
			String message = "";
			
			try{
				
				excelUploadService.deleteExcel("tester");
				
				int i = 0;
				
				for (Map<String, String> article : excelContent) {
					
					partSearchVo = new PartSearchVo();
					partSearchVo.setPartsNumber(article.get("A"));
					partSearchVo.setQuantity(article.get("B"));
					partSearchVo.setUserId("tester");
					
					excelUploadService.insertExcel(partSearchVo);
					i++;

					if(i>3000){
						message = "3000건까지만 조회됩니다.";
						break;
					}
				}
				
				partSearchVo.setUserId("tester");
				partSearchVo.setPage(0);
				selectPart = excelUploadService.findByUserIdAndPage(partSearchVo);
				
			}catch (Exception e){
				throw new RuntimeException(e.getMessage(),e);
			}finally {
				FileUtils.forceDelete(destFile);	
			}

			model.addAttribute("selectPart",selectPart);
			model.addAttribute("message",message);

			return "part/excelUploadSearch";
	}
	
}
