package com.sbss.crm.program.dao;

import java.util.List;

import com.sbss.crm.program.model.ProgramGroupParam;
import com.sbss.crm.program.model.ProgramGroupVO;

public interface ProgramGroupDao {
	
	/**
	 * 프로그램 그룹 목록 조회
	 * @param param
	 * @return
	 */
	public List<ProgramGroupVO> selectProgramGroupList(ProgramGroupParam param);

	/**
	 * 프로그램 그룹 코드 목록 조회
	 * @param param
	 * @return
	 */
	public List<ProgramGroupVO> selectProgramGroupCodeList(ProgramGroupParam param);
	
	/**
	 * 프로그램 그룹 전체 개수 조회
	 * @param param
	 * @return
	 */
	public int selectProgramGroupTotalCount(ProgramGroupParam param);
	
	/**
	 * 프로그램 그룹 정보 저장
	 * @param vo
	 * @return
	 */
	public int insertProgramGroupInformation(ProgramGroupVO vo);
	
	/**
	 * 프로그램 그룹 정보 수정
	 * @param vo
	 * @return
	 */
	public int updateProgramGroupInformation(ProgramGroupVO vo);

}
