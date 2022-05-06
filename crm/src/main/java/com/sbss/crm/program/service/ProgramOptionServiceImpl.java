package com.sbss.crm.program.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.common.base.CaseFormat;
import com.sbss.crm.common.model.ResultVO;
import com.sbss.crm.common.model.WrapperVO;
import com.sbss.crm.program.dao.ProgramOptionDao;
import com.sbss.crm.program.model.ProgramOptionParam;
import com.sbss.crm.program.model.ProgramOptionVO;

@Service
public class ProgramOptionServiceImpl implements ProgramOptionService {
	
	private static final Logger logger = LoggerFactory.getLogger(ProgramOptionServiceImpl.class);

	@Autowired
	ProgramOptionDao programOptionDao;
	
	@Override
	public WrapperVO selectProgramOptionList(ProgramOptionParam param) {
		
		// 컬럼 번호를 컬럼명으로 변경
		if (!param.getOrder().isEmpty()) {
			for (int i = 0; i < param.getOrder().size(); i++) {
				int columnNum = param.getOrder().get(i).getColumn();
				String columnName = param.getColumns().get(columnNum).getData();
				String replaceColumnName = CaseFormat.UPPER_CAMEL.to(CaseFormat.LOWER_UNDERSCORE, columnName);
				param.getOrder().get(i).setColumnName(replaceColumnName);
			}
		}

		List<ProgramOptionVO> list = programOptionDao.selectProgramOptionList(param);
		int totalCount = programOptionDao.selectProgramOptionTotalCount(param);

		WrapperVO wp = new WrapperVO();
		wp.setData(list);
		wp.setDraw(param.getDraw());
		wp.setRecordsTotal(totalCount);
		wp.setRecordsFiltered(totalCount);
		return wp;
	}

	@Override
	public List<ProgramOptionVO> selectProgramOptionCodeList(ProgramOptionParam param) {
		return programOptionDao.selectProgramOptionCodeList(param);
	}

	@Override
	public ResultVO insertProgramOptionInformation(ProgramOptionVO vo) {
		ResultVO result = new ResultVO();
		try {
			programOptionDao.insertProgramOptionInformation(vo);
			result.setResult("success");			
		}catch(Exception e) {
			logger.info("insertProgramOptionInformation error : " + e);
			throw new RuntimeException(e);
		}
		return result;
	}

	@Override
	public ResultVO updateProgramOptionInformation(ProgramOptionVO vo) {
		ResultVO result = new ResultVO();
		try {
			programOptionDao.updateProgramOptionInformation(vo);
			result.setResult("success");			
		}catch(Exception e) {
			logger.info("updateProgramGroupInformation error : " + e);
			throw new RuntimeException(e);
		}
		return result;
	}

}
