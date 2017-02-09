package com.aonproject.common.util.email;

import java.util.Random;

public class Certification {
	public static String certificationNumbers(){
		String result = "";
		StringBuffer numbers = new StringBuffer();
		
		Random r = new Random();
		for(int i = 0; i < 6; i++){
			int num = r.nextInt(10);
			numbers.append(num + "");
		};
		result = numbers.toString();
		
		return result;
	} ;
	
	public static String randomPass(){
		String result = "";
		StringBuffer numbers = new StringBuffer();
		
		Random r = new Random();
		for(int i = 0; i < 8; i++){
			int num = r.nextInt(123);
			if(num >= 10 && num <= 97){
				i--;
				continue;
			};
			if(num < 10){
				numbers.append(num + "");
			}
			else{
				numbers.append((char) num + "");
			}
		};
		
		return result;
	}
}
