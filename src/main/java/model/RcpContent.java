package model;

import java.io.Serializable;

public class RcpContent implements Serializable {
	
	private int rcpNum;
	private int step; //step int, 레시피 순서(단계)
	private String fileName; //fileName varchar(30),
	private String content; //content varchar(100)
	
	public RcpContent() {} //디폴트 생성자

	public int getStep() {
		return step;
	}

	public int getRcpNum() {
		return rcpNum;
	}

	public void setRcpNum(int rcpNum) {
		this.rcpNum = rcpNum;
	}

	public void setStep(int step) {
		if (step == 0) 
			step=0;
		this.step = step;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
}
