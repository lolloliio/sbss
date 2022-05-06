package com.sbss.crm.giftcard.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sbss.crm.giftcard.model.GiftcardHistoryParam;
import com.sbss.crm.giftcard.model.GiftcardHistoryVO;
import com.sbss.crm.giftcard.model.GiftcardParam;
import com.sbss.crm.giftcard.model.GiftcardVO;

@Repository
public class GiftcardDaoImpl implements GiftcardDao {

    @Autowired
    protected SqlSessionTemplate sqlSession;
	
	@Override
	public List<GiftcardVO> selectGiftcardList(GiftcardParam param) {
		return sqlSession.selectList("Giftcard.selectGiftcardList", param);
	}

	@Override
	public int selectGiftcardTotalCount(GiftcardParam param) {
		return sqlSession.selectOne("Giftcard.selectGiftcardTotalCount", param);
	}

	@Override
	public GiftcardVO selectGiftcardInformation(GiftcardParam param) {
		return sqlSession.selectOne("Giftcard.selectGiftcardInformation", param);
	}

	@Override
	public int insertGiftcardInformation(GiftcardVO vo) {
		sqlSession.insert("Giftcard.insertGiftcardInformation", vo);
		return vo.getGiftcardId();
	}
	
	@Override
	public int updateGiftcardInformation(GiftcardVO vo) {
		return sqlSession.update("Giftcard.updateGiftcardInformation", vo);
	}

	@Override
	public List<GiftcardHistoryVO> selectGiftcardHistoryList(GiftcardHistoryParam param) {
		return sqlSession.selectList("Giftcard.selectGiftcardHistoryList", param);
	}

	@Override
	public int selectGiftcardHistoryTotalCount(GiftcardHistoryParam param) {
		return sqlSession.selectOne("Giftcard.selectGiftcardHistoryTotalCount", param);
	}

	@Override
	public int insertGiftcardHistoryInformation(GiftcardHistoryVO vo) {
		return sqlSession.insert("Giftcard.insertGiftcardHistoryInformation", vo);
	}



}
