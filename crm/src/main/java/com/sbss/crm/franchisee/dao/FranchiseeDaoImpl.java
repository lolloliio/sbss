package com.sbss.crm.franchisee.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sbss.crm.franchisee.model.FranchiseeParam;
import com.sbss.crm.franchisee.model.FranchiseeVO;

@Repository
public class FranchiseeDaoImpl implements FranchiseeDao {

    @Autowired
    protected SqlSessionTemplate sqlSession;

	@Override
	public List<FranchiseeVO> selectFranchiseeList(FranchiseeParam param) {
		return sqlSession.selectList("Franchisee.selectFranchiseeList", param);
	}
	
	@Override
	public int selectFranchiseeTotalCount(FranchiseeParam param) {
		return sqlSession.selectOne("Franchisee.selectFranchiseeTotalCount", param);
	}

	@Override
	public FranchiseeVO selectFranchiseeInformation(FranchiseeParam param) {
		return sqlSession.selectOne("Franchisee.selectFranchiseeInformation", param);
	}

	@Override
	public int insertFranchiseeInformation(FranchiseeVO vo) {
		return sqlSession.insert("Franchisee.insertFranchiseeInformation", vo);
	}

	@Override
	public int updateFranchiseeInformation(FranchiseeVO vo) {
		return sqlSession.update("Franchisee.updateFranchiseeInformation", vo);
	}
	
}
