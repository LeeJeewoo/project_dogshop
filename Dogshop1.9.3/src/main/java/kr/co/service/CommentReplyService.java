package kr.co.service;

import java.util.List;

import kr.co.vo.CommentReplyVO;



public interface CommentReplyService {

	//댓글 조회
	public List<CommentReplyVO> readReply(int bno) throws Exception;
	
	//댓글 작성
	public void writeReply(CommentReplyVO vo) throws Exception;
	
	//댓글 수정
	public void updateReply(CommentReplyVO vo) throws Exception;
	
	//댓글 삭제
	public void deleteReply(CommentReplyVO vo) throws Exception;
	
	//선택된 댓글 조회
	public CommentReplyVO selectReply(int rno) throws Exception;
	
}
