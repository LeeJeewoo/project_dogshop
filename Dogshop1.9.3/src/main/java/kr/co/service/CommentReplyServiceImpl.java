package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.dao.CommentReplyDAO;
import kr.co.vo.CommentReplyVO;

@Service
public class CommentReplyServiceImpl implements CommentReplyService {

	@Inject
	private CommentReplyDAO dao;
	
	@Override
	public List<CommentReplyVO> readReply(int bno) throws Exception{
		
		return dao.readReply(bno);
		
	}
	
	@Override
	public void writeReply(CommentReplyVO vo) throws Exception{
		dao.writeReply(vo);
	}
	
	@Override
	public void updateReply(CommentReplyVO vo) throws Exception{
		dao.updateReply(vo);
	}
	
	@Override
	public void deleteReply(CommentReplyVO vo) throws Exception{
		dao.deleteReply(vo);
	}
	
	@Override
	public CommentReplyVO selectReply(int rno) throws Exception{
		return dao.selectReply(rno);
	}
	
}
