package com.aonproject.client.mInfo.controller;

import java.util.List;

import javax.annotation.Resource;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.aonproject.admin.category.service.CategoryService;
import com.aonproject.admin.category.vo.CategoryVO;
import com.aonproject.admin.policy.service.PolicyService;
import com.aonproject.admin.qna.service.QnaService;
import com.aonproject.admin.review.service.ReviewService;
import com.aonproject.client.mInfo.service.MemberService;
import com.aonproject.client.mInfo.vo.MemberSubAddressVO;
import com.aonproject.client.mInfo.vo.MemberVO;
import com.aonproject.common.util.email.Certification;
import com.aonproject.common.util.email.Email;
import com.aonproject.common.util.email.EmailSender;
import com.aonproject.common.util.security.ShaEncoder;
import com.aonproject.common.util.vo.PolicyAgrVO;

@Controller
@RequestMapping(value = "/member")
public class MemberController {
	private Logger logger = Logger.getLogger(MemberController.class);
	
	@Resource(name = "shaEncoder")
	private ShaEncoder encoder;
	
	@Autowired
	private EmailSender emailSender;
	
	@Autowired
	private PolicyService policyService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private QnaService qnaService;
	
	
	
	// 로그인 페이지
	@RequestMapping(value = "/login")
	public String loginForm(@ModelAttribute CategoryVO cvo, Model model){
		logger.info("loginForm 호출 성공");
		List<CategoryVO> categoryList = categoryService.categoryList(cvo);
		model.addAttribute("categoryList", categoryList);
		return "client/cInfo/loginForm";
	}
		
	// Member(회원) 가입 페이지
	@RequestMapping(value = "/join")
	public String joinForm(@ModelAttribute CategoryVO cvo, HttpServletRequest request, Model model){
		logger.info("joinForm 호출 성공");

		List<CategoryVO> categoryList = categoryService.categoryList(cvo);
		model.addAttribute("categoryList", categoryList);
		
		String mode = request.getParameter("mode");
		if((mode == null || mode.trim().equals("")) && request.getMethod().equals("GET")){
			return "client/cInfo/joinForm";
		}
		else if((mode.equals("success")) && request.getMethod().equals("POST")){
			model.addAttribute("view1", policyService.policyView1());
			model.addAttribute("view2", policyService.policyView2());
			return "client/cInfo/joinForm2";
		}
		else if((mode.equals("good")) && request.getMethod().equals("POST")){
			return "client/cInfo/joinForm3";
		}
		return "client/cInfo/joinForm";
	};
	
	// 아이디 / 비밀번호 찾기
	@RequestMapping(value="/lostme")
	public String lostme(){
		logger.info("lostme 호출 성공");
		return "client/cInfo/lostme";
	}
	
	
	// Member(회원) 가입 이메일 인증번호 발송
	@ResponseBody
	@RequestMapping(value = "/join/emailCertification")
	public String emailCertification(@ModelAttribute MemberVO vo, HttpServletResponse response) throws Exception{
		logger.info("emailCertification 호출 성공");
		String result = "";
		String reciver = vo.getM_email();
		String numbers = Certification.certificationNumbers();
			
		Email email = new Email();
		email.setReciver(reciver);
		email.setSubject("[AON] 인증번호를 보내드립니다.");
		email.setContent("요청하신 인증번호는 [" + numbers + "]입니다.");
		
		emailSender.SendEmail(email);
		Cookie cookie = new Cookie("certificationNumbers", numbers);
		cookie.setMaxAge(60* 30);
		response.addCookie(cookie);
			
		result = "success";
			
		return result;
	};
	
	// Member(회원) 가입 인증번호 확인
	@ResponseBody
	@RequestMapping(value="/join/emailCertificationChk")
	public String emailCertificationChk(@RequestParam("certificationNum") String certificationNum, HttpServletRequest request, HttpServletResponse response){
		logger.info("emailCertificationChk 호출 성공");
		String result = "";
		
		Cookie[] cookies = request.getCookies();
		if(cookies != null){
			for(Cookie cookie : cookies){
				if(cookie.getName().equals("certificationNumbers")){
					if(cookie.getValue().equals(certificationNum)){
						result = "success";
						cookie.setMaxAge(0);
						response.addCookie(cookie);
					}
				}
			}
		}
		
		return result;
	}
	
	// Member(회원) 회원가입
	@ResponseBody
	@RequestMapping(value="/joinGo")
	public String joinGo(@ModelAttribute MemberVO vo, @RequestParam("privacyChk") String privacy, @RequestParam("touChk") String tou){
		logger.info("joinGo 호출 성공");
		String result = "";
		
		vo.setM_pwd(encoder.encoding(vo.getM_pwd()));
		
		int gogo = memberService.joinGo(vo);
		
		if(gogo == 1){
			if(privacy != null && tou != null){
				PolicyAgrVO pavo = new PolicyAgrVO();
				int m_no = memberService.newNo();
				vo.setM_no(m_no);
				memberService.addAddr(vo);
		
				pavo.setM_no(m_no);
				pavo.setPo_no(policyService.policyView1().getPo_no());
				pavo.setPa_confirm(tou);
				policyService.pagr2(pavo);
				
				pavo.setPo_no(policyService.policyView2().getPo_no());
				pavo.setPa_confirm(privacy);
				policyService.pagr2(pavo);
				
				result = "good";
			}
		}
		else{
			result = "fail";
		}
		return result;
	};
	
