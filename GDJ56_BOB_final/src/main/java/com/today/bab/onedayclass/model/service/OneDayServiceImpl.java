package com.today.bab.onedayclass.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.today.bab.admin.model.vo.AdminMaster;
import com.today.bab.onedayclass.model.dao.OneDayDao;
import com.today.bab.onedayclass.model.vo.OdcQa;
import com.today.bab.onedayclass.model.vo.OdcQaRe;
import com.today.bab.onedayclass.model.vo.OdcReserve;
import com.today.bab.onedayclass.model.vo.OdcReview;
import com.today.bab.onedayclass.model.vo.OneDayClass;

@Service
public class OneDayServiceImpl implements OneDayService {

	private SqlSessionTemplate session;
	private OneDayDao dao;
	
	@Autowired
	public OneDayServiceImpl(SqlSessionTemplate session,OneDayDao dao) {
		this.session = session;
		this.dao = dao;
	}

	@Override
	public List<OneDayClass> selectClassList(Map<String, Integer> param) {
		return dao.selectClassList(session,param);
	}
	
	@Override
	public int countClasslist() {
		return dao.countClasslist(session);
	}
	
	@Override
	public int searchCountClasslist(Map param) {
		return dao.countClasslist(session);
	}

	@Override
	public List<OneDayClass> selectMenuClassList(Map<String, Object> param) {

		return dao.selectMenuClassList(session,param);
	}

	@Override
	public List<OneDayClass> selectSearchClass(Map<String, Object> param) {
		return dao.selectSearchClass(session,param);
	}

	@Override
	public int masterEndEnroll(AdminMaster m) {
		return dao.masterEndEnroll(session, m);
	}

	@Override
	public AdminMaster selectMastserById(String memberId) {
		return dao.selectMastserById(session, memberId);
	}

	@Override
	public int endclassEnroll(OneDayClass odc) {
		System.out.println("������ȣ"+odc.getOdcNo());
		String no=String.valueOf(odc.getOdcNo());
		OneDayClass e = dao.odcView(session,no);
		if(e!=null){
			System.out.println("�������迩��");
			System.out.println(odc);
			return dao.updateClass(session,odc);
		}else{
			System.out.println("�������迩����");
			return dao.endclassEnroll(session, odc);
		}
	}

	@Override
	public OneDayClass odcView(String no) {
		return dao.odcView(session,no);
	}

	@Override
	public void inputOdcQa(OdcQa oq) {
		int oqno=oq.getOqno();
		System.out.println("번호"+oqno);
		if(dao.selectOqbyOqNo(session,oqno)!=null) {
			dao.updateOq(session,oq);
		}
		else {
		dao.inputOdcQa(session,oq);
		}
	}

	@Override
	public List<OdcQa> selectOdcQaAll(int odcNo) {
		return dao.selectOdcQaAll(session,odcNo);
	}

	@Override
	public void inputReplayOdcQa(OdcQaRe oqr) {
		dao.inputReplayOdcQa(session, oqr);
	}

	@Override
	public List<OdcQaRe> selectReOdcQaAll(int oqNo) {
		return dao.selectReOdcQaAll(session,oqNo);
	}

	@Override
	public List<OdcReserve> selectReserve(Map param) {
		return dao.selectReserve(session,param);
	}

	@Override
	public List<OdcReview> selectReview(int no) {
		return dao.selectReview(session,no);
	}

	@Override
	public List<OdcReserve> selectNoReviewReserve(int no2) {
		return dao.selectNoReviewReserve(session,no2);
	}

	@Override
	public int insertReview(OdcReview or) {
		
		OdcReview r=dao.selectReviewByodreNo(session, or.getOdcreNo());
		
		if(r!=null) {
			return dao.updateReview(session,or);
		}else {			
			return dao.insertReview(session, or);
		}
		
	}
	
	@Override
	public List<OdcReview> selectReviewByodcNo(int odcNo) {
		return dao.selectReviewByodcNo(session,odcNo);
	}

	@Override
	public int countPerson(Map param) {
		return dao.countPerson(session,param);
	}

	@Override
	public int inputReservation(Map param) {
		return dao.inputReservation(session, param);
	}

	@Override
	public List<OdcReview> selectReviewById(OdcReview or) {
		return dao.selectReviewById(session, or);
	}

	@Override
	public List<OdcQa> selectQnaById(OdcQa oq) {
		return dao.selectQnaById(session, oq);
	}
	@Override
	public List<OdcQa> selectNoQna(int no) {
		return dao.selectNoQna(session, no);
	}

	@Override
	public int countMenuClassList(String type) {
		return dao.countMenuClassList(session, type);
	}

	@Override
	public OdcReview selectReviewByodreNo(int no) {
		return dao.selectReviewByodreNo(session, no);
	}

	@Override
	public OdcReserve selectReservebyodreNo(int no) {
		return dao.selectReservebyodreNo(session, no);
	}

	@Override
	public void deleteOdcQa(String oqno) {
		dao.deleteOdcQa(session, oqno);
	}

	@Override
	public void deleteReOdcQa(String oqrNo) {
		dao.deleteReOdcQa(session, oqrNo);
	}
	
	
	
	

}
