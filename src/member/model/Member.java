package member.model;


public class Member {
	//필드
	private String member_id;
	private String member_pw;
	private String member_date;
	private String member_tel;
	private String member_email;
	private String member_name;
	
	//생성자
	public Member(String member_id, String member_pw, String member_date, String member_tel,  String member_email, String member_name) {
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_date = member_date;
		this.member_tel = member_tel;
		this.member_email = member_email;
		this.member_name = member_name;
		
	}
	//메서드

	public Member(String membername, String membertel) {
	}

	public String getMember_id() {
		return member_id;
	}

	public String getMember_pw() {
		return member_pw;
	}

	public String getMember_date() {
		return member_date;
	}

	public  String getMember_tel() {
		return member_tel;
	}


	public String getMember_email() {
		return member_email;
	}

	public String getMember_name() {
		
		
		return member_name;
	}
	
	//암호 변경 기능을 구현할 때 사용
	public boolean matchPassword(String pwd) {
		return member_pw.equals(pwd);
	}
	
	
}
