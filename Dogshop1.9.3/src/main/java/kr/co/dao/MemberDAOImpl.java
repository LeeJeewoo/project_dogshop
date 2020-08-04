package kr.co.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO{
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public void register(MemberVO memberVO) throws Exception {
		sqlSession.insert("memberMapper.register", memberVO);
		
	}
	
	@Override
	public MemberVO login(MemberVO memberVO) throws Exception {
		
		return sqlSession.selectOne("memberMapper.login", memberVO);
	}
	
	@Override
	public int idChk(MemberVO memberVO) throws Exception {
		int result = sqlSession.selectOne("memberMapper.idChk", memberVO);
		return result;
	}
	
	@Override
	public MemberVO passChk(MemberVO memberVO) throws Exception {
		MemberVO result = sqlSession.selectOne("memberMapper.passChk", memberVO);
		return result;
	}
	
	@Override
	public MemberVO infoChk(MemberVO memberVO) throws Exception {
		
		return sqlSession.selectOne("memberMapper.infoChk",memberVO);
	}
	
	@Override
	public void userUpdate(MemberVO memberVO) throws Exception {
		
		sqlSession.update("memberMapper.userUpdate", memberVO);
		
	}
	
	@Override
	public int searchPw(MemberVO memberVO) throws Exception {
		
		return sqlSession.selectOne("memberMapper.searchPw", memberVO);
	}
	
	@Override
	public int searchId(MemberVO memberVO) throws Exception {
		
		return sqlSession.selectOne("memberMapper.searchId", memberVO);
	}
	
	@Override
	public MemberVO resultId(MemberVO memberVO) throws Exception {
		
		return sqlSession.selectOne("memberMapper.resultId", memberVO);
	}
	
	@Override
	public void changePw(MemberVO memberVO) throws Exception {
		sqlSession.update("memberMapper.changePw",memberVO);
		
	}

	

	@Override
	public void userDrop(MemberVO memberVO) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete("memberMapper.userDrop", memberVO);
		
	}

	
	
}
