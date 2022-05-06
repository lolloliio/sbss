package com.sbss.crm.point.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.base.CaseFormat;
import com.sbss.crm.common.model.ResultVO;
import com.sbss.crm.common.model.WrapperVO;
import com.sbss.crm.point.dao.PointDao;
import com.sbss.crm.point.model.PointHistoryParam;
import com.sbss.crm.point.model.PointHistoryVO;
import com.sbss.crm.point.model.PointParam;
import com.sbss.crm.point.model.PointVO;

@Service
public class PointServiceImpl implements PointService {

	private static final Logger logger = LoggerFactory.getLogger(PointServiceImpl.class);
	
	@Autowired
	PointDao pointDao;
		
	@Override 
	public WrapperVO selectPointList(PointParam param) {
		
		// 컬럼 번호를 컬럼명으로 변경
		if (!param.getOrder().isEmpty()) {
			for (int i = 0; i < param.getOrder().size(); i++) {
				int columnNum = param.getOrder().get(i).getColumn();
				String columnName = param.getColumns().get(columnNum).getData();
				String replaceColumnName = CaseFormat.UPPER_CAMEL.to(CaseFormat.LOWER_UNDERSCORE, columnName);
				param.getOrder().get(i).setColumnName(replaceColumnName);
			}
		}

		List<PointVO> list = pointDao.selectPointList(param);
		int totalCount = pointDao.selectPointTotalCount(param);

		WrapperVO wp = new WrapperVO();
		wp.setData(list);
		wp.setDraw(param.getDraw());
		wp.setRecordsTotal(totalCount);
		wp.setRecordsFiltered(totalCount);
		return wp;
	}
	
	@Override
	public PointVO selectPointInformation(PointParam param) {
		return pointDao.selectPointInformation(param);
	}
	
	@Override
	public WrapperVO selectPointHistoryList(PointHistoryParam param) {
		// 컬럼 번호를 컬럼명으로 변경
		if (!param.getOrder().isEmpty()) {
			for (int i = 0; i < param.getOrder().size(); i++) {
				int columnNum = param.getOrder().get(i).getColumn();
				String columnName = param.getColumns().get(columnNum).getData();
				String replaceColumnName = CaseFormat.UPPER_CAMEL.to(CaseFormat.LOWER_UNDERSCORE, columnName);
				param.getOrder().get(i).setColumnName(replaceColumnName);
			}
		}

		List<PointHistoryVO> list = pointDao.selectPointHistoryList(param);
		int totalCount = pointDao.selectPointHistoryTotalCount(param);

		WrapperVO wp = new WrapperVO();
		wp.setData(list);
		wp.setDraw(param.getDraw());
		wp.setRecordsTotal(totalCount);
		wp.setRecordsFiltered(totalCount);
		return wp;
	}

	@Override
	@Transactional
	public ResultVO insertPointInformation(PointHistoryVO vo) {
		ResultVO result = new ResultVO();
		try {
			
			//포인트 정보 조회
			PointParam pointParam = new PointParam();
			pointParam.setCustomerId(vo.getCustomerId());
			PointVO customerPointVO = pointDao.selectPointInformation(pointParam);
			
			int totalPoint = 0;
			PointVO pointVO = new PointVO();
			pointVO.setCustomerId(vo.getCustomerId());
			pointVO.setEmployeeId(vo.getEmployeeId());
			
			int pointId = 0;
			if(customerPointVO != null) {
				pointVO.setPointAmount(totalPoint + vo.getEarnPoint()); 
				pointDao.updatePointInformation(pointVO);
				pointId = vo.getPointId();
			} else {
				pointVO.setPointAmount(totalPoint + vo.getEarnPoint());
				pointId = pointDao.insertPointInformation(pointVO);
			}
						
			//히스토리 저장
			vo.setPointId(pointId);
			vo.setTotalPoint(totalPoint + vo.getEarnPoint());
			pointDao.insertPointHistoryInformation(vo);
			
			result.setResult("success");
		}catch(Exception e) {
			logger.info("insertPointInformation error : " + e);
			throw new RuntimeException(e);
		}
		return result; 
	}
	
}
