package com.sbss.crm.product.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sbss.crm.product.model.ProductParam;
import com.sbss.crm.product.model.ProductVO;

@Repository
public class ProductDaoImpl implements ProductDao {

    @Autowired
    protected SqlSessionTemplate sqlSession;
	
	@Override
	public List<ProductVO> selectProductList(ProductParam param) {
		return sqlSession.selectList("Product.selectProductList", param);
	}

	@Override
	public int selectProductTotalCount(ProductParam param) {
		return sqlSession.selectOne("Product.selectProductTotalCount", param);
	}

	@Override
	public int insertProductInformation(ProductVO vo) {
		return sqlSession.insert("Product.insertProductInformation", vo);
	}

	@Override
	public int updateProductInformation(ProductVO vo) {
		return sqlSession.update("Product.updateProductInformation", vo);
	}

}
