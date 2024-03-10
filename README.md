# Look At !
![image](https://github.com/orchidHYE/LookAt/assets/131605360/ee3614cb-bcfd-41fd-8345-4f955a38f104)

# 프로젝트 소개
- 다양한 전시 • 문화행사 티켓을 예매 및 관리할 수 있는 웹 서비스
- 차별화된 리뷰페이지로 Look At만의 커뮤니케이션 공간
# 1. 개발환경
| Category    | Techs    |
|---   |:---:   |
| 🖥️ Back-End     | ![Java](https://img.shields.io/badge/java-%23ED8B00.svg?style=for-the-badge&logo=openjdk&logoColor=white) ![MySQL](https://img.shields.io/badge/mysql-4479A1.svg?style=for-the-badge&logo=mysql&logoColor=white)|
| 🖥️ Front-End     | ![HTML5](https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white) ![CSS3](https://img.shields.io/badge/css3-%231572B6.svg?style=for-the-badge&logo=css3&logoColor=white) ![JavaScript](https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E) ![jQuery](https://img.shields.io/badge/jquery-%230769AD.svg?style=for-the-badge&logo=jquery&logoColor=white)|
| 📋 협업    | ![Git](https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white) ![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white)|
| ☁️ WAS    | ![Apache Tomcat](https://img.shields.io/badge/apache%20tomcat-%23F8DC75.svg?style=for-the-badge&logo=apache-tomcat&logoColor=black)|


# 2. 팀원구성 및 역할
| 팀원 | 역할 | 팀원 | 역할 |
|:-:|:-:|:-:|:-:| 
| <img src="https://avatars.githubusercontent.com/u/80761052?v=4" width="50" height="50"/><br/>[@uki95](https://github.com/uki95) | 리뷰페이지 | <img src="https://avatars.githubusercontent.com/u/131141333?v=4" width="50" height="50"/><br/>[@mingzzzi326](https://github.com/mingzzzi326) | 마이페이지<br/>공지사항 |
| <img src="https://avatars.githubusercontent.com/u/80761052?v=4" width="50" height="50"/><br/>[@losscut25](https://github.com/losscut25) | 예매페이지 | <img src="https://avatars.githubusercontent.com/u/134905595?v=4" width="50" height="50"/><br/>[@xubxn](https://github.com/xubxn) | 관리자페이지 |
| <img src="https://avatars.githubusercontent.com/u/131605360?v=4" width="50" height="50"/><br/>[@orchidHYE](https://github.com/orchidHYE) | 전시회페이지<br/>메인페이지 | <img src="https://avatars.githubusercontent.com/u/125880480?v=4" width="50" height="50"/><br/>[@cjswoghks](https://github.com/cjswoghks) | Q&A<br/>1:1문의 |
| <img src="https://avatars.githubusercontent.com/u/128020445?v=4" width="50" height="50"/><br/>[@uu940903](https://github.com/uu940903) | 로그인 및 회원가입 |

# 3. 개발일정
**전체 프로젝트 일정**: 2023. 06. 29 ~ 2023. 08. 02

**상세일정**
- 주제선정 및 R&R: 2023. 06. 29 ~ 2023. 06. 30
- 문서작성 (요구사항명세서, API명세서, 와이어프레임 등): 2023. 07. 03 ~ 2023. 07. 07
- ERD 설계 및 DB 구축: 2023. 07. 10 ~ 2023. 07. 13
- 담당 페이지 UI 설계 및 기능구현: 2023. 07. 14 ~
- 기능테스트: 2023. 07. 28 ~
- 발표: 2023. 08. 02

# 4. ERD
![lookAt_erd](https://github.com/orchidHYE/LookAt/assets/131605360/9248b1ef-1e65-4b6c-b719-721cd186dda0)

# 5. 기능
###  👤 사용자
**로그인 및 회원가입**
- NAVER / KAKAO API 사용

**전시회 검색**
- 지역, 시기별 검색
- 제목 검색

**전시회 예매**
- Iamport API 사용

**리뷰**
- 카드 형식의 리뷰리스트

**마이페이지**
- 예매조회
- 작성한 리뷰 조회
- 1:1 문의 내역 조회
- 회원정보 수정 및 탈퇴

**Q&A**
- 1:1 문의

**공지게시판**
- 공지게시판 조회

### ⚙️ 관리자
- 전시회 및 사용자 관리
- 1:1 문의 답변
- 공지게시판 관리
