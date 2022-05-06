package com.sbss.crm.point.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sbss.crm.point.model.PointHistoryParam;
import com.sbss.crm.point.model.PointHistoryVO;
import com.sbss.crm.point.model.PointParam;
import com.sbss.crm.point.model.PointVO;

@Repository
public class PointDaoImpl implements PointDao {
	
    @Autowired
    protected SqlSessionTemplate sqlSession;
    
    @Override
    public List<PointVO> selectPointList(PointParam param) {
    	return sqlSession.selectList("Point.selectPointList", param);
    }
    
    @Override
    public int selectPointTotalCount(PointParam param) {
    	return sqlSession.selectOne("Point.selectPointTotalCount", param);
    }

    @Override
    public PointVO selectPointInformation(PointParam param) {
    	return sqlSession.selectOne("Point.selectPointInformation", param);
    }

    @Override
    public int insertPointInformation(PointVO vo) {
    	sqlSession.insert("Point.insertPointInformation", vo);
    	return vo.getPointId();
    }
    
    @Override
    public int updatePointInformation(PointVO vo) {
    	return sqlSession.update("Point.updatePointInformation", vo);
    }

	@Override
	public List<PointHistoryVO> selectPointHistoryList(PointHistoryParam param) {
		return sqlSession.selectList("Point.selectPointHistoryList", param);
	}
	
	@Override
	public int selectPointHistoryTotalCount(PointHistoryParam param) {
		return sqlSession.selectOne("Point.selectPointHistoryTotalCount", param);
	}	
	
	@Override
	public int insertPointHistoryInformation(PointHistoryVO vo) {
		return sqlSession.insert("Point.insertPointHistoryInformation", vo);
	}
    
}
