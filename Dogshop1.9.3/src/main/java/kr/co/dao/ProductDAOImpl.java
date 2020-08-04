package kr.co.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.ProductCriteria;
import kr.co.vo.ProductFileVO;
import kr.co.vo.ProductVO;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Inject
	private SqlSession sqlSession;
	
	
	@Override
	public void write(ProductVO productVO) throws Exception {
		
		sqlSession.insert("productMapper.insert", productVO);
		
	}
	
	@Override
	public void insertFile(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("productMapper.insertFile", map);
	}
	@Override
	public List<ProductFileVO> selectFile(int pno) throws Exception {
		
		return sqlSession.selectList("productMapper.selectFile", pno);
	}
	
	@Override
	public List<ProductVO> listSize(String shape) throws Exception {
		
		return sqlSession.selectList("productMapper.listSize",shape);
	}
	
	@Override
	public List<ProductVO> listType(String type) throws Exception {
		return sqlSession.selectList("productMapper.listType", type);
	}
	
	@Override
	public List<ProductVO> sizePage(ProductCriteria pcri) throws Exception {
		return sqlSession.selectList("productMapper.sizePage", pcri);
	}
	
	@Override
	public int sizeCount(String shape) throws Exception {
		return sqlSession.selectOne("productMapper.sizeCount",shape);
	}
	
	@Override
	public List<ProductVO> listPage(ProductCriteria pcri) throws Exception {
		
		return sqlSession.selectList("productMapper.listPage", pcri);
	}
	
	@Override
	public int listCount(String type) throws Exception {
		
		return sqlSession.selectOne("productMapper.listCount",type);
	}
	
	@Override
	public List<ProductVO> searchPage(ProductCriteria pcri) throws Exception {
		return sqlSession.selectList("productMapper.searchPage", pcri);
	}
	
	@Override
	public int searchCount(String keyword) throws Exception {
		
		return sqlSession.selectOne("productMapper.searchCount",keyword);
	}
	
	
	@Override
	public ProductVO read(int pno) throws Exception {
		
		return sqlSession.selectOne("productMapper.read",pno);
	}
	
	@Override
	public List<ProductVO> indexPro() throws Exception {
		
		return sqlSession.selectList("productMapper.indexPro");
	}
	
	@Override
	public List<ProductVO> delete(int pno) throws Exception {
		
		return sqlSession.selectList("productMapper.delete", pno);
	}
	
	@Override
	public void update(ProductVO productVO) throws Exception {
		
		sqlSession.update("productMapper.update", productVO);
	}
	
	@Override
	public void updateFile(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
		sqlSession.update("productMapper.updateFile", map);
	}
	
	@Override
	public List<Map<String, Object>> selectFileList(int pno) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("productMapper.selectFileList", pno);
	}
	
}
