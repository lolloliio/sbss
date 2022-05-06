package com.sbss.crm.program.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sbss.crm.program.model.ProgramOptionParam;
import com.sbss.crm.program.model.ProgramOptionVO;

@Repository
public class ProgramOptionDaoImpl implements ProgramOptionDao {

    @Autowired
    protected SqlSessionTemplate sqlSession;
	
	@Override
	public List<ProgramOptionVO> selectProgramOptionList(ProgramOptionParam param) {
		return sqlSession.selectList("ProgramOption.selectProgramOptionList", param);
	}

	@Override
	public int selectProgramOptionTotalCount(ProgramOptionParam param) {
		return sqlSession.selectOne("ProgramOption.selectProgramOptionTotalCount", param);
	}
	
	@Override
	public List<ProgramOptionVO> selectProgramOptionCodeList(ProgramOptionParam param) {
		return sqlSession.selectList("ProgramOption.selectProgramOptionCodeList", param);
	}

	@Override
	public int insertProgramOptionInformation(ProgramOptionVO vo) {
		return sqlSession.insert("ProgramOption.insertProgramOptionInformation", vo);
	}

	@Override
	public int updateProgramOptionInformation(ProgramOptionVO vo) {
		return sqlSession.update("ProgramOption.updateProgramOptionInformation", vo);
	}

}
