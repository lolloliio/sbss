package com.sbss.crm.product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sbss.crm.common.model.ResultVO;
import com.sbss.crm.common.model.WrapperVO;
import com.sbss.crm.commonCode.model.CommonCodeVO;
import com.sbss.crm.commonCode.service.CommonCodeService;
import com.sbss.crm.main.model.LoginVO;
import com.sbss.crm.product.model.ProductParam;
import com.sbss.crm.product.model.ProductVO;
import com.sbss.crm.product.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired
	ProductService productService;
	
	@Autowired
	CommonCodeService commonCodeService;
	
	/**
	 * 상품관리 화면 조회
	 * @param param
	 * @return
	 */
	@RequestMapping("/productList")
	public ModelAndView productList(ProductParam param) {
		ModelAndView mv = new ModelAndView("/product/productList");
		
		CommonCodeVO codeVO = new CommonCodeVO();
		codeVO.setGroupCodeId("PRODUCT_TYPE");
		List<CommonCodeVO> productTypeList = commonCodeService.selectCommonCodeList(codeVO);
		mv.addObject("productTypeList", productTypeList);
		return mv;
	}
	
	/**
	 * 상품관리 목록 조회
	 * @param param
	 * @return
	 */
	@RequestMapping("/selectProductList")
	@ResponseBody
	public WrapperVO selectProductList(@RequestBody ProductParam param) {
		LoginVO user = (LoginVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		param.setFranchiseeId(user.getFranchiseeId());
		return productService.selectProductList(param);
	}
	
	/**
	 * 상품관리 정보 저장
	 * @param vo
	 * @return
	 */
	@RequestMapping("/insertProductInformation")
	@ResponseBody
	public ResultVO insertProductInformation(ProductVO vo) {
		LoginVO user = (LoginVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		vo.setFranchiseeId(user.getFranchiseeId());		
		vo.setEmployeeId(user.getEmployeeId());
		return productService.insertProductInformation(vo);
	}
	
	/**
	 * 상품관리 정보 수정
	 * @param vo
	 * @return
	 */
	@RequestMapping("/updateProductInformation")
	@ResponseBody
	public ResultVO updateProductInformation(ProductVO vo) {
		LoginVO user = (LoginVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		vo.setFranchiseeId(user.getFranchiseeId());		
		vo.setEmployeeId(user.getEmployeeId());
		return productService.updateProductInformation(vo);
	}
	
}
