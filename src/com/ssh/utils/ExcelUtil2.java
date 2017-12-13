package com.ssh.utils;

import java.util.List;

import javax.servlet.ServletOutputStream;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.CellRangeAddress;

import com.ssh.pojo.Attendance;
import com.ssh.pojo.User;



public class ExcelUtil2 {
	/**
	 * 导出用户的所有列表到Execl
	 * @param userList 用户列表
	 * @param outputStream 输出流
	 * */
	public static void exportExcel(List<Attendance> attendancesList,
			ServletOutputStream outputStream) {
		
		try {
			//1.创建工作簿
			HSSFWorkbook workbook=new HSSFWorkbook();
			//1.1创建合并单元格对象
			CellRangeAddress cellRangeAddress=new CellRangeAddress(0,0,0,4);//起始行号，结束行号，起始列号，结束列号
		
			//1.2、头标题样式
			HSSFCellStyle style1=creatCellStyle(workbook,(short)16);
			
			//1.3、列标题样式
			HSSFCellStyle style2=creatCellStyle(workbook,(short)13);
		
			//2、创建工作表
			HSSFSheet sheet=workbook.createSheet("考勤列表");
			//2.1、加载合并单元格对象
			sheet.addMergedRegion(cellRangeAddress);
			//设置默认列宽
			sheet.setDefaultColumnWidth(20);
			
			//3.创建行
			//3.1、创建头标题行；并设置头标题
			HSSFRow row1=sheet.createRow(0);
			HSSFCell cell1=row1.createCell(0);
			//加载单元格样式
			cell1.setCellStyle(style1);
			cell1.setCellValue("考勤列表");
			
			//3.2、创建列标题行，并设置列标题
			HSSFRow row2=sheet.createRow(1);
			String []titles={"员工编号","员工姓名","考勤时间","考勤日期","考勤记录"};
			for (int i = 0; i < titles.length; i++) {
				HSSFCell cell2=row2.createCell(i);
				//加载单元格样式
				cell2.setCellStyle(style2);
				cell2.setCellValue(titles[i]);
			}
			
			//4、操作单元格，将用户写入Execl
			if(attendancesList!=null){
				for (int j = 0; j < attendancesList.size(); j++) {
					HSSFRow row=sheet.createRow(j+2);
					HSSFCell cell11=row.createCell(0);
					cell11.setCellValue(attendancesList.get(j).getUserId());
					HSSFCell cell12=row.createCell(1);
					cell12.setCellValue(attendancesList.get(j).getName());
					HSSFCell cell13=row.createCell(2);
					cell13.setCellValue(attendancesList.get(j).getUtime());
					HSSFCell cell14=row.createCell(3);
					cell14.setCellValue(attendancesList.get(j).getDates());
					HSSFCell cell15=row.createCell(4);
					cell15.setCellValue(attendancesList.get(j).getStatus());
				}
			}
			//5、输出
			workbook.write(outputStream);
			workbook.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 创建单元格样式
	 * @param workbook 工作簿
	 * @param fontSize 字体大小
	 * @return 单元格样式
	 * */
	private static HSSFCellStyle creatCellStyle(HSSFWorkbook workbook,short fontSize) {
		HSSFCellStyle style=workbook.createCellStyle();
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);//水平居中
		style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);//垂直居中
		//创建字体
		HSSFFont font=workbook.createFont();
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);//加粗字体
		font.setFontHeightInPoints(fontSize);
		//加载字体
		style.setFont(font);
		
		return style;
	}
}
