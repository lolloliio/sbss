package com.sbss.crm.program.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.common.base.CaseFormat;
import com.sbss.crm.common.model.ResultVO;
import com.sbss.crm.common.model.WrapperVO;
import com.sbss.crm.program.dao.ProgramDao;
import com.sbss.crm.program.model.ProgramParam;
import com.sbss.crm.program.model.ProgramVO;

@Service
public class ProgramServiceImpl implements ProgramService {
	
	private static final Logger logger = LoggerFactory.getLogger(ProgramServiceImpl.class);

	@Autowired
	ProgramDao programDao;
	
	@Override
	public WrapperVO selectProgramList(ProgramParam param) {
		
		// 컬럼 번호를 컬럼명으로 변경
		if (!param.getOrder().isEmpty()) {
			for (int i = 0; i < param.getOrder().size(); i++) {
				int columnNum = param.getOrder().get(i).getColumn();
				String columnName = param.getColumns().get(columnNum).getData();
				String replaceColumnName = CaseFormat.UPPER_CAMEL.to(CaseFormat.LOWER_UNDERSCORE, columnName);
				param.getOrder().get(i).setColumnName(replaceColumnName);
			}
		}

		List<ProgramVO> list = programDao.selectProgramList(param);
		int totalCount = programDao.selectProgramTotalCount(param);

		WrapperVO wp = new WrapperVO();
		wp.setData(list);
		wp.setDraw(param.getDraw());
		wp.setRecordsTotal(totalCount);
		wp.setRecordsFiltered(totalCount);
		return wp;		
	}
	
	@Override
	public List<ProgramVO> selectProgramCodeList(ProgramParam param) {
		return programDao.selectProgramCodeList(param);
	}
	
	@Override
	public ResultVO insertProgramInformation(ProgramVO vo) {		
		ResultVO result = new ResultVO();		
		try {
			programDao.insertProgramInformation(vo);
			result.setResult("success");
		}catch(Exception e) {
			logger.info("insertProgramInformation error : " + e);
			throw new RuntimeException(e);
		}		
		return result;
	}

	@Override
	public ResultVO updateProgramInformation(ProgramVO vo) {
		ResultVO result = new ResultVO();		
		try {
			programDao.updateProgramInformation(vo);
			result.setResult("success");
		}catch(Exception e) {
			logger.info("updateProgramInformation error : " + e);
			throw new RuntimeException(e);
		}		
		return result;
	}

}
