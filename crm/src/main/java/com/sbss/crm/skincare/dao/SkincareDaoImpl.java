package com.sbss.crm.skincare.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sbss.crm.common.model.WrapperVO;
import com.sbss.crm.skincare.model.SkincareDetailVO;
import com.sbss.crm.skincare.model.SkincareOptionVO;
import com.sbss.crm.skincare.model.SkincareParam;
import com.sbss.crm.skincare.model.SkincareVO;

@Repository
public class SkincareDaoImpl implements SkincareDao {

    @Autowired
    protected SqlSessionTemplate sqlSession;
	
	@Override
	public List<SkincareVO> selectSkincareList(SkincareParam param) {
		return sqlSession.selectList("Skincare.selectSkincareList", param);
	}
	
	@Override
	public int selectSkincareTotalCount(SkincareParam param) {
		return sqlSession.selectOne("Skincare.selectSkincareTotalCount", param);
	}

	@Override
	public SkincareVO selectSkincareInformation(SkincareParam param) {
		return sqlSession.selectOne("Skincare.selectSkincareInformation", param);
	}

	@Override
	public int insertSkincareInformation(SkincareVO vo) {
		sqlSession.insert("Skincare.insertSkincareInformation", vo);
		return vo.getSkincareId();
	}

	@Override
	public int updateSkincareInformation(SkincareVO vo) {
		return sqlSession.update("Skincare.updateSkincareInformation", vo);
	}

	@Override
	public int insertSkincareDetail(SkincareDetailVO detailVO) {
		sqlSession.insert("Skincare.insertSkincareDetail", detailVO);
		return detailVO.getSkincareDetailId();
	}

	@Override
	public int insertSkincareOption(SkincareOptionVO optionVO) {
		return sqlSession.insert("Skincare.insertSkincareOption", optionVO);
	}

}
