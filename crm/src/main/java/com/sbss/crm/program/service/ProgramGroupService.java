package com.sbss.crm.program.service;

import java.util.List;

import com.sbss.crm.common.model.ResultVO;
import com.sbss.crm.common.model.WrapperVO;
import com.sbss.crm.program.model.ProgramGroupParam;
import com.sbss.crm.program.model.ProgramGroupVO;

public interface ProgramGroupService {
	
	/**
	 * 프로그램 그룹  목록 조회
	 * @param param
	 * @return
	 */
	public WrapperVO selectProgramGroupList(ProgramGroupParam param);
	
	/**
	 * 프로그램 그룹 코드 목록 조회
	 * @param param
	 * @return
	 */
	public List<ProgramGroupVO> selectProgramGroupCodeList(ProgramGroupParam param);
	
	/**
	 * 프로그램 그룹 정보 저장
	 * @param vo
	 * @return
	 */
	public ResultVO insertProgramGroupInformation(ProgramGroupVO vo);
	
	/**
	 * 프로그램 그룹 정보 수정
	 * @param vo
	 * @return
	 */
	public ResultVO updateProgramGroupInformation(ProgramGroupVO vo);	

}
