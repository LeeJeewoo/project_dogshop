package kr.co.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.service.ProductService;
import kr.co.vo.ProductCriteria;
import kr.co.vo.ProductPageMaker;
import kr.co.vo.ProductVO;
import kr.co.vo.SearchCriteria;

@Controller
@RequestMapping("/product/*")
public class ProductController {

	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	
	@Inject
	ProductService service;
	
	
	// 게시판 글 작성 화면
	@RequestMapping(value = "/product/insertView", method = RequestMethod.GET)
	public String writeView() throws Exception {
		
		logger.info("writeView");
		
		return "product/insertPage";
		
	}
	
	// 게시판 글 작성
	@RequestMapping(value = "/product/write", method = RequestMethod.POST)
	public String write(ProductVO productVO, MultipartHttpServletRequest mpRequest) throws Exception{
		logger.info("write");
		
		service.write(productVO, mpRequest);
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/sizePage", method = RequestMethod.GET)
	public String sizePage(Model model, ProductCriteria pcri, @RequestParam("shape") String shape) throws Exception{
		logger.info("listPage");
		
		pcri.setShape(shape);
		
		model.addAttribute("list", service.sizePage(pcri));
		
		ProductPageMaker pageMaker = new ProductPageMaker();
		pageMaker.setPcri(pcri);
		pageMaker.setTotalCount(service.sizeCount(shape));
		
		model.addAttribute("pageMaker", pageMaker);
		
		model.addAttribute("listType",shape);
		
		return "product/size2";
		
	}
	
	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public String listPage(Model model, ProductCriteria pcri, @RequestParam("type") String type) throws Exception{
		logger.info("listPage");
		
		pcri.setType(type);
		
		model.addAttribute("list", service.listPage(pcri));
		
		ProductPageMaker pageMaker = new ProductPageMaker();
		pageMaker.setPcri(pcri);
		pageMaker.setTotalCount(service.listCount(type));
		
		model.addAttribute("pageMaker", pageMaker);
		
		model.addAttribute("listType",type);
		
		return "product/size";
		
	}
	
	@RequestMapping(value = "/searchPage", method = RequestMethod.GET)
	public String searchPage(Model model, ProductCriteria pcri, @RequestParam("keyword") String keyword) throws Exception{
		logger.info("searchPage");
		
		pcri.setKeyword(keyword);
		
		model.addAttribute("list", service.searchPage(pcri));
		
		ProductPageMaker pageMaker = new ProductPageMaker();
		pageMaker.setPcri(pcri);
		pageMaker.setTotalCount(service.searchCount(keyword));
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("keyword", keyword);
		
		return "product/search";
		
	}
	
	
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String read(ProductVO productVO,Model model) throws Exception{
		logger.info("read");
		
		model.addAttribute("read",service.read(productVO.getPno()));
		model.addAttribute("img",service.selectFile(productVO.getPno()));
		
		return "product/detailPage";
		
	}
	
	
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cart(ProductVO productVO,Model model, HttpSession session, RedirectAttributes rttr) throws Exception{
		logger.info("cart");
		
		ProductVO pv = service.read(productVO.getPno());
		ArrayList<ProductVO> list = (ArrayList<ProductVO>)session.getAttribute("productlist");
		if( list == null ) {
			list = new ArrayList();
			session.setAttribute("productlist", list);
		}
		list.add(pv);
		
		return "product/sbadd";
		
	}
	
	@RequestMapping(value = "/cartView", method = RequestMethod.GET)
	public String cartView(ProductVO productVO,Model model, HttpSession session) throws Exception{
		logger.info("cartView");

		return "product/cartForm";
		
	}
	@RequestMapping(value = "/rvForm", method = RequestMethod.GET)
	public String RvForm(HttpSession session) throws Exception{
		logger.info("productRvForm");
		
		if(session.getAttribute("productlist") != null) {
		session.setAttribute("rvlist", session.getAttribute("productlist"));
		session.removeAttribute("productlist");
		}

		return "product/rvForm";
	}
	
	@RequestMapping(value = "/rForm", method = RequestMethod.GET)
	public String rForm(HttpSession session) throws Exception{
		logger.info("productRvForm");

		return "product/rvForm";
	}
	
	@RequestMapping(value = "/rv_cencel", method = RequestMethod.GET)
	public String rv_cencel(HttpSession session) throws Exception{
		logger.info("productRvForm");
		
		session.removeAttribute("rvlist");

		return "product/rvForm";
	}
	
	@RequestMapping(value = "/sDelete", method = RequestMethod.POST)
	public String sDelete(HttpServletRequest request, Model model, HttpSession session) throws Exception{
		logger.info("sDelete");
		
		ArrayList<ProductVO> list = (ArrayList<ProductVO>)session.getAttribute("productlist");
		String[] checkValue = request.getParameterValues("cnt");
		ArrayList<Integer> changeValue = new ArrayList<Integer>();
		
		for(String val : checkValue) {
			changeValue.add(Integer.parseInt(val));
		}
		
		for(int i=0; i<changeValue.size(); i++) {
			for(int j=0; j<list.size(); j++) {
				if(list.get(j).getPno() == changeValue.get(i)) {
					list.remove(j);
					j--;
				}
				
			}
		}
		
		return "product/cartForm";
		
	}
	
	@RequestMapping(value = "/allDelete", method = RequestMethod.GET)
	public String allDelete(Model model, HttpSession session) throws Exception{
		logger.info("sDelete");
		
		session.removeAttribute("productlist");
		
		return "product/cartForm";
		
	}
	
	@RequestMapping(value = "/popUp", method = RequestMethod.GET)
	public String getPopUp() throws Exception {
		logger.info("popUp");
		
		return "product/popUp";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(ProductVO productVO) throws Exception {
		logger.info("writeView");
		
		service.delete(productVO.getPno());
		
		return "redirect:/";
	}
	
	// 업데이트 화면
	@RequestMapping(value = "/product/updateView", method = RequestMethod.GET)
	public String updateView(ProductVO productVO,@ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		
		logger.info("updateView");
		model.addAttribute("update", service.read(productVO.getPno()));
		model.addAttribute("scri", scri);

		List<Map<String, Object>> fileList = service.selectFileList(productVO.getPno());
		model.addAttribute("file", fileList);
				
		return "product/updatePage";
		
	}
	
	// 업데이트
	@RequestMapping(value = "/product/update", method = RequestMethod.POST)
	public String update(ProductVO productVO,
		 @ModelAttribute("scri") SearchCriteria scri, 
		 RedirectAttributes rttr,
		 @RequestParam(value="fileNoDel[]") String[] files,
		 @RequestParam(value="fileNameDel[]") String[] fileNames,
		 MultipartHttpServletRequest mpRequest) throws Exception {
		logger.info("update");
		
		service.update(productVO, files, fileNames, mpRequest);

			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/";
	}
	
}
