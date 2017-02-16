package com.aonproject.common.util.graph;

import java.awt.Color;
import java.awt.Font;
import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;

public class MakeChartGraph {
	private static Logger logger = Logger.getLogger(MakeChartGraph.class);
	
	// 일별 가입한 회원수 + 오늘 탈퇴한 회원수 + 전체 회원수 + 누적 가입수 + 누적 탈퇴수
	public static void memberCount(HttpServletRequest request, Map<String, Integer> map){
		String docRoot = request.getSession().getServletContext().getRealPath("/chart");
		File fileDir = new File(docRoot);
		if(!fileDir.exists()) fileDir.mkdir();
		logger.info("업로드할 파일 경로 : " + docRoot);
		
		String sysdate = "";
		Date date = new Date();
		SimpleDateFormat sdf  = new SimpleDateFormat("yyyy-MM-dd");
		
		sysdate = sdf.format(date);
		logger.info("업로드할 날짜 : " + sysdate);
		
		File file = new File(docRoot+"/memberCount" + sysdate + ".jpg");
		FileOutputStream fos = null;
		
		
		try{
			DefaultCategoryDataset dataset = new DefaultCategoryDataset();
			for(Map.Entry<String, Integer> result : map.entrySet()){
				logger.info(result.getKey() + " = " + result.getValue());
				dataset.addValue(result.getValue(),result.getKey(), result.getKey());
			}
			
			JFreeChart chart = ChartFactory.createBarChart("일별 회원 통계", sysdate, "인원수(단위 : 명)", dataset, PlotOrientation.HORIZONTAL, true, true, false);
			
			chart.setBackgroundPaint(Color.WHITE);
			chart.getTitle().setFont(new Font("sansserif", Font.BOLD, 16));
			
			Font font = new Font("sonsserif", Font.BOLD, 12);
			chart.getLegend().setItemFont(font);
			
			CategoryPlot plot = chart.getCategoryPlot();
			
			plot.getDomainAxis().setLabelFont(font); 
			plot.getDomainAxis().setTickLabelFont(font); 
			plot.getRangeAxis().setLabelFont(font); 
			plot.getRangeAxis().setTickLabelFont(font);
			
			fos = new FileOutputStream(file);
			
			ChartUtilities.writeChartAsJPEG(fos, chart, 720, 480);
		}
		catch(Exception e){
			e.getMessage();
			e.printStackTrace();
		}
		finally{
			try{
				if(fos != null) fos.close();
			}
			catch(Exception s){
				s.getMessage();
				s.printStackTrace();
			}
		}
	}
	
	
	// 회원 성별 분포도
	public static void memberSexDistribution(HttpServletRequest request, Map<String, Integer> map){
		String docRoot = request.getSession().getServletContext().getRealPath("/chart");
		File fileDir = new File(docRoot);
		if(!fileDir.exists()) fileDir.mkdir();
		
		logger.info("업로드할 파일 경로 : " + docRoot);
		File file = new File(docRoot+"/memberSexDistribution.jpg");
		FileOutputStream fos = null;
		
		try{
			DefaultCategoryDataset dataset = new DefaultCategoryDataset();
			for(Map.Entry<String, Integer> result : map.entrySet()){
				logger.info(result.getKey() + " = " + result.getValue());
				dataset.addValue(result.getValue(),result.getKey(), result.getKey());
			}
			
			JFreeChart chart = ChartFactory.createBarChart("성별 통계", "성별", "인원수(단위 : 명)", dataset, PlotOrientation.VERTICAL, true, true, false);
			
			chart.setBackgroundPaint(Color.WHITE);
			chart.getTitle().setFont(new Font("sansserif", Font.BOLD, 16));
			
			Font font = new Font("sonsserif", Font.BOLD, 12);
			chart.getLegend().setItemFont(font);
			
			CategoryPlot plot = chart.getCategoryPlot();
			
			plot.getDomainAxis().setLabelFont(font); 
			plot.getDomainAxis().setTickLabelFont(font); 
			plot.getRangeAxis().setLabelFont(font); 
			plot.getRangeAxis().setTickLabelFont(font);
			
			fos = new FileOutputStream(file);
			
			ChartUtilities.writeChartAsJPEG(fos, chart, 720, 480);
		}
		catch(Exception e){
			e.getMessage();
			e.printStackTrace();
		}
		finally{
			try{
				if(fos != null) fos.close();
			}
			catch(Exception s){
				s.getMessage();
				s.printStackTrace();
			}
		}
	}
}
