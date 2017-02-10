package com.aonproject.client.order.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.aonproject.admin.category.service.CategoryService;
import com.aonproject.admin.category.vo.CategoryVO;
import com.aonproject.admin.commoncode.service.CommonCodeService;
import com.aonproject.admin.commoncode.vo.CommonCodeVO;
import com.aonproject.admin.product.service.ProductService;
import com.aonproject.admin.product.vo.ProductVO;
import com.aonproject.admin.stock.service.StockService;
import com.aonproject.admin.stock.vo.StockVO;
import com.aonproject.client.mInfo.service.MemberService;
import com.aonproject.client.mInfo.vo.MemberVO;
import com.aonproject.client.order.service.OrderService;
import com.aonproject.client.order.vo.CartVO;
import com.aonproject.client.order.vo.Product_orderVO;

@Controller
@RequestMapping(value="/order")
public class OrderController{
	private Logger logger = Logger.getLogger(OrderController.class);
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private CommonCodeService commonCodeService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private StockService stockService;
	
	@Autowired
	private MemberService memberService;

	@RequestMapping(value="/orderResult")
	public String orderResult(Authentication auth, @ModelAttribute ProductVO povo, @ModelAttribute CategoryVO cvo, Model model){
		logger.info("orderResult ȣ�� ����");
		
		List<CategoryVO> categoryList = categoryService.categoryList(cvo);
		model.addAttribute("categoryList", categoryList);
		
		/*ȸ������ ���*/
		MemberVO vo = (MemberVO) auth.getPrincipal();
		MemberVO memberInfo = memberService.memberInfo(vo);
		model.addAttribute("memberInfo", memberInfo);
		
		List<Product_orderVO> orderInfo = new ArrayList<Product_orderVO>();
		List<ProductVO> productList = new ArrayList<ProductVO>();
		
		//o_num ���� : max(o_no)+1
		String checkOnum = orderService.checkOnum();
		if(checkOnum == "" || checkOnum == null){
			checkOnum = 1+"";
		}else{
			checkOnum = (Integer.parseInt(checkOnum)+1)+"";
		}
		//logger.info("aaaaa"+povo.getP_nos());
		logger.info("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"+povo.getP_nos().size());
		for(int i=0; i<povo.getP_nos().size(); i++){
			Product_orderVO ovo = new Product_orderVO();
			
			ProductVO cal = new ProductVO();
			cal.setP_no(povo.getP_nos().get(i).toString());
			cal = productService.productDetail(cal);
			
			//�ֹ�VO �׸� ���
			ovo.setP_no(povo.getP_nos().get(i).toString());
			//logger.info("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"+ovo.getP_no());
			ovo.setO_cnt(Integer.parseInt(povo.getO_cnts().get(i).toString()));
			//logger.info("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"+ovo.getO_cnt());
			ovo.setO_mode(povo.getO_mode().toString());
			ovo.setO_confirm(povo.getO_confirm().toString());
			ovo.setM_no(vo.getM_no());
			ovo.setO_price(cal.getP_price()-(cal.getP_price() * (cal.getP_discount() / 100)) * ovo.getO_cnt());
			ovo.setO_num(checkOnum);
			orderInfo.add(ovo);
			int result = orderService.orderInsert(ovo);
			logger.info("orderInser="+result);
			
			//��ǰVO �׸� ���
			cal.setO_cnt(ovo.getO_cnt());
			cal.setO_mode(ovo.getO_mode());
			cal.setO_confirm(ovo.getO_confirm());
			cal.setO_num(ovo.getO_num());
			cal.setM_no(ovo.getM_no());
			productList.add(cal);
			
			StockVO svo = new StockVO();
			svo.setP_no(ovo.getP_no());
			svo.setStock_cnt(ovo.getO_cnt());
			int stockResult = stockService.stockOrder(svo);
			logger.info("stockResult="+stockResult);
		}
		
		model.addAttribute("orderInfo", orderInfo);
		model.addAttribute("productList", productList);
		
		return "client/order/orderResult";
	}
	