	// 마이페이지 - 주문조회+취소 내역
	@RequestMapping(value="/mypage/orderlist")
	public ModelAndView orderlist(Authentication auth){
		logger.info("orderlist 호출 성공");
		ModelAndView mav = new ModelAndView();
		MemberVO vo = (MemberVO) auth.getPrincipal();
		
		mav.setViewName("client/mypage/orderlist");
		return mav;
	}
	// 마이페이지 - 구매 후기 내역
	@RequestMapping(value="/mypage/review")
	public ModelAndView review(Authentication auth){
		logger.info("review 호출 성공");
		MemberVO vo = (MemberVO) auth.getPrincipal();
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("client/mypage/review");
		return mav;
	}
	
	// 마이페이지 - 상품 문의 내역
	@RequestMapping(value="/mypage/qna")
	public ModelAndView qna(Authentication auth){
		logger.info("qna 호출 성공");
		MemberVO vo = (MemberVO) auth.getPrincipal();
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("client/mypage/qna");
		return mav;
	}
	
	// 마이페이지 - 내 정보
	@RequestMapping(value="/mypage/myinfo")
	public ModelAndView myinfo(Authentication auth){
		logger.info("myinfo 호출 성공");
		ModelAndView mav = new ModelAndView();
		MemberVO vo = (MemberVO) auth.getPrincipal();
		
		MemberVO mvo = memberService.memberInfo(vo);	
		List<MemberSubAddressVO> list = (List<MemberSubAddressVO>) memberService.mSubAddrs(vo);
		if(list.size() > 0) mav.addObject("msa", list);
		
		mav.addObject("vo",mvo);
		mav.setViewName("client/mypage/myinfo");
		return mav;
	}
	
	// 마이페이지 - 내 정보 수정
	@ResponseBody
	@RequestMapping(value="/mypage/myinfoU")
	public String myinfoU(@ModelAttribute MemberVO vo, Authentication auth){
		logger.info("myinfoU 호출 성공");
		String result = "";
		
		MemberVO mvo = (MemberVO) auth.getPrincipal();
		vo.setM_no(mvo.getM_no());
		
		if(vo.getM_pwd() != ""){
			vo.setM_pwd(encoder.encoding(vo.getM_pwd()));
		}
		
		int gogo = memberService.myInfoUpdate(vo);
		int gogo2 = memberService.myAddrUpdate(vo);
		if (gogo == 1 && gogo2 == 1){
			result = "success";
		} 
		else{
			result = "fail";
		}
		
		return result;
	}
	
	// 마이페이지 - 서브 주소 삭제
	@ResponseBody
	@RequestMapping(value="/mypage/myinfoD")
	public String myinfoD(Authentication auth, @ModelAttribute MemberSubAddressVO vo){
		logger.info("myinfoD 호출 성공");
		String result = "";

		MemberVO mvo = (MemberVO) auth.getPrincipal();
		vo.setM_no(mvo.getM_no());
		
		int gogo = memberService.msaD(vo);
		if (gogo == 1){
			result = "success";
		} 
		else{
			result = "fail";
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/lostIdChk")
	public String lostIdChk(@ModelAttribute MemberVO vo){
		logger.info("lostIdChk 호출 성공");
		String result = "";
		int gogo = memberService.lostIdChk(vo);
		if(gogo != 1) result = "success";
		return result;
	}

	@ResponseBody
	@RequestMapping(value="/lostPwdChk")
	public String lostPwdChk(@ModelAttribute MemberVO vo){
		logger.info("lostPwdChk 호출 성공");
		String result = "";

		int gogo = memberService.lostPwdChk(vo);
		if(gogo == 1) result = "success";
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/sendId")
	public String sendId(@ModelAttribute MemberVO vo) throws Exception{
		logger.info("sendId 호출 성공");
		String result = "";
		String gogo = memberService.sendId(vo);
		
		Email email = new Email();
		email.setReciver(vo.getM_email().trim());
		email.setSubject("[AON] 아이디를 보내드립니다.");
		email.setContent("회원님에 아이디는 [" + gogo + "]입니다.");
		
		emailSender.SendEmail(email);
		result = "success";
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/sendPwd")
	public String sendPwd(@ModelAttribute MemberVO vo) throws Exception{
		logger.info("sendPwd 호출 성공");
		String result = "";
		String newPwd = Certification.randomPass();
		
		String security = encoder.encoding(newPwd);
		vo.setM_pwd(security);
		
		int gogo = memberService.sendPwd(vo);
		
		if(gogo==1){
			Email email = new Email();
			email.setReciver(vo.getM_email().trim());
			email.setSubject("[AON] 임시 비밀번호를 보내드립니다.");
			email.setContent("회원님에 임시 비밀번호는 [" + newPwd + "]입니다. \n내 정보에서 비밀번호를 수정하세요.");
			
			emailSender.SendEmail(email);
			result = "success";
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/emailChk", method={RequestMethod.GET, RequestMethod.POST})
	public String emailChk(@ModelAttribute MemberVO vo, HttpServletRequest request){
		logger.info("overlapChk 호출성공");
		String result = "";
		int gogo = 0;
		if(request.getMethod().equals("GET")){
			gogo = memberService.emailChk(vo);
		}
		else if(request.getMethod().equals("POST")){
			gogo = memberService.emailChk2(vo);
		}
		
		if (gogo == 1){
			result = "fail";
		} 
		else{
			result = "success";
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/idChk", method=RequestMethod.GET)
	public String idChk(@ModelAttribute MemberVO vo){
		logger.info("overlapChk 호출성공");
		String result = "";
		
		int gogo = memberService.idChk(vo);
		
		if (gogo == 1){
			result = "fail";
		} 
		else{
			result = "success";
		}
		return result;
	}
}
