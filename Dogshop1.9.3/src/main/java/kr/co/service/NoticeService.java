package kr.co.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.vo.NoticeVO;
import kr.co.vo.SearchCriteria;

public interface NoticeService {

	// 게시글 작성
			public void write(NoticeVO noticeVO, MultipartHttpServletRequest mpRequest) throws Exception;
			
			// 게시물 목록 조회
			public List<NoticeVO> list(SearchCriteria scri) throws Exception;
				
			// 게시물 총 갯수
			public int listCount(SearchCriteria scri) throws Exception;
			
			// 게시물 목록 조회
			public NoticeVO read(int bno) throws Exception;
			
			// 게시물 수정
			public void update(NoticeVO noticeVO) throws Exception;
			
			// 게시물 삭제
			public void delete(int bno) throws Exception;

			// 첨부파일 조회
			public List<Map<String, Object>> selectFileList(int bno) throws Exception;
			
			// 첨부파일 다운'
			public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
			
			// 게시물 수정
			public void update(NoticeVO noticeVO, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception;
			
			public List<NoticeVO> indexInfo() throws Exception;
	
}
