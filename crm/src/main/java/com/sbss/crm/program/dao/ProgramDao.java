package com.sbss.crm.program.dao;

import java.util.List;

import com.sbss.crm.program.model.ProgramParam;
import com.sbss.crm.program.model.ProgramVO;

public interface ProgramDao {
	
	/**
	 * 프로그램 목록 조회
	 * @param param
	 * @return
	 */
	public List<ProgramVO> selectProgramList(ProgramParam param);
	
	/**
	 * 프로그램 전체 개수 조회
	 * @param param
	 * @return
	 */
	public int selectProgramTotalCount(ProgramParam param);
	
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
	public int insertProgramInformation(ProgramVO vo);
	
	/**
	 * 프로그램 정보 수정
	 * @param vo
	 * @return
	 */
	public int updateProgramInformation(ProgramVO vo);

}
