package com.aonproject.client.order.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.servlet.ModelAndView;

import com.aonproject.client.order.vo.CartVO;


@Controller
@RequestMapping(value="/order")
public class OrderController{
	private Logger logger = Logger.getLogger(OrderController.class);
	
	
	// 장바구니
	@RequestMapping(value= "/cart")
	public ModelAndView cart(HttpServletRequest request, HttpServletResponse response){
		logger.info("cart 호출 성공");
		ModelAndView mav = new ModelAndView();
		
		
		mav.setViewName("client/order/cart");
		return mav;
	}
	
	// 장바구니 등록
	@RequestMapping(value="/wish")
	public ModelAndView wish(@ModelAttribute CartVO vo ,HttpServletRequest request, HttpServletResponse response){
		logger.info("wish 호출 성공");
		ModelAndView mav = new ModelAndView();
		if(vo.getP_nos().size() == vo.getO_cnts().size()){
			Cookie[] cookies = request.getCookies();
			boolean controll = true;
			if(cookies == null) controll = false;
			ArrayList<String> addCookieNames = new ArrayList<String>();
			for(int i = 0; i < vo.getP_nos().size(); i++){
				CartVO cvo = new CartVO();
				cvo.setP_no((String) vo.getP_nos().get(i).toString());
				cvo.setO_cnt(Integer.parseInt((String) vo.getO_cnts().get(i).toString()));
				
				if(controll){
					for(Cookie cookie : cookies){
						String cookieName= cookie.getName().substring(0, 3);
						if(cookieName.equals("wish")){
							int j = cookie.getValue().indexOf("@");
							String wishName = cookie.getValue().substring(0, i);
							if(wishName.equals(cvo.getP_no())){
								String count = cookie.getValue().substring(j+1);
								int newCount = Integer.parseInt(count) + cvo.getO_cnt(); 
								Cookie updateCookie = new Cookie(cookieName + cookie.getName().substring(4) , wishName + newCount);
								updateCookie.setMaxAge(60 * 60 * 24 * 3);
								response.addCookie(updateCookie);
							}
							else{
								Cookie[] cookies2 = request.getCookies();
								String newCookieValueInit = cvo.getP_no();
								int countNum = 1;
								for(Cookie cookie2 : cookies2){
									int no = Integer.parseInt(cookie2.getName().substring(4));
									
									if(no == countNum) countNum++;
									else break;
								}
								Cookie newCookie = new Cookie("wish"+countNum, newCookieValueInit + "@" + cvo.getO_cnt());
								response.addCookie(newCookie);
							}
						}
					}
				}
				else{
					Cookie newCookie = new Cookie("wish1", cvo.getP_no() + "@" + cvo.getO_cnt());
					response.addCookie(newCookie);
					controll = true;
				}
			}
		}
		
		mav.setViewName("redirect:/order/cart");
		return mav;
	}
}
