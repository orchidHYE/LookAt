package exhibition.model;

import java.sql.Date;
import java.util.Map;

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
		//기본생성자
		public Exhibition () {}
		
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

		
		
		public Exhibition(String id, int no, String title2, Date open_date2, Date end_date2, String place2,
				String thumbnail2, String details_img2, String introduction2) {
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

		public void setExhibition_no(int exhibition_no) {
			this.exhibition_no = exhibition_no;
		}

		public void setTitle(String title) {
			this.title = title;
		}

		public void setOpen_date(Date open_date) {
			this.open_date = open_date;
		}

		public void setEnd_date(Date end_date) {
			this.end_date = end_date;
		}

		public void setPlace(String place) {
			this.place = place;
		}

		public void setThumbnail(String thumbnail) {
			this.thumbnail = thumbnail;
		}

		public void setDetails_img(String details_img) {
			this.details_img = details_img;
		}

		public void setIntroduction(String introduction) {
			this.introduction = introduction;
		}

		@Override
		public String toString() {
			return "Exhibition [exhibition_no=" + exhibition_no + ", title=" + title + ", open_date=" + open_date
					+ ", end_date=" + end_date + ", place=" + place + ", thumbnail=" + thumbnail + ", details_img="
					+ details_img + ", introduction=" + introduction + "]";
		}
		
		//필수입력 - p638 31라인
		public void validate(Map<String, Boolean> errors) {
			if ( title == null || title.isEmpty()) {
				errors.put("title", Boolean.TRUE);
			}
			if ( open_date == null) {
				errors.put("open_date", Boolean.TRUE);
			}
			if ( place == null || place.isEmpty()) {
				errors.put("place", Boolean.TRUE);
			}
			if ( thumbnail == null || thumbnail.isEmpty()) {
				errors.put("thumbnail", Boolean.TRUE);
			}
			if ( details_img == null || details_img.isEmpty()) {
				errors.put("details_img", Boolean.TRUE);
			}
		}
		
}
