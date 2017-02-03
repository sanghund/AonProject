package com.aonproject.common.util;

public class Util {
	
	public static int nvl(String text) {
		return nvl(text,0);
	}
	/*
	 * nvl() 메서드는 문자열을 숫자로 변환하는 메서드.
	 * @param (숫자로 변환할 문자열, 초기값으로 사용할 값(대체값))
	 * @return int
	 * */
	
	public static int nvl(String text, int def) {
		int ref = def;
		try {
			ref = Integer.parseInt(text);
		} catch(Exception e) {
			ref = def;
		}
		return ref;
	}

}
