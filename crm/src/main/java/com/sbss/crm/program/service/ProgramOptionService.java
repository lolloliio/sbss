package com.sbss.crm.program.service;

import java.util.List;

import com.sbss.crm.common.model.ResultVO;
import com.sbss.crm.common.model.WrapperVO;
import com.sbss.crm.program.model.ProgramOptionParam;
import com.sbss.crm.program.model.ProgramOptionVO;

public interface ProgramOptionService {

	/**
	 * 프로그램 옵션 목록 조회
	 * @param param
	 * @return
	 */
	public WrapperVO selectProgramOptionList(ProgramOptionParam param);	
	
	/**
	 * 프로그램 옵션 목록 조회(코드용)
	 * @param param
	 * @return
	 */
	public List<ProgramOptionVO> selectProgramOptionCodeList(ProgramOptionParam param);
	
	/**
	 * 프로그램 옵션 정보 저장
	 * @param vo
	 * @return
	 */
	public ResultVO insertProgramOptionInformation(ProgramOptionVO vo);
	
	/**
	 * 프로그램 옵션 정보 수정
	 * @param vo
	 * @return
	 */
	public ResultVO updateProgramOptionInformation(ProgramOptionVO vo);
	
}
