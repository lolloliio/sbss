package com.sbss.crm.program.dao;

import java.util.List;

import com.sbss.crm.program.model.ProgramOptionParam;
import com.sbss.crm.program.model.ProgramOptionVO;

public interface ProgramOptionDao {
	
	/**
	 * 프로그램 옵션 목록 조회
	 * @param param
	 * @return
	 */
	public List<ProgramOptionVO> selectProgramOptionList(ProgramOptionParam param);

	/**
	 * 프로그램 옵션 전체 개수 조회
	 * @param param
	 * @return
	 */
	public int selectProgramOptionTotalCount(ProgramOptionParam param);
	
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
	public int insertProgramOptionInformation(ProgramOptionVO vo);
	
	/**
	 * 프로그램 옵션 정보 수정
	 * @param vo
	 * @return
	 */
	public int updateProgramOptionInformation(ProgramOptionVO vo);
}
