package mybatis;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.Follow;
import model.Member;
import mybatis.AbstractRepository;

public class MybatisMemberDao extends AbstractRepository
{
    private final String namespace = "mybatis.MemberMapper";

    public Member selectById(String email) 
    {
        SqlSession sqlSession = getSqlSessionFactory().openSession();
        try
        {
            String statement = namespace + ".selectById";
            return sqlSession.selectOne(statement, email);
        }
        finally
        {
            sqlSession.close();
        }
    }
    
    public void insert(Member mem) 
    {
        SqlSession sqlSession = getSqlSessionFactory().openSession();
        int number;
        
        try
        {
        	number=sqlSession.selectOne(namespace+".insert_max");	
        	mem.setMemNum(number);
        	
            String statement = namespace + ".insert";
            sqlSession.insert(statement, mem);
            sqlSession.commit();
        }
        finally
        {
            sqlSession.close();
        }
    }
    
    public int getProfileCount(){
		SqlSession sqlSession=getSqlSessionFactory().openSession();
		int count;
		
		try{
			String statement=namespace+".getProfileCount"; 
			count=sqlSession.selectOne(statement);
		}finally{
			sqlSession.close();
		}

		return count;
	}
	
	public List<Member> getProfile(){
		SqlSession sqlSession=getSqlSessionFactory().openSession();
		List<Member> profileList=null;
		
		try{
			String statement=namespace+".getProfile";         
			profileList=sqlSession.selectList(statement);
		}finally{
			sqlSession.close();
		}

		return profileList;
	}
	
	public Member getMember(int memNum){
		SqlSession sqlSession=getSqlSessionFactory().openSession();
		Member member=null;
		
		try{
			String statement=namespace+".getMember";         
			member=sqlSession.selectOne(statement, memNum);
		}finally{
			sqlSession.close();
		}

		return member;
	}
	
	public int updateMember(Member member) throws Exception{
		SqlSession sqlSession=getSqlSessionFactory().openSession();
		String dbpasswd="";
		int x=-1;
		
		try{
			dbpasswd=sqlSession.selectOne(namespace+".getPasswd", member.getMemNum());
			
			if(dbpasswd.equals(member.getPasswd())){
				sqlSession.update(namespace+".updateMember", member);
				sqlSession.commit();
				x=1;
			}else{
				x=0;
			}		
		}finally{
			sqlSession.close();
		}
		return x;
	}
	
	public int insertFollow(Follow follow){
		 SqlSession sqlSession = getSqlSessionFactory().openSession();	   
		 int check;
		 
	        try
	        {
	        	if(follow.getMemNum()==0){
	        		check=0;
	        	}else{
	        		String statement = namespace + ".insertFollow";
		            sqlSession.insert(statement, follow);
		            sqlSession.commit();
		            check=1;
	        	}	            
	        }
	        finally
	        {
	            sqlSession.close();
	        }
	        return check;
	}
	
	public int checkFollow(int loginNum, int memNum){
		SqlSession sqlSession = getSqlSessionFactory().openSession();	  		
		int checkFollow=-1;		
		
		Map map=new HashMap();
		map.put("memNum", loginNum);
		map.put("followNum", memNum);
		
	        try
	        {
	            String statement = namespace + ".checkFollow";
	            checkFollow=sqlSession.selectOne(statement, map);
	        }
	        finally
	        {
	            sqlSession.close();
	        }
	        return checkFollow;
	}
	
	public void unFollow(Follow follow){
		 SqlSession sqlSession = getSqlSessionFactory().openSession();	   
		 
	        try
	        {
	            String statement = namespace + ".unFollow";
	            sqlSession.delete(statement, follow);
	            sqlSession.commit();
	        }
	        finally
	        {
	            sqlSession.close();
	        }
	}
	
	public int followCount(int memNum){
		SqlSession sqlSession=getSqlSessionFactory().openSession();
		int count;
		
		try{
			String statement=namespace+".followCount"; 
			count=sqlSession.selectOne(statement, memNum);
		}finally{
			sqlSession.close();
		}

		return count;
	}
	
	public int followerCount(int memNum){
		SqlSession sqlSession=getSqlSessionFactory().openSession();
		int count;
		
		try{
			String statement=namespace+".followerCount"; 
			count=sqlSession.selectOne(statement, memNum);
		}finally{
			sqlSession.close();
		}

		return count;
	}
	
	public List<Member> followList(int memNum){
		SqlSession sqlSession=getSqlSessionFactory().openSession();
		List<Member> followList=null;
		String statement;
		
		try{
			statement=namespace+".getFollow";         
			followList=sqlSession.selectList(statement, memNum);
		}finally{
			sqlSession.close();
		}

		return followList;
	}
}
