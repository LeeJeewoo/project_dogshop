package kr.co.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.vo.ProductCriteria;
import kr.co.vo.ProductFileVO;
import kr.co.vo.ProductVO;

public interface ProductService {

	public void write(ProductVO productVO, MultipartHttpServletRequest mpRequest) throws Exception;
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
	public void delete(int pno) throws Exception;
	public void update(ProductVO productVO, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception;
	public List<Map<String, Object>> selectFileList(int pno) throws Exception;
	
}
