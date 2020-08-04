package kr.co.dao;

import kr.co.vo.MemberVO;

public interface MemberDAO {
	
	
	public void register(MemberVO memberVO) throws Exception;
	public MemberVO login(MemberVO memberVO) throws Exception;
	public int idChk(MemberVO memberVO) throws Exception;
	public MemberVO passChk(MemberVO memberVO) throws Exception;
	public MemberVO infoChk(MemberVO memberVO) throws Exception;
	public void userUpdate(MemberVO memberVO) throws Exception;
	public int searchPw(MemberVO memberVO) throws Exception;
	public int searchId(MemberVO memberVO) throws Exception;
	public MemberVO resultId(MemberVO memberVO) throws Exception;
	public void changePw(MemberVO memberVO) throws Exception;
	public void userDrop(MemberVO memberVO) throws Exception;
	
}
