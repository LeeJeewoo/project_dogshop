package kr.co.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.CommentVO;
import kr.co.vo.SearchCriteria;

@Repository
public class CommentDAOImpl implements CommentDAO{

	
	@Inject
	private SqlSession sqlSession;
	
	// 게시글 작성
	@Override
	public void write(CommentVO commentVO) throws Exception {
		sqlSession.insert("commentMapper.insert", commentVO);
		
	}
	
	// 게시물 목록 조회
	@Override
	public List<CommentVO> list(SearchCriteria scri) throws Exception {
	
		return sqlSession.selectList("commentMapper.listPage", scri);

	}
	
	// 게시불 총 갯수
	@Override
	public int listCount(SearchCriteria scri) throws Exception{
		
		return sqlSession.selectOne("commentMapper.listCount", scri);
		
	}
	
	// 게시물 조회
	@Override
	public CommentVO read(int bno) throws Exception {
			
		return sqlSession.selectOne("commentMapper.read", bno);
	}
	
	// 게시물 수정
	@Override
	public void update(CommentVO commentVO) throws Exception {
		
		sqlSession.update("commentMapper.update", commentVO);
	}

	// 게시물 삭제
	@Override
	public void delete(int bno) throws Exception {
		
		sqlSession.delete("commentMapper.delete", bno);
	}
	
	// 첨부파일 업로드
	@Override
	public void insertFile(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("commentMapper.insertFile", map);
	}
		
	// 첨부파일 조회
	@Override
	public List<Map<String, Object>> selectFileList(int bno) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("commentMapper.selectFileList", bno);
	}
	
	// 첨부파일 다운로드
	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("commentMapper.selectFileInfo", map);
	}
	
	@Override
	public void updateFile(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
		sqlSession.update("commentMapper.updateFile", map);
	}
	
}
