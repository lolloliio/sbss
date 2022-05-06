package com.sbss.crm.program.service;

import java.util.List;

import com.sbss.crm.common.model.ResultVO;
import com.sbss.crm.common.model.WrapperVO;
import com.sbss.crm.program.model.ProgramParam;
import com.sbss.crm.program.model.ProgramVO;

public interface ProgramService {
	
	/**
	 * 프로그램 목록 조회
	 * @param param
	 * @return
	 */
	public WrapperVO selectProgramList(ProgramParam param);	
	
	/**
	 * 프로그램 코드 목록 조회
	 * @param param
	 * @return
	 */
	public List<ProgramVO> selectProgramCodeList(ProgramParam param);
	
	/**
	 * 프로그램 정보 저장
	 * @param vo
	 * @return
	 */
	public ResultVO insertProgramInformation(ProgramVO vo);
	
	/**
	 * 프로그램 정보 수정
	 * @param vo
	 * @return
	 */
	public ResultVO updateProgramInformation(ProgramVO vo);

}
