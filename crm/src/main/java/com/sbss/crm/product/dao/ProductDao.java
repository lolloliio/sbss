package com.sbss.crm.product.dao;

import java.util.List;

import com.sbss.crm.product.model.ProductParam;
import com.sbss.crm.product.model.ProductVO;

public interface ProductDao {
	
	/**
	 * 상품관리 목록 조회
	 * @param param
	 * @return
	 */
	public List<ProductVO> selectProductList(ProductParam param);
	
	/**
	 * 상품관리 전체 개수 조회
	 * @param param
	 * @return
	 */
	public int selectProductTotalCount(ProductParam param);
	
	/**
	 * 상품관리 정보 저장
	 * @param vo
	 * @return
	 */
	public int insertProductInformation(ProductVO vo);
	
	/**
	 * 상품관리 정보 수정
	 * @param vo
	 * @return
	 */
	public int updateProductInformation(ProductVO vo);

}
