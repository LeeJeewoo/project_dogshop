package kr.co.controller;

import java.lang.reflect.Member;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.service.MemberService;
import kr.co.vo.MemberVO;



@Controller
@RequestMapping("/member/*")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	MemberService service;
	
	@Inject
	BCryptPasswordEncoder pwdEncoder;
	
	
	// 회원가입 get
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String getRegister() throws Exception {
		logger.info("get register");
		
		return "member/joinForm";
	}
	
	// 회원가입 post
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String postRegister(MemberVO memberVO) throws Exception {
		logger.info("post register");
		
		int result = service.idChk(memberVO);
		try {
			if(result == 1) {
				return "/member/joinForm";
			}else if(result == 0) {
				String inputPass = memberVO.getUserPass();
				String pwd = pwdEncoder.encode(inputPass);
				memberVO.setUserPass(pwd);
				service.register(memberVO);
			}
		} catch (Exception e) {
			throw new RuntimeException();
		}
		return "redirect:/";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() throws Exception{
		logger.info("get login");
		

		return "member/loginForm";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberVO memberVO, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
		logger.info("post login");
		
		HttpSession session = req.getSession();
		
		MemberVO login = service.login(memberVO);
		boolean pwdMatch = pwdEncoder.matches(memberVO.getUserPass(), login.getUserPass());
		
		if(login != null && pwdMatch == true ) {
			session.setAttribute("member", login);
		}else {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
		}
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value="/idChk", method = RequestMethod.POST)
	public int idChk(MemberVO vo) throws Exception {
		int result = service.idChk(vo);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/passChk", method = RequestMethod.POST)
	public int passChk(MemberVO memberVO) throws Exception {
		
		MemberVO login = service.passChk(memberVO);
		boolean pwdMatch = pwdEncoder.matches(memberVO.getUserPass(), login.getUserPass());
		
		if(pwdMatch==true) {
			return 1;
		}
		else {
			return 0;
		}
		
		
	}
	
	/*################################################################################*/
	/*포스트방식자리*/
	/*@RequestMapping(value = "/rvForm", method = RequestMethod.POST)*/
	
	/*################################################################################*/
	
	@RequestMapping(value = "/memberInfoCheck", method = RequestMethod.GET)
	public String memberInfoCheck(HttpSession session) throws Exception{
		logger.info("memberInfoCheck");
		
		return "member/memberInfoCheck";
	}
	
		
	@RequestMapping(value = "/memberInfoCheck", method = RequestMethod.POST)
	public String memberInfoCheck(MemberVO memberVO, Model model) throws Exception{
		logger.info("memberInfoCheck");
		
		model.addAttribute("info",service.infoChk(memberVO));
		
		return "member/userUpdateForm";
	}
	
	/*######################################################################################################*/
	
	// 회원 탈퇴 get
	@RequestMapping(value = "/memberInfoCheckDrop", method = RequestMethod.GET)
	public String memberInfoCheck2(HttpSession session) throws Exception{
		logger.info("memberInfoCheckDrop");
		
		return "member/memberInfoCheckDrop";
	}
	
		
		// 회원 탈퇴 post
		@RequestMapping(value="/userDrop", method = RequestMethod.POST)
		public String userDrop(MemberVO memberVO, Model model, HttpSession session) throws Exception{
			
			
			service.userDrop(memberVO);
			
			session.invalidate();
			return "redirect:/";
		}
	
	/*######################################################################################################*/
	
	
	
	@RequestMapping(value = "/userUpdate", method = RequestMethod.POST)
	public String userUpdate(MemberVO memberVO, Model model, HttpSession session) throws Exception{
		logger.info("userUpdate");
		
		String inputPass = memberVO.getUserPass();
		String pwd = pwdEncoder.encode(inputPass);
		memberVO.setUserPass(pwd);
		
		service.userUpdate(memberVO);
		
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value = "/searchPw", method = RequestMethod.GET)
	public String searchPw(MemberVO memberVO, Model model) throws Exception{
		logger.info("searchPw");

		return "member/searchPwForm";
	}
	
	@RequestMapping(value = "/searchId", method = RequestMethod.GET)
	public String searchId(MemberVO memberVO, Model model) throws Exception{
		logger.info("searchId");

		return "member/searchIdForm";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/searchPw", method = RequestMethod.POST)
	public int searchPw(MemberVO memberVO) throws Exception {
		
		
		int result = service.searchPw(memberVO);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/searchId", method = RequestMethod.POST)
	public int searchId(MemberVO memberVO) throws Exception {
		
		
		int result = service.searchId(memberVO);
		return result;
	}
	
	@RequestMapping(value="/popup_pass", method = RequestMethod.GET)
	public void popupPass(Model model, @RequestParam(value="userId", defaultValue="") String userId) throws Exception {
		
		
		model.addAttribute("userId", userId);
		
	}
	
	@RequestMapping(value="/popup_id", method = RequestMethod.GET)
	public String popupId(Model model, HttpServletRequest req) throws Exception {
		
		MemberVO vo = new MemberVO();
		
		vo.setUserName(req.getParameter("userName"));
		vo.setUserTel(req.getParameter("userTel"));
		
		model.addAttribute("result",service.resultId(vo));
		
		return "member/popup_id";
		
	}
	
	@RequestMapping(value = "/changePw", method = RequestMethod.POST)
	public String changePw(MemberVO memberVO, Model model) throws Exception{
		
		String inputPass = memberVO.getUserPass();
		String pwd = pwdEncoder.encode(inputPass);
		memberVO.setUserPass(pwd);
		
		service.changePw(memberVO);
		
		return "redirect:/";
		
	}
	
	
	
	
}
