package com.helloworks.spring.dailyReport.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helloworks.spring.common.exception.CommException;
import com.helloworks.spring.dailyReport.model.dao.DailyReportDao;
import com.helloworks.spring.dailyReport.model.vo.DailyReport;

@Service
public class DailyReportServiceImpl implements DailyReportService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private DailyReportDao dailyReportDao;
	
	@Override
	public int tempDailyReportCount(int loginUser) {
		// TODO Auto-generated method stub
		return dailyReportDao.tempDailyReportCount(sqlSession, loginUser);
	}

	@Override
	public void updateDailyReportMe(DailyReport dailyReport) {
		// TODO Auto-generated method stub
		int result = dailyReportDao.updateDailyReportMe(sqlSession, dailyReport);
		
		if(result < 0) {
			throw new CommException("일일보고 업데이트 저장 실패");
		}
	}

	@Override
	public void insertDailyReport(DailyReport dailyReport) {
		// TODO Auto-generated method stub
		int result = dailyReportDao.insertDailyReport(sqlSession, dailyReport);
		
		if(result < 0) {
			throw new CommException("일일보고 저장 실패");
		}
	}

}
