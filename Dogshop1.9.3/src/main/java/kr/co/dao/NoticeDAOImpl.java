package kr.co.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.NoticeVO;
import kr.co.vo.SearchCriteria;

@Repository
public class NoticeDAOImpl implements NoticeDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	// 게시글 작성
	@Override
	public void write(NoticeVO noticeVO) throws Exception {
		sqlSession.insert("noticeMapper.insert", noticeVO);
		
	}
	
	// 게시물 목록 조회
	@Override
	public List<NoticeVO> list(SearchCriteria scri) throws Exception {
	
		return sqlSession.selectList("noticeMapper.listPage", scri);

	}
	
	// 게시불 총 갯수
	@Override
	public int listCount(SearchCriteria scri) throws Exception{
		
		return sqlSession.selectOne("noticeMapper.listCount", scri);
		
	}
	
	// 게시물 조회
	@Override
	public NoticeVO read(int bno) throws Exception {
			
		return sqlSession.selectOne("noticeMapper.read", bno);
	}
	
	// 게시물 수정
	@Override
	public void update(NoticeVO noticeVO) throws Exception {
		
		sqlSession.update("noticeMapper.update", noticeVO);
	}

	// 게시물 삭제
	@Override
	public void delete(int bno) throws Exception {
		
		sqlSession.delete("noticeMapper.delete", bno);
	}
	
	// 첨부파일 업로드
	@Override
	public void insertFile(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("noticeMapper.insertFile", map);
	}
		
	// 첨부파일 조회
	@Override
	public List<Map<String, Object>> selectFileList(int bno) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("noticeMapper.selectFileList", bno);
	}
	
	// 첨부파일 다운로드
	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("noticeMapper.selectFileInfo", map);
	}
	
	@Override
	public void updateFile(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
		sqlSession.update("noticeMapper.updateFile", map);
	}
	
	@Override
	public List<NoticeVO> indexInfo() throws Exception {
		
		return sqlSession.selectList("noticeMapper.indexInfo");
	}

}
