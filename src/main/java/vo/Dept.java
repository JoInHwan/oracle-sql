package vo;

// VO(Value Object) 범위 안 DTO(Data Transfer Object) , Domain
public class Dept {
	private int deptNo;
	private String dname;
	private String loc;
	
	// shift art S 
	public int getDeptNo() {
		return deptNo;
	}
	public void setDeptNo(int deptNo) {
		this.deptNo = deptNo;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	
	
	
}






















	