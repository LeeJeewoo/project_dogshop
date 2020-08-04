package kr.co.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.service.NoticeService;
import kr.co.service.ProductService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/*")
public class HomeController {
	
private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

@Inject
NoticeService noticsService;

@Inject
ProductService productService;

	
@RequestMapping(value = "/")
public String index(Model model) throws Exception{
	logger.info("companyMap");
	
	model.addAttribute("indexNotice",noticsService.indexInfo());
	model.addAttribute("indexProduct",productService.indexPro());
	
	return "index";
}


@RequestMapping(value = "/company_outline")
public String companyOutLine() throws Exception{
	logger.info("companyOutline");
	
	return "company_outline";
}

@RequestMapping(value = "/company_map")
public String companyMap() throws Exception{
	logger.info("companyMap");
	
	return "company_map";
}





/*@RequestMapping(value = "/rvForm", method = RequestMethod.GET)
	public String memberRvForm(HttpSession session) throws Exception{
		logger.info("memberRvForm");
		
		return "rvForm";
	}*/
	
	
	/*
	@RequestMapping(value="/loginForm")로그인창 으로이동
	public String moveLoginPage() {
		
		return "member/loginForm";
		
	}
	
	@RequestMapping(value="/joinForm")회원가입창 으로이동
	public String moveJoinPage() {
		
		return "member/joinForm";
		
	}
	
	@RequestMapping(value="/searchIdForm") //아이디찾기창으로이동
	public String moveSearchId() {
		
		return "searchIdForm";
		
	}
	@RequestMapping(value="/searchPwForm")//비밀번호찾기창으로 이동
	public String moveSearchPw() {
		
		return "searchPwForm";
		
	}
	memberInfoCheck
	
	@RequestMapping(value="/memberInfoCheck")//로그인된 유저 회원정보 수정 전에 확인하는 창으로 이동
	public String moveMemberInfoCheck() {
		
		return "memberInfoCheck";
		
	}
	
	@RequestMapping(value="/userUpdateForm")//로그인된 유저 회원정보 수정 전에 확인하는 창으로 이동
	public String moveUserUpdate() {
		
		return "userUpdateForm";
		
	}
	@RequestMapping(value="/cartForm")//장바구니 창으로 이동
	public String moveCartForm() {
		
		return "cartForm";
		
	}
	@RequestMapping(value="/rvForm")//주문확인 창으로 이동
	public String moveRVForm() {
		
		return "rvForm";
		
	}
	
	
	@RequestMapping(value="/noticeForm")//공지사항 창으로 이동
	public String moveNoticeForm() {
		
		return "noticeForm";
		
	}
	@RequestMapping(value="/write_notice")//공지사항 글쓰기 창으로 이동
	public String moveWriteNotice() {
		
		return "write_notice";
		
	}
	@RequestMapping(value="/view_notice")//공지사항 글보기 창으로 이동
	public String moveViewNotice() {
		
		return "view_notice";
		
	}
	
	@RequestMapping(value="/update_notice")//공지사항 글수정 창으로 이동
	public String moveUpdateNotice() {
		
		return "update_notice";
		
	}
	
	
	@RequestMapping(value="/board/qnaForm")//상품문의 창으로 이동
	public String moveQnaForm() {
		
		return "qnaForm";
		
	}
	@RequestMapping(value="/board/write_qna")//상품문의 글쓰기 창으로이동
	public String moveWriteQna() {
		
		return "write_qna";
		
	}
	
	@RequestMapping(value="/view_qna")//상품문의 게시글보기 창으로 이동
	public String moveViewQna() {
		
		return "view_qna";
		
	}
	
	@RequestMapping(value="/update_qna")//상품문의 글수정 창으로이동
	public String moveUpdateQna() {
		
		return "update_qna";
		
	}
	@RequestMapping(value="/commentForm")//분양후기 창으로 이동
	public String moveCommentForm() {
		
		return "commentForm";
		
	}
	@RequestMapping(value="/write_comment")//분양후기 작성
	public String moveWriteComment() {
		
		return "write_comment";
		
	}
	@RequestMapping(value="/view_comment")//분양후기 게시글 보기 창으로 이동
	public String moveViewComment() {
		
		return "view_comment";
		
	}
	@RequestMapping(value="/update_comment")//분양후기 게시글 수정 창으로 이동
	public String moveUpdateComment() {
		
		return "update_comment";
		
	}
	
	@RequestMapping(value="/company_outline")//회사오는길 창으로 이동
	public String moveCompanyOutline() {
		
		return "company_outline";
		
	}
	
	@RequestMapping(value="/company_map")//회사 위치 확인 창으로 이동
	public String moveCompanyMap() {
		
		return "company_map";
		
	}
	
	@RequestMapping(value="/smallSize")//소형견 분양 창으로 이동
	public String moveSmallSize() {
		
		return "smallSize";
		
	}
	
	@RequestMapping(value="/middleSize")//중형견 분양 창으로 이동
	public String moveMiddleSize() {
		
		return "middleSize";
		
	}
	
	@RequestMapping(value="/largeSize")//대형견 분양 창으로 이동
	public String moveLargeSize() {
		
		return "largeSize";
		
	}
	
	@RequestMapping(value="/detailPage")//상품상제페이지로 이동
	public String moveDetailPage() {
		
		return "detailPage";
		
	}*/
	
	
	
	
	
	/*private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	*//**
	 * Simply selects the home view to render by returning its name.
	 *//*
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}*/
	
}
