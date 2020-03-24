package service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.Rcp;
import mybatis.AbstractRepository;

@Component
public class MybatisRcpDaoMysql{
	private final String namespace = "mybatis.RcpMapper";
	
	@Autowired
	public AbstractRepository opendb;

	public void insertRcp(Rcp rcp) {

		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		int rcpNum;
		
		try {
			String statement = namespace + ".insert_max";
			rcpNum = sqlSession.selectOne(statement);
			rcp.setRcpNum(rcpNum); // rcpNum max값을 여기에 저장
			
			String statement2 = namespace + ".insert1";
			
			sqlSession.insert(statement2, rcp);
			sqlSession.commit();
			
		} finally {
			sqlSession.close();
		}
	}
}
