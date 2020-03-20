package model;

import java.io.Serializable;
import java.util.Map;

public class Member implements Serializable{
	private int memNum;
    private String email;
    private String name;
    private String passwd;
    private String confirmpasswd;
    private String profile;
	private String selfIntroduction;
	
    public Member(){}
    
    public Member(String email, String name, String passwd) {
		this.email = email;
		this.name = name;
		this.passwd = passwd;
	}
    
    public Member(String email, String name, String passwd, String confirmpasswd) {
		this.email = email;
		this.name = name;
		this.passwd = passwd;
		this.confirmpasswd = confirmpasswd;
	}
    
   
    public String getEmail() {
		return email;
	}

	
    public String getPasswd()
    {
        return passwd;
    }
    
    public String getName()
    {
        return name;
    }   
    
    public int getMemNum() {
		return memNum;
	}

	public void setMemNum(int memNum) {
		this.memNum = memNum;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getSelfIntroduction() {
		return selfIntroduction;
	}

	public void setSelfIntroduction(String selfIntroduction) {
		this.selfIntroduction = selfIntroduction;
	}

	public String getConfirmpasswd()
    {
        return confirmpasswd;
    }
    
    public void changePassword(String newPwd)
    {
        this.passwd = newPwd;
    }
    public boolean matchPassword(String pwd)
    {
            return passwd.equals(pwd);
    }
    
    public boolean isPasswordEqualToConfrim()
    {
        return passwd != null && passwd.equals(confirmpasswd);
    }
    
    public void setEmail(String email) {
		this.email = email;
	}

    public void setPasswd(String passwd)
    {
        this.passwd = passwd;
    }
    public void setConfirmpasswd(String confirmpasswd)
    {
        this.confirmpasswd = confirmpasswd;
    }
    public void setName(String name)
    {
        this.name = name;
    }
   
    
    
    public void vaildate(Map<String, Boolean> errors)
    {
        checkEmpty(errors, email, "email");
        checkEmpty(errors, name, "name");
        checkEmpty(errors, passwd, "passwd");
        checkEmpty(errors, confirmpasswd, "confirmpasswd");
        if (!errors.containsKey("confirmpasswd"))
        {
            if (!isPasswordEqualToConfrim())
            {
                errors.put("notMatch", Boolean.TRUE);
            }
        }
    }
    
    private void checkEmpty(Map<String, Boolean> erros, String value,
            String filedName)
    {
        if (value == null || value.isEmpty())
            erros.put(filedName, Boolean.TRUE);
    }
  
   
    
}
