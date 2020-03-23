package mybatis;

import org.apache.ibatis.session.SqlSession;


import model.Rcp;
import mybatis.AbstractRepository;

public class MybatisRcpDaoMysql extends AbstractRepository {
	private final String namespace = "mybatis.RcpMapper";

	public void insertRcp(Rcp rcp) {

		SqlSession sqlSession = getSqlSessionFactory().openSession();
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
