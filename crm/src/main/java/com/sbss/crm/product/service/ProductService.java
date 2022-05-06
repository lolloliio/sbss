package com.sbss.crm.product.service;

import com.sbss.crm.common.model.ResultVO;
import com.sbss.crm.common.model.WrapperVO;
import com.sbss.crm.product.model.ProductParam;
import com.sbss.crm.product.model.ProductVO;

public interface ProductService {

	/**
	 * 상품관리 목록 조회
	 * @param param
	 * @return
	 */
	public WrapperVO selectProductList(ProductParam param);
	
	/**
	 * 상품관리 정보 저장
	 * @param vo
	 * @return
	 */
	public ResultVO insertProductInformation(ProductVO vo);
	
	/**
	 * 상품관리 정보 수정
	 * @param vo
	 * @return
	 */
	public ResultVO updateProductInformation(ProductVO vo);
	
}