	@RequestMapping(value= "/order")
	public String order(Authentication auth, @ModelAttribute Product_orderVO povo, @ModelAttribute CategoryVO cvo, @ModelAttribute CommonCodeVO cmvo, @ModelAttribute ProductVO pvo, HttpServletRequest request, Model model){
		logger.info("order ȣ�� ����");
		
		/*ȸ������ ���*/
		MemberVO vo = (MemberVO) auth.getPrincipal();
		MemberVO memberInfo = memberService.memberInfo(vo);
		model.addAttribute("memberInfo", memberInfo);
		
		/*ī�װ� ����Ʈ ���*/
		List<CategoryVO> categoryList = categoryService.categoryList(cvo);
		model.addAttribute("categoryList", categoryList);
		
		List<CommonCodeVO> commonCodeList = commonCodeService.CommonCodeList(cmvo);
		model.addAttribute("commonCodeList", commonCodeList);
		
		ArrayList<ProductVO> orderList = new ArrayList<ProductVO>();
		ArrayList<Product_orderVO> orderInfo = new ArrayList<Product_orderVO>();

		for(int i=0; i<povo.getP_nos().size(); i++){
			String p_noSplit = povo.getP_nos().get(i).toString();
			
			pvo.setP_no(povo.getP_nos().get(i).toString());
			
			orderList.add(productService.productDetail(pvo));
			orderList.get(i).setP_no(p_noSplit.substring(0,7));
			//-------------------------------------------------------s
			orderList.get(i).setO_cnt(povo.getO_cnts().get(i));
			//-------------------------------------------------------e
		}
		
		if(orderList.size()>0){
			for(int i=0; i<orderList.size(); i++){
				Product_orderVO ovo = new Product_orderVO();
				ovo.setP_no(orderList.get(i).getP_no().toString());
			    ovo.setO_cnt(Integer.parseInt(povo.getO_cnts().get(i).toString()));
			    orderInfo.add(ovo);
			    System.out.println("---------------------\n"+ovo.toString() + "\n-------------------");
			}
			model.addAttribute("orderInfo", orderInfo);
		}
		model.addAttribute("orderList", orderList);
		
		return "client/order/order";
	}
	
	
	// ��ٱ���
	@RequestMapping(value= "/cart")
	public ModelAndView cart(@ModelAttribute CategoryVO cvo, HttpServletRequest request, HttpServletResponse response){
		logger.info("cart ȣ�� ����");
		ModelAndView mav = new ModelAndView();
		List<CategoryVO> categoryList = categoryService.categoryList(cvo);
		mav.addObject("categoryList", categoryList);
		
		Cookie[] cookies = request.getCookies();
		Cookie cookie = null;
		int time = 0;
		if(cookies != null){
			for(Cookie cookieLoop : cookies){
				if(cookieLoop.getName().equals("cartList")){
					cookie = cookieLoop;
					time = cookie.getMaxAge();
					break;
				}
			};
		}
			
		StringBuffer content = new StringBuffer("");
		if(cookie != null){
			StringTokenizer contents = new StringTokenizer(cookie.getValue(), "%");
			ArrayList<CartVO> pList = new ArrayList<CartVO>();
			while(contents.hasMoreTokens()){
				String line = contents.nextToken();
				String[] lines = line.split("@");
				CartVO vo = new CartVO();
				vo.setP_no(lines[0]);
				vo.setO_cnt(Integer.parseInt(lines[1]));
				int chk = stockService.stockChk(vo);
				if(chk > vo.getO_cnt()){
					content.append("%" + line);
					int o_cnt = vo.getO_cnt();
					vo = orderService.cartList(vo);
					vo.setP_no(vo.getP_no().substring(0, vo.getP_no().indexOf("S")));
					vo.setO_cnt(o_cnt);
					pList.add(vo);
				}
			}
			cookie = new Cookie("cartList", content.toString());
			cookie.setMaxAge(time);
			response.addCookie(cookie);
			if(pList.size() != 0) mav.addObject("cartShow", pList);
		}
		
		mav.setViewName("client/order/cart");
		return mav;
	}
	
