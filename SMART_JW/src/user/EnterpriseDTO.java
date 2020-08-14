package user;

public class EnterpriseDTO {
	String regist_num; // 사업자 등록번호
	String enterprise_name; // 기관(업체)명
	String leader_name; // 대표자 이름
	String enterprise_upload;  // 사업자등록증 파일 경로
	String leader_upload; // 대표자확인서 파일 경로
	String roadAddress; // 도로명 주소
	String detailAddress; // 상세 주소
	
	public String getRegist_num() {
		return regist_num;
	}
	
	public void setRegist_num(String regist_num) {
		this.regist_num = regist_num;
	}
	
	public String getEnterprise_name() {
		return enterprise_name;
	}
	
	public void setEnterprise_name(String enterprise_name) {
		this.enterprise_name = enterprise_name;
	}

	public String getLeader_name() {
		return leader_name;
	}

	public void setLeader_name(String leader_name) {
		this.leader_name = leader_name;
	}

	public String getEnterprise_upload() {
		return enterprise_upload;
	}

	public void setEnterprise_upload(String enterprise_upload) {
		this.enterprise_upload = enterprise_upload;
	}

	public String getLeader_upload() {
		return leader_upload;
	}

	public void setLeader_upload(String leader_upload) {
		this.leader_upload = leader_upload;
	}

	public String getRoadAddress() {
		return roadAddress;
	}

	public void setRoadAddress(String roadAddress) {
		this.roadAddress = roadAddress;
	}

	public String getDetailAddress() {
		return detailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	
	
	
	
}
