package kr.co.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.dao.NoticeDAO;
import kr.co.util.NoticeFileUtils;
import kr.co.vo.NoticeVO;
import kr.co.vo.SearchCriteria;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Inject
	private NoticeDAO dao;
	
	@Resource(name="noticefileUtils")
	private NoticeFileUtils fileUtils;

	
	// 게시글 작성
	@Override
	public void write(NoticeVO noticeVO, MultipartHttpServletRequest mpRequest) throws Exception {
		dao.write(noticeVO);
		
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(noticeVO, mpRequest); 
		int size = list.size();
		for(int i=0; i<size; i++){ 
			dao.insertFile(list.get(i)); 
		}
	}
	// 게시물 목록 조회
	@Override
	public List<NoticeVO> list(SearchCriteria scri) throws Exception {

		return dao.list(scri);
	}
	
	// 게시물 총 갯수
	@Override
	public int listCount(SearchCriteria scri) throws Exception{
		
		return dao.listCount(scri);
	}
	
	// 게시물 조회
	@Override
	public NoticeVO read(int bno) throws Exception {

		return dao.read(bno);
	}
	
	// 게시물 업데이트
	@Override
	public void update(NoticeVO noticeVO) throws Exception {

		dao.update(noticeVO);
	}

	// 게시물 삭제
	@Override
	public void delete(int bno) throws Exception {
		
		dao.delete(bno);
	}

	// 첨부파일 조회
	@Override
	public List<Map<String, Object>> selectFileList(int bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectFileList(bno);
	}

	// 첨부파일 다운로드
	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectFileInfo(map);
	}

	@Override
	public void update(NoticeVO noticeVO, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception {
		
		dao.update(noticeVO);
		
		List<Map<String, Object>> list = fileUtils.parseUpdateFileInfo(noticeVO, files, fileNames, mpRequest);
		Map<String, Object> tempMap = null;
		int size = list.size();
		for(int i = 0; i<size; i++) {
			tempMap = list.get(i);
			if(tempMap.get("IS_NEW").equals("Y")) {
				dao.insertFile(tempMap);
			}else {
				dao.updateFile(tempMap);
			}
		}
	}
	
	@Override
	public List<NoticeVO> indexInfo() throws Exception {
		
		return dao.indexInfo();
	}
	
}
