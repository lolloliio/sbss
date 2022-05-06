package com.sbss.crm.program.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.common.base.CaseFormat;
import com.sbss.crm.common.model.ResultVO;
import com.sbss.crm.common.model.WrapperVO;
import com.sbss.crm.program.dao.ProgramGroupDao;
import com.sbss.crm.program.model.ProgramGroupParam;
import com.sbss.crm.program.model.ProgramGroupVO;

@Service
public class ProgramGroupServiceImpl implements ProgramGroupService {

	private static final Logger logger = LoggerFactory.getLogger(ProgramGroupServiceImpl.class);
	
	@Autowired
	ProgramGroupDao programGroupDao;

	@Override
	public WrapperVO selectProgramGroupList(ProgramGroupParam param) {
		// 컬럼 번호를 컬럼명으로 변경
		if (!param.getOrder().isEmpty()) {
			for (int i = 0; i < param.getOrder().size(); i++) {
				int columnNum = param.getOrder().get(i).getColumn();
				String columnName = param.getColumns().get(columnNum).getData();
				String replaceColumnName = CaseFormat.UPPER_CAMEL.to(CaseFormat.LOWER_UNDERSCORE, columnName);
				param.getOrder().get(i).setColumnName(replaceColumnName);
			}
		}

		List<ProgramGroupVO> list = programGroupDao.selectProgramGroupList(param);
		int totalCount = programGroupDao.selectProgramGroupTotalCount(param);

		WrapperVO wp = new WrapperVO();
		wp.setData(list);
		wp.setDraw(param.getDraw());
		wp.setRecordsTotal(totalCount);
		wp.setRecordsFiltered(totalCount);
		return wp;
	}

	@Override
	public List<ProgramGroupVO> selectProgramGroupCodeList(ProgramGroupParam param) {
		return programGroupDao.selectProgramGroupCodeList(param);
	}

	@Override
	public ResultVO insertProgramGroupInformation(ProgramGroupVO vo) {
		ResultVO result = new ResultVO();
		try {
			programGroupDao.insertProgramGroupInformation(vo);
			result.setResult("success");
		}catch(Exception e) {
			logger.info("updateProgramGroupInformation error : " + e);
			throw new RuntimeException(e);
		}
		return result; 
	}

	@Override
	public ResultVO updateProgramGroupInformation(ProgramGroupVO vo) {
		ResultVO result = new ResultVO();
		try {
			programGroupDao.updateProgramGroupInformation(vo);
			result.setResult("success");
		}catch(Exception e) {
			logger.info("updateProgramGroupInformation error : " + e);
			throw new RuntimeException(e);
		}
		return result;
	}
	
}
