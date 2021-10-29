package com.helloworks.spring.vacation.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.helloworks.spring.vacation.model.vo.ApprovalAttendance;
import com.helloworks.spring.vacation.model.vo.Vacation;
import com.helloworks.spring.vacation.model.vo.VacationCC;
import com.helloworks.spring.vacation.model.vo.VacationLine;

@Repository
public class VacationDao {
	
	//결재라인 insert
	public int insertLine(SqlSessionTemplate sqlSession, VacationLine line) {
		// TODO Auto-generated method stub
		return sqlSession.insert("vacationMapper.insertLine", line);
	}
	
	//수신참조
	public int insertCcEmpl(SqlSessionTemplate sqlSession, VacationCC vaCC) {
		// TODO Auto-generated method stub
		return sqlSession.insert("vacationMapper.insertCcEmpl", vaCC);
	}

	public int insertCcDept(SqlSessionTemplate sqlSession, VacationCC vaCC) {
		// TODO Auto-generated method stub
		return sqlSession.insert("vacationMapper.insertCcDept", vaCC);
	}

	//첨부파일
	public int insertAttachment(SqlSessionTemplate sqlSession, Vacation vacation) {
		// TODO Auto-generated method stub
		return sqlSession.insert("vacationMapper.insertAttachment", vacation);
	}

	//근태구분 결재
	public int insertVacation(SqlSessionTemplate sqlSession, Vacation vacation) {
		// TODO Auto-generated method stub
		return sqlSession.insert("vacationMapper.insertVacation", vacation);
	}

	public int insertAttendance(SqlSessionTemplate sqlSession, ApprovalAttendance apA) {
		// TODO Auto-generated method stub
		return sqlSession.insert("vacationMapper.insertAttendance", apA);
	}

}
