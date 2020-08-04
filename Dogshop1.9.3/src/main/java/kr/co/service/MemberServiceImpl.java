package kr.co.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.dao.MemberDAO;
import kr.co.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Inject
	MemberDAO dao;
	
	@Override
	public void register(MemberVO memberVO) throws Exception {
		
		dao.register(memberVO);
		
	}
	
	@Override
	public MemberVO login(MemberVO memberVO) throws Exception {
		
		return dao.login(memberVO);
	}
	
	@Override
	public int idChk(MemberVO memberVO) throws Exception {
		int result = dao.idChk(memberVO);
		return result;
	}
	
	@Override
	public MemberVO passChk(MemberVO memberVO) throws Exception {
		MemberVO result = dao.passChk(memberVO);
		return result;
	}
	
	@Override
	public MemberVO infoChk(MemberVO memberVO) throws Exception {
		
		return dao.infoChk(memberVO);
	}
	
	@Override
	public void userUpdate(MemberVO memberVO) throws Exception {
		
		dao.userUpdate(memberVO);
		
	}
	
	@Override
	public int searchPw(MemberVO memberVO) throws Exception {
		
		return dao.searchPw(memberVO);
	}
	
	@Override
	public int searchId(MemberVO memberVO) throws Exception {
		
		return dao.searchId(memberVO);
	}
	@Override
	public MemberVO resultId(MemberVO memberVO) throws Exception {
		
		return dao.resultId(memberVO);
	}
	
	@Override
	public void changePw(MemberVO memberVO) throws Exception {
		
		dao.changePw(memberVO);
	}

	
	@Override
	public void userDrop(MemberVO memberVO) throws Exception {
		// TODO Auto-generated method stub
		
		dao.userDrop(memberVO);
	}

	/*@Override
	public int userDrop(MemberVO memberVO) throws Exception {
		// TODO Auto-generated method stub
		int result = dao.userDrop(memberVO);
		return result;
	}*/

	
	
}
