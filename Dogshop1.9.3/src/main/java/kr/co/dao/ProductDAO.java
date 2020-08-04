package kr.co.dao;

import java.util.List;
import java.util.Map;

import kr.co.vo.NoticeVO;
import kr.co.vo.ProductCriteria;
import kr.co.vo.ProductFileVO;
import kr.co.vo.ProductVO;

public interface ProductDAO {
	
	public void write(ProductVO productVO) throws Exception;
	public void insertFile(Map<String, Object> map) throws Exception;
	public List<ProductFileVO> selectFile(int pno) throws Exception;
	public List<ProductVO> listSize(String shape) throws Exception;
	public List<ProductVO> listType(String type) throws Exception;
	public List<ProductVO> sizePage(ProductCriteria pcri) throws Exception;
	public int sizeCount(String shape) throws Exception;
	public List<ProductVO> listPage(ProductCriteria pcri) throws Exception;
	public int listCount(String type) throws Exception;
	public List<ProductVO> searchPage(ProductCriteria pcri) throws Exception;
	public int searchCount(String keyword) throws Exception; 
	public ProductVO read(int pno) throws Exception;
	public List<ProductVO> indexPro() throws Exception;
	public List<ProductVO> delete(int pno) throws Exception; 
	public void update(ProductVO productVO) throws Exception;
	public void updateFile(Map<String, Object> map) throws Exception;
	public List<Map<String, Object>> selectFileList(int pno) throws Exception;

}
