package kr.co.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.CommentReplyVO;

@Repository
public class CommentReplyImpl implements CommentReplyDAO {

@Inject SqlSession sql;
	
	//댓글조회
	@Override
	public List<CommentReplyVO> readReply(int bno) throws Exception{
		return sql.selectList("commentreplyMapper.readReply", bno);
	}
	
	//댓글 작성
	@Override
	public void writeReply(CommentReplyVO vo) throws Exception{
		sql.insert("commentreplyMapper.writeReply", vo);
	}
	
	//댓글 수정
	@Override
	public void updateReply(CommentReplyVO vo) throws Exception{
		sql.update("commentreplyMapper.updateReply", vo);
	}
	
	//댓글 삭제
	@Override
	public void deleteReply(CommentReplyVO vo) throws Exception{
		sql.delete("commentreplyMapper.deleteReply", vo);
	}
	
	// 선택된 댓글 조회
	@Override
	public CommentReplyVO selectReply (int rno) throws Exception{
		return sql.selectOne("commentreplyMapper.selectReply", rno);
	}
	
}
