package exhibition.model;

import java.util.Date;

public class Exhibition {
	
		//필드
		private int exhibition_no;
		private String title;
		private Date open_date;
		private Date end_date;
		private String place;
		private String thumbnail;
		private String details_img;
		private String introduction;
		
		
		//생성자
		//글번호없는 생성자
		public Exhibition(String title, Date open_date, Date end_date, String place, String thumbnail, String details_img,
				String introduction) {
			this.title = title;
			this.open_date = open_date;
			this.end_date = end_date;
			this.place = place;
			this.thumbnail = thumbnail;
			this.details_img = details_img;
			this.introduction = introduction;
			
		
		}

		//글번호있는 생성자
		public Exhibition(int exhibition_no, String title, Date open_date, Date end_date, String place,
				String thumbnail, String details_img, String introduction) {
			this.exhibition_no = exhibition_no;
			this.title = title;
			this.open_date = open_date;
			this.end_date = end_date;
			this.place = place;
			this.thumbnail = thumbnail;
			this.details_img = details_img;
			this.introduction = introduction;
		}

		
		
		//메소드
		public int getExhibition_no() {
			return exhibition_no;
		}

		public String getTitle() {
			return title;
		}

		public Date getOpen_date() {
			return open_date;
		}

		public Date getEnd_date() {
			return end_date;
		}

		public String getPlace() {
			return place;
		}

		public String getThumbnail() {
			return thumbnail;
		}

		public String getDetails_img() {
			return details_img;
		}

		public String getIntroduction() {
			return introduction;
		}
		
}
