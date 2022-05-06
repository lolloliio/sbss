package com.sbss.crm.product.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.common.base.CaseFormat;
import com.sbss.crm.common.model.ResultVO;
import com.sbss.crm.common.model.WrapperVO;
import com.sbss.crm.product.dao.ProductDao;
import com.sbss.crm.product.model.ProductParam;
import com.sbss.crm.product.model.ProductVO;

@Service
public class ProductServiceImpl implements ProductService {

	private static final Logger logger = LoggerFactory.getLogger(ProductServiceImpl.class);
	
	@Autowired
	ProductDao productDao;
	
	@Override
	public WrapperVO selectProductList(ProductParam param) {
		// 컬럼 번호를 컬럼명으로 변경
		if (!param.getOrder().isEmpty()) {
			for (int i = 0; i < param.getOrder().size(); i++) {
				int columnNum = param.getOrder().get(i).getColumn();
				String columnName = param.getColumns().get(columnNum).getData();
				String replaceColumnName = CaseFormat.UPPER_CAMEL.to(CaseFormat.LOWER_UNDERSCORE, columnName);
				param.getOrder().get(i).setColumnName(replaceColumnName);
			}
		}

		List<ProductVO> list = productDao.selectProductList(param);
		int totalCount = productDao.selectProductTotalCount(param);

		WrapperVO wp = new WrapperVO();
		wp.setData(list);
		wp.setDraw(param.getDraw());
		wp.setRecordsTotal(totalCount);
		wp.setRecordsFiltered(totalCount);
		return wp;
	}

	@Override
	public ResultVO insertProductInformation(ProductVO vo) {
		ResultVO result = new ResultVO();
		try {
			productDao.insertProductInformation(vo);
			result.setResult("success");
		}catch(Exception e) {
			logger.info("insertProductInformation error : " + e);
			throw new RuntimeException(e);
		}
		return result;
	}

	@Override
	public ResultVO updateProductInformation(ProductVO vo) {
		ResultVO result = new ResultVO();
		try {
			productDao.updateProductInformation(vo);
			result.setResult("success");
		}catch(Exception e) {
			logger.info("updateProductInformation error : " + e);
			throw new RuntimeException(e);
		}
		return result;
	}

}
