package com.today.bab.onedayclass.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.today.bab.admin.model.vo.AdminMaster;
import com.today.bab.onedayclass.model.vo.OdcQa;
import com.today.bab.onedayclass.model.vo.OdcQaRe;
import com.today.bab.onedayclass.model.vo.OdcReserve;
import com.today.bab.onedayclass.model.vo.OdcReview;
import com.today.bab.onedayclass.model.vo.OneDayClass;

@Repository
public class OneDayDaoImpl implements OneDayDao {

	@Override
	public List<OneDayClass> selectClassList(SqlSessionTemplate session, Map<String, Integer> param) {
		
		return session.selectList("onedayclass.selectClassList",null, 
	            new RowBounds(
	            		(param.get("cPage")-1)*param.get("numPerpage"),
	                  param.get("numPerpage")
	                  )
	            );
	}
	
	

	@Override
	public int countClasslist(SqlSessionTemplate session) {
		return session.selectOne("onedayclass.countClasslist");
	}

	@Override
	public List<OneDayClass> selectMenuClassList(SqlSessionTemplate session, Map<String, Object> param) {
		
		int cPage = (int)(param.get("cPage"))-1;
		int numPerpage = (int)(param.get("numPerpage"));
		
		return session.selectList("onedayclass.selectMenuClassList",param,
				new RowBounds(
	            		(cPage)*numPerpage,
	            		numPerpage
	                  )
				);
	}

	@Override
	public List<OneDayClass> selectSearchClass(SqlSessionTemplate session, Map<String, Object> param ) {
		
		int cPage = (int)(param.get("cPage"))-1;
		int numPerpage = (int)(param.get("numPerpage"));
		
		return session.selectList("onedayclass.selectSearchClass", param, 
				new RowBounds(
	            		(cPage)*numPerpage,
	            		numPerpage
	                  )
			);

	}
	
	@Override
	public int searchCountClasslist(SqlSessionTemplate session, Map param) {
		return session.selectOne("onedayclass.searchCountClasslist", param);
	}

	@Override
	public int masterEndEnroll(SqlSessionTemplate session, AdminMaster m) {
		return session.insert("onedayclass.masterEndEnroll", m);
	}

	@Override
	public AdminMaster selectMastserById(SqlSessionTemplate session, String memberId) {
		return session.selectOne("onedayclass.selectMastserById", memberId);
	}

	@Override
	public int endclassEnroll(SqlSessionTemplate session, OneDayClass odc) {
		return session.insert("onedayclass.endclassEnroll", odc);
	}

	@Override
	public int updateClass(SqlSessionTemplate session, OneDayClass odc) {
		return session.update("onedayclass.updateClass", odc);
	}



	@Override
	public OneDayClass odcView(SqlSessionTemplate session, String no) {
		return session.selectOne("onedayclass.odcView", no);
	}

	@Override
	public void inputOdcQa(SqlSessionTemplate session, OdcQa oq) {
		session.insert("onedayclass.inputOdcQa",oq);
	}

	@Override
	public List<OdcQa> selectOdcQaAll(SqlSessionTemplate session, int odcNo) {
		return session.selectList("onedayclass.selectOdcQaAll", odcNo);
	}

	@Override
	public void inputReplayOdcQa(SqlSessionTemplate session, OdcQaRe oqr) {
		session.insert("onedayclass.inputReplayOdcQa",oqr);
	}

	@Override
	public List<OdcQaRe> selectReOdcQaAll(SqlSessionTemplate session, int oqNo) {
		return session.selectList("onedayclass.selectReOdcQaAll", oqNo);
	}

	@Override
	public List<OdcReserve> selectReserve(SqlSessionTemplate session, Map param) {
		return session.selectList("onedayclass.selectReserve", param);
	}

	@Override
	public List<OdcReview> selectReview(SqlSessionTemplate session, int no) {
		return session.selectList("onedayclass.selectReview",no);
	}

	@Override
	public List<OdcReserve> selectNoReviewReserve(SqlSessionTemplate session, int no2) {
		return session.selectList("onedayclass.selectNoReviewReserve",no2);
	}

	@Override
	public int insertReview(SqlSessionTemplate session, OdcReview or) {
		return session.insert("onedayclass.insertReview",or);
	}
	
	
	@Override
	public List<OdcReview> selectReviewByodcNo(SqlSessionTemplate session, int odcNo) {
		return session.selectList("onedayclass.selectReviewByodcNo",odcNo);
	}

	@Override
	public int countPerson(SqlSessionTemplate session, Map param) {
		return session.selectOne("onedayclass.countPerson", param);
	}

	@Override
	public int inputReservation(SqlSessionTemplate session, Map param) {
		return session.insert("onedayclass.inputReservation", param);
	}

	@Override
	public List<OdcReview> selectReviewById(SqlSessionTemplate session, OdcReview or) {
		return session.selectList("onedayclass.selectReviewById", or);
	}

	@Override
	public List<OdcQa> selectQnaById(SqlSessionTemplate session, OdcQa oq) {
		return session.selectList("onedayclass.selectQnaById", oq);
	}
	@Override
	public List<OdcQa> selectNoQna(SqlSessionTemplate session, int no) {
		return session.selectList("onedayclass.selectNoQna", no);
	}

	@Override
	public int countMenuClassList(SqlSessionTemplate session, String type) {
		return session.selectOne("onedayclass.countMenuClassList", type);
	}



	@Override
	public OdcReview selectReviewByodreNo(SqlSessionTemplate session, int no) {
		return session.selectOne("onedayclass.selectReviewByodreNo", no);
	}

	@Override
	public OdcReserve selectReservebyodreNo(SqlSessionTemplate session, int no) {
		return session.selectOne("onedayclass.selectReservebyodreNo", no);
	}



	@Override
	public int updateReview(SqlSessionTemplate session, OdcReview or) {
		return session.insert("onedayclass.updateReview", or);
	}



	@Override
	public void deleteOdcQa(SqlSessionTemplate session, String oqno) {
		session.delete("onedayclass.deleteOdcQa", oqno);	
	}



	@Override
	public void deleteReOdcQa(SqlSessionTemplate session, String oqrNo) {
		session.delete("onedayclass.deleteReOdcQa", oqrNo);
	}



	@Override
	public OdcQa selectOqbyOqNo(SqlSessionTemplate session, int oqno) {
		return session.selectOne("onedayclass.selectOqbyOqNo", oqno);
	}

	@Override
	public void updateOq(SqlSessionTemplate session, OdcQa oq) {
		session.update("onedayclass.updateOq", oq);
		
	}
	
	

}
