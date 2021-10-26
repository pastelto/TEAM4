package com.helloworks.spring.workshare.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.helloworks.spring.common.model.vo.PageInfo;
import com.helloworks.spring.employee.model.vo.Employee;
import com.helloworks.spring.workshare.model.vo.WSAttachment;
import com.helloworks.spring.workshare.model.vo.WSReply;
import com.helloworks.spring.workshare.model.vo.WorkShare;

@Repository
public class WorkShareDao {
	
	public int insertWorkShare(SqlSessionTemplate sqlSession, WorkShare ws) throws Exception {
		
		return sqlSession.insert("workShareMapper.insertWorkShare", ws);
	}

	public int insertWSAttach(SqlSessionTemplate sqlSession, WSAttachment wsa) throws Exception {
		
		return sqlSession.insert("workShareMapper.insertWSAttach", wsa);
	}

	public int selectUncheckedWSListCount(SqlSessionTemplate sqlSession, Employee myEmp) throws Exception  {
		
		return sqlSession.selectOne("workShareMapper.selectUncheckedWSListCount", myEmp);
	}

	public ArrayList<WorkShare> selectUnCheckedList(SqlSessionTemplate sqlSession, Employee myEmp, PageInfo pi) throws Exception  {
	
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("workShareMapper.selectUnCheckedList", myEmp, rowBounds); 
	}

	public int selectRecvWSListCount(SqlSessionTemplate sqlSession, Employee myEmp) throws Exception {
		
		return sqlSession.selectOne("workShareMapper.selectRecvWSListCount", myEmp);
	}

	public ArrayList<WorkShare> selectRecvList(SqlSessionTemplate sqlSession, Employee myEmp, PageInfo pi) throws Exception {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("workShareMapper.selectRecvList", myEmp, rowBounds); 
	}

	public int selectSendWSListCount(SqlSessionTemplate sqlSession, Employee myEmp) throws Exception {
		
		return sqlSession.selectOne("workShareMapper.selectSendWSListCount", myEmp);
	}

	public ArrayList<WorkShare> selectSendList(SqlSessionTemplate sqlSession, Employee myEmp, PageInfo pi) throws Exception {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("workShareMapper.selectSendList", myEmp, rowBounds); 
	}

	public int selectSavedWSListCount(SqlSessionTemplate sqlSession, Employee myEmp) throws Exception {
		
		return sqlSession.selectOne("workShareMapper.selectSavedWSListCount", myEmp);
	}

	public ArrayList<WorkShare> selectSavedList(SqlSessionTemplate sqlSession, Employee myEmp, PageInfo pi) throws Exception {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("workShareMapper.selectSavedList", myEmp, rowBounds); 
	}

	public WorkShare detailWS(SqlSessionTemplate sqlSession, int wno) throws Exception {
		
		return sqlSession.selectOne("workShareMapper.detailWS", wno);
	}

	public ArrayList<WSAttachment> detailWSAttachment(SqlSessionTemplate sqlSession, int wsno) throws Exception {
		
		return (ArrayList)sqlSession.selectList("workShareMapper.detailWSAttachment", wsno);
	}

	public int readStatusWS(SqlSessionTemplate sqlSession, WorkShare updateWS) throws Exception {
		
		return sqlSession.update("workShareMapper.readStatusWS", updateWS);
	}

	public ArrayList<WSReply> selectReplyList(SqlSessionTemplate sqlSession, int wno) throws Exception {
		
		return (ArrayList)sqlSession.selectList("workShareMapper.selectReplyList", wno);
	}

	public int insertReply(SqlSessionTemplate sqlSession, WSReply wsr) throws Exception {
		
		return sqlSession.insert("workShareMapper.insertReply", wsr);
	}

	public int deleteWS(SqlSessionTemplate sqlSession, int wno) throws Exception {
		
		return sqlSession.delete("workShareMapper.deleteWS", wno);
	}

	public int deleteWSAttachment(SqlSessionTemplate sqlSession, int wno) throws Exception {
	
		return sqlSession.delete("workShareMapper.deleteWSAttachment", wno);
	}
	
	public int updateWorkShare(SqlSessionTemplate sqlSession, WorkShare ws) {
	
		return sqlSession.update("workShareMapper.updateWorkShare", ws);
	}

	public int updateWSAttachment(SqlSessionTemplate sqlSession, WSAttachment wsa) throws Exception {
		
		return sqlSession.update("workShareMapper.updateWSAttachment", wsa);
	}


	
	
}