	// ��ٱ��� ����
	@RequestMapping(value="/cartD", method = RequestMethod.POST)
	public String cartD(@ModelAttribute CartVO vo, HttpServletRequest request, HttpServletResponse response){
		logger.info("cartD ȣ�� ����");

		Cookie[] cookies = request.getCookies();
		Cookie cookie = null;
		int time = 0;
		
		if(cookies != null){
			for(Cookie cookieLoop : cookies){
				if(cookieLoop.getName().equals("cartList")){
					cookie = cookieLoop;
					time = cookie.getMaxAge();
					break;
				}
			};
		}
		
		StringBuffer content = new StringBuffer("");
		StringTokenizer contents = new StringTokenizer(cookie.getValue(), "%");
		
		if(cookie != null){
			boolean chk = false;
			ArrayList<String> cList = new ArrayList<String>();
			ArrayList<Integer> numbers = new ArrayList<Integer>(); 
			while(contents.hasMoreTokens()){
				String line = contents.nextToken();
				cList.add(line);
			}
			if(cList.size() > 0){
				for(int i = 0; i < vo.getCd().size(); i++){
					String line = (String) vo.getCd().get(i).toString().toUpperCase();
					for(String test : cList){
						int cNum = test.indexOf(line);
						if(cNum > -1){
							chk = true;
							numbers.add(i);
						}
					}
				}
			}
			if(chk){
				for(int i = 0; i < cList.size(); i++){
					boolean omg = false;
					for(int num : numbers){
						if(num == i){
							omg = true;
							break;
						}
					}
					if(!omg){
						content.append("%"+cList.get(i));
					}
				}
				cookie = new Cookie("cartList", content.toString());
				if(content.toString().equals("")){
					cookie.setMaxAge(0);
				}else{
					cookie.setMaxAge(time);
				}
				response.addCookie(cookie);
			}
		}
		
		return "redirect:/order/cart";
	}
	
	// ��ٱ��� ���
	@RequestMapping(value="/wish", method = RequestMethod.POST)
	public ModelAndView wish(RedirectAttributes redirectAttributes, @ModelAttribute CartVO vo ,HttpServletRequest request, HttpServletResponse response){
		logger.info("wish ȣ�� ����");
		ModelAndView mav = new ModelAndView();
		
		String goodNo = "";
		
		int you = request.getHeader("referer").indexOf("detail?no=");
		logger.info(request.getHeader("referer"));
		if(you > -1){
			goodNo = request.getHeader("referer").substring(you + 10);
			logger.info(goodNo);
			redirectAttributes.addFlashAttribute("goodNo", goodNo);
		} 
		
		if(vo.getP_nos().size() == vo.getO_cnts().size() && vo.getP_nos().size() != 0){		
			Cookie cookies[] = request.getCookies();
			Cookie updateCookie = null;
			StringBuffer content = new StringBuffer("");
			if(cookies != null) {
				for(Cookie cookie : cookies){
					if(cookie.getName().equals("cartList")){
						content.append(cookie.getValue());
						break;
					};
				}
			}
			
			ArrayList<CartVO> cList = new ArrayList<CartVO>();
			for(int i = 0; i < vo.getP_nos().size(); i++){
				CartVO cvo = new CartVO();
				cvo.setP_no((String) vo.getP_nos().get(i).toString());
				cvo.setO_cnt(Integer.parseInt((String) vo.getO_cnts().get(i).toString()));
				cList.add(cvo);
			}
			
			if(!content.toString().equals("")){
				for(int i = 0; i < cList.size(); i++){
					String[] check = content.toString().split("%");
					
					String p_no = cList.get(i).getP_no();
					int o_cnt = cList.get(i).getO_cnt();
					
					boolean chk = true;
					for(int j = 1; j < check.length; j++){
						String line = check[j];
						String[] lineCheck = line.split("@");
						if(lineCheck[0].equals(p_no)){
							chk = false;
							o_cnt = Integer.parseInt(lineCheck[1]) + o_cnt;
							line = "%" + lineCheck[0] + "@" + o_cnt;
							
							content.setLength(0);
							for(int k = 1; k < check.length; k++){
								if(j != k){
									content.append("%" + check[k]);
								}
								else{
									content.append(line);
								}
							};
							break;
						};
					};
					if(chk){
						content.append("%"+cList.get(i).getP_no()+"@"+cList.get(i).getO_cnt());
					};
				};
			}
			else{
				for(int i = 0; i < cList.size(); i++){
					content.append("%"+cList.get(i).getP_no()+"@"+cList.get(i).getO_cnt());
				};
			}
			updateCookie = new Cookie("cartList", content.toString());
			updateCookie.setMaxAge(60 * 60 * 24 * 3);
			response.addCookie(updateCookie);
		}
		
		mav.setViewName("redirect:/order/cart");
		return mav;
	}
}
