package com.sbss.crm.program.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sbss.crm.program.model.ProgramGroupParam;
import com.sbss.crm.program.model.ProgramGroupVO;

@Repository
public class ProgramGroupDaoImpl implements ProgramGroupDao {

    @Autowired
    protected SqlSessionTemplate sqlSession;

	@Override
	public List<ProgramGroupVO> selectProgramGroupList(ProgramGroupParam param) {
		return sqlSession.selectList("ProgramGroup.selectProgramGroupList", param);
	}
	
	@Override
	public List<ProgramGroupVO> selectProgramGroupCodeList(ProgramGroupParam param) {
		return sqlSession.selectList("ProgramGroup.selectProgramGroupCodeList", param);
	}

	@Override
	public int selectProgramGroupTotalCount(ProgramGroupParam param) {
		return sqlSession.selectOne("ProgramGroup.selectProgramGroupTotalCount", param);
	}

	@Override
	public int insertProgramGroupInformation(ProgramGroupVO vo) {
		return sqlSession.insert("ProgramGroup.insertProgramGroupInformation", vo);
	}

	@Override
	public int updateProgramGroupInformation(ProgramGroupVO vo) {
		return sqlSession.update("ProgramGroup.updateProgramGroupInformation", vo);
	}
	
    
    
}
