package kr.co.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.dao.ProductDAO;
import kr.co.util.ProductFileUtils;
import kr.co.vo.CommentVO;
import kr.co.vo.ProductCriteria;
import kr.co.vo.ProductFileVO;
import kr.co.vo.ProductVO;

@Service
public class ProductServiceImpl implements ProductService{
	
	@Resource(name="productfileUtils")
	private ProductFileUtils fileUtils;
	
	@Inject
	private ProductDAO dao;
	
	@Override
	public void write(ProductVO productVO, MultipartHttpServletRequest mpRequest) throws Exception {
		
		dao.write(productVO);
		
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(productVO, mpRequest); 
		int size = list.size();
		for(int i=0; i<size; i++){ 
			dao.insertFile(list.get(i)); 
		}
		
	}
	
	@Override
	public List<ProductVO> listSize(String shape) throws Exception {
	
		return dao.listSize(shape);
	}
	
	@Override
	public List<ProductVO> listType(String type) throws Exception {
		
		return dao.listType(type);
	}
	
	@Override
	public List<ProductVO> sizePage(ProductCriteria pcri) throws Exception {
		
		return dao.sizePage(pcri);
	}
	
	@Override
	public int sizeCount(String shape) throws Exception {
		
		return dao.sizeCount(shape);
	}
	
	@Override
	public List<ProductVO> listPage(ProductCriteria pcri) throws Exception {
		
		return dao.listPage(pcri);
	}
	
	@Override
	public int listCount(String type) throws Exception {
		
		return dao.listCount(type);
	}
	
	@Override
	public List<ProductVO> searchPage(ProductCriteria pcri) throws Exception {
		// TODO Auto-generated method stub
		return dao.searchPage(pcri);
	}
	
	@Override
	public int searchCount(String keyword) throws Exception {
		// TODO Auto-generated method stub
		return dao.searchCount(keyword);
	}
	
	
	@Override
	public ProductVO read(int pno) throws Exception {
		
		return dao.read(pno);
	}
	
	@Override
	public List<ProductFileVO> selectFile(int pno) throws Exception {
		
		return dao.selectFile(pno);
	}
	
	@Override
	public List<ProductVO> indexPro() throws Exception {
		
		return dao.indexPro();
	}
	
	@Override
	public void delete(int pno) throws Exception {
		
		dao.delete(pno);
	}
	
	@Override
	public List<Map<String, Object>> selectFileList(int pno) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectFileList(pno);
	}
	
	@Override
	public void update(ProductVO porductVO, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception {
		
		dao.update(porductVO);
		
		List<Map<String, Object>> list = fileUtils.parseUpdateFileInfo(porductVO, files, fileNames, mpRequest);
		Map<String, Object> tempMap = null;
		int size = list.size();
		for(int i = 0; i<size; i++) {
			tempMap = list.get(i);
			if(tempMap.get("IS_NEW").equals("Y")) {
				dao.insertFile(tempMap);
			}else {
				dao.updateFile(tempMap);
			}
		}
	}
	
}
