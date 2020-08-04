package kr.co.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

import kr.co.service.BoardService;
import kr.co.service.ReplyService;
import kr.co.vo.BoardVO;
import kr.co.vo.Criteria;
import kr.co.vo.PageMaker;
import kr.co.vo.PhotoVo;
import kr.co.vo.ReplyVO;
import kr.co.vo.SearchCriteria;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	BoardService service;
	
	@Inject
	ReplyService replyService;
	
	// qna 게시판 글 작성 화면
	@RequestMapping(value = "/board/write_qna", method = RequestMethod.GET)
	public void writeView(HttpServletRequest request) throws Exception{
		logger.info("write_qna");

	}
	
	// qna게시판 글 작성
	@RequestMapping(value = "/board/qna_write", method = RequestMethod.POST)
	public String write(BoardVO boardVO, MultipartHttpServletRequest mpRequest) throws Exception{
		logger.info("write");
		service.write(boardVO, mpRequest);
		
		return "redirect:/board/qnalist";
	}
	
	// qna 게시판 목록 조회
	@RequestMapping(value = "/qnalist", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception{
		logger.info("list");
		
		model.addAttribute("list", service.list(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "board/qnalist";
		
	}
	
	// 게시판 조회
	@RequestMapping(value = "/view_qna", method = RequestMethod.GET)
	public String read(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		logger.info("read");

		model.addAttribute("read", service.read(boardVO.getBno()));
		model.addAttribute("scri", scri);

		List<ReplyVO> replyList = replyService.readReply(boardVO.getBno());
		model.addAttribute("replyList", replyList);

		List<Map<String, Object>> fileList = service.selectFileList(boardVO.getBno());
		model.addAttribute("file", fileList);
		return "board/view_qna";
	}
	// qna 게시판 수정뷰
	@RequestMapping(value = "/update_qna", method = RequestMethod.GET)
	public String updateView(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		logger.info("updateView");

		model.addAttribute("update", service.read(boardVO.getBno()));
		model.addAttribute("scri", scri);

		List<Map<String, Object>> fileList = service.selectFileList(boardVO.getBno());
		model.addAttribute("file", fileList);
			
			return "board/update_qna";
		}
		
		// qna 게시판 수정
		@RequestMapping(value = "/update", method = RequestMethod.POST)
		public String update(BoardVO boardVO, 
			 @ModelAttribute("scri") SearchCriteria scri, 
			 RedirectAttributes rttr,
			 @RequestParam(value="fileNoDel[]") String[] files,
			 @RequestParam(value="fileNameDel[]") String[] fileNames,
			 MultipartHttpServletRequest mpRequest) throws Exception {
			logger.info("update");
			
			service.update(boardVO, files, fileNames, mpRequest);

				rttr.addAttribute("page", scri.getPage());
				rttr.addAttribute("perPageNum", scri.getPerPageNum());
				rttr.addAttribute("searchType", scri.getSearchType());
				rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/board/qnalist";
		}

		// qna 게시판 삭제
		@RequestMapping(value = "/delete", method = RequestMethod.POST)
		public String delete(BoardVO boardVO) throws Exception{
			logger.info("delete");
			
			service.delete(boardVO.getBno());
			
			return "redirect:/board/qnalist";
		}

		//qna 댓글 작성
		@RequestMapping(value="/replyWrite", method = RequestMethod.POST)
		public String replyWrite(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
			logger.info("reply Write");
			
			replyService.writeReply(vo);
			
			rttr.addAttribute("bno", vo.getBno());
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/board/view_qna";
		}
		
		//qna 댓글 수정 GET
		@RequestMapping(value="/replyUpdateView", method = RequestMethod.GET)
		public String replyUpdateView(ReplyVO vo, SearchCriteria scri, Model model) throws Exception {
			logger.info("reply Write");
			
			model.addAttribute("replyUpdate", replyService.selectReply(vo.getRno()));
			model.addAttribute("scri", scri);
			
			return "board/replyUpdateView";
		}
		
		//qna 댓글 수정 POST
		@RequestMapping(value="/replyUpdate", method = RequestMethod.POST)
		public String replyUpdate(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
			logger.info("reply Write");
			
			replyService.updateReply(vo);
			
			rttr.addAttribute("bno", vo.getBno());
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/board/view_qna";
		}
		
		//qna 댓글 삭제 GET
		@RequestMapping(value="/replyDeleteView", method = RequestMethod.GET)
		public String replyDeleteView(ReplyVO vo, SearchCriteria scri, Model model) throws Exception {
			logger.info("reply Write");
			
			model.addAttribute("replyDelete", replyService.selectReply(vo.getRno()));
			model.addAttribute("scri", scri);
			

			return "board/replyDeleteView";
		}
		
		//qna 댓글 삭제
		@RequestMapping(value="/replyDelete", method = RequestMethod.GET)
		public String replyDelete(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
			logger.info("reply Write");
			
			replyService.deleteReply(vo);
			
			rttr.addAttribute("bno", vo.getBno());
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/board/view_qna";
		}
		
		//파일 다운로드
		@RequestMapping(value="/fileDown")
		public void fileDown(@RequestParam Map<String, Object> map, HttpServletResponse response) throws Exception{
			Map<String, Object> resultMap = service.selectFileInfo(map);
			String storedFileName = (String) resultMap.get("STORED_FILE_NAME");
			String originalFileName = (String) resultMap.get("ORG_FILE_NAME");
			
			// 파일을 저장했던 위치에서 첨부파일을 읽어 byte[]형식으로 변환한다.
			byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File("E:\\JAVA dev (09.17~03.12) PM\\workspace\\study2\\src\\main\\webapp\\resources\\boardimg\\"+storedFileName));
			
			response.setContentType("application/octet-stream");
			response.setContentLength(fileByte.length);
			response.setHeader("Content-Disposition",  "attachment; fileName=\""+URLEncoder.encode(originalFileName, "UTF-8")+"\";");
			response.getOutputStream().write(fileByte);
			response.getOutputStream().flush();
			response.getOutputStream().close();
			
		}
		//단일파일업로드
		@RequestMapping("/board/photoUpload")
		public String photoUpload(HttpServletRequest request, PhotoVo vo){
		    String callback = vo.getCallback();
		    String callback_func = vo.getCallback_func();
		    String file_result = "";
		    try {
		        if(vo.getFiledata() != null && vo.getFiledata().getOriginalFilename() != null && !vo.getFiledata().getOriginalFilename().equals("")){
		            //파일이 존재하면
		            String original_name = vo.getFiledata().getOriginalFilename();
		            String ext = original_name.substring(original_name.lastIndexOf(".")+1);
		            //파일 기본경로
		            String defaultPath = request.getSession().getServletContext().getRealPath("/");
		            //파일 기본경로 _ 상세경로
		            String path = defaultPath + "resource" + File.separator + "photo_upload" + File.separator;             
		            File file = new File(path);
		            System.out.println("path:"+path);
		            //디렉토리 존재하지 않을경우 디렉토리 생성
		            if(!file.exists()) {
		                file.mkdirs();
		            }
		            //서버에 업로드 할 파일명(한글문제로 인해 원본파일은 올리지 않는것이 좋음)
		            String realname = UUID.randomUUID().toString() + "." + ext;
		        ///////////////// 서버에 파일쓰기 /////////////////
		            vo.getFiledata().transferTo(new File(path+realname));
		            file_result += "&bNewLine=true&sFileName="+original_name+"&sFileURL=/resource/photo_upload/"+realname;
		        } else {
		            file_result += "&errstr=error";
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    return "redirect:" + callback + "?callback_func="+callback_func+file_result;
		}
		@RequestMapping("/multiplePhotoUpload")
		public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response){
		    try {
		         //파일정보
		         String sFileInfo = "";
		         //파일명을 받는다 - 일반 원본파일명
		         String filename = request.getHeader("file-name");
		         //파일 확장자
		         String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
		         //확장자를소문자로 변경
		         filename_ext = filename_ext.toLowerCase();
		         //파일 기본경로
		         String dftFilePath = request.getSession().getServletContext().getRealPath("/");
		         //파일 기본경로 _ 상세경로
		         String filePath = dftFilePath + "resources" + File.separator + "photo_upload" + File.separator;
		         File file = new File(filePath);
		         if(!file.exists()) {
		            file.mkdirs();
		         }
		         String realFileNm = "";
		         SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		         String today= formatter.format(new java.util.Date());
		         realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
		         String rlFileNm = filePath + realFileNm;
		         ///////////////// 서버에 파일쓰기 /////////////////
		         InputStream is = request.getInputStream();
		         OutputStream os=new FileOutputStream(rlFileNm);
		         int numRead;
		         byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
		         while((numRead = is.read(b,0,b.length)) != -1){
		            os.write(b,0,numRead);
		         }
		         if(is != null) {
		            is.close();
		         }
		         os.flush();
		         os.close();
		         ///////////////// 서버에 파일쓰기 /////////////////
		         // 정보 출력
		         sFileInfo += "&bNewLine=true";
		         // img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
		         sFileInfo += "&sFileName="+ filename;;
		         sFileInfo += "&sFileURL="+"/resources/photo_upload/"+realFileNm;
		         PrintWriter print = response.getWriter();
		         print.print(sFileInfo);
		         print.flush();
		         print.close();
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		}


}

	