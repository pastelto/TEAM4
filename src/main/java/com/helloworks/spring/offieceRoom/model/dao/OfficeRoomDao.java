package com.helloworks.spring.offieceRoom.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.helloworks.spring.addressBook.model.vo.OfficeAddressBook;
import com.helloworks.spring.employee.model.vo.Employee;
import com.helloworks.spring.offieceRoom.model.vo.SearchEmployee;

@Repository
public class OfficeRoomDao {

	public ArrayList<Employee> selectAllEmployee(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("officeroomMapper.selectAllEmployee");
	}

	public ArrayList<Employee> selectDeptEmployee(SqlSessionTemplate sqlSession, String deptCode) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("officeroomMapper.selectDeptEmployee", deptCode);
	}

	public ArrayList<Employee> selectKorSortEmployee(SqlSessionTemplate sqlSession, String catTitle) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("officeroomMapper.selectKorSortEmployee", catTitle);
	}

	public ArrayList<Employee> selectEngSortEmployee(SqlSessionTemplate sqlSession, String catTitle) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("officeroomMapper.selectEngSortEmployee", catTitle);
	}

	public Employee searchEmployeeDetail(SqlSessionTemplate sqlSession, int empNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("officeroomMapper.searchEmployeeDetail",empNo);
	}

	public ArrayList<Employee> searchEmployee(SqlSessionTemplate sqlSession, SearchEmployee se) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("officeroomMapper.searchEmployee", se);
	}

}
