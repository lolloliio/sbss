package com.sbss.crm.program.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sbss.crm.program.model.ProgramParam;
import com.sbss.crm.program.model.ProgramVO;

@Repository
public class ProgramDaoImpl implements ProgramDao {

    @Autowired
    protected SqlSessionTemplate sqlSession;
    
    @Override
    public List<ProgramVO> selectProgramList(ProgramParam param) {
    	return sqlSession.selectList("Program.selectProgramList", param);
    }
    
    @Override
    public int selectProgramTotalCount(ProgramParam param) {
    	return sqlSession.selectOne("Program.selectProgramTotalCount", param);
    }
    
    @Override
    public List<ProgramVO> selectProgramCodeList(ProgramParam param) {
    	return sqlSession.selectList("Program.selectProgramCodeList", param);
    }

    @Override
	public int insertProgramInformation(ProgramVO vo) {
		return sqlSession.insert("Program.insertProgramInformation", vo);
	}

	@Override
	public int updateProgramInformation(ProgramVO vo) {
		return sqlSession.update("Program.updateProgramInformation", vo);
	}

}
