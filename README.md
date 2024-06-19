<img src="https://github.com/YoonBeomGeun/werin/assets/145637270/a9dacd3f-089c-4b26-8dc0-36139d794188" alt="werin">

### 위아 인 제주(WERIN)

### 📖 프로젝트 요약
여행을 떠나고자 하는 지역의 관광지 정보를 제공하고, 다양한 사람들과 여행 정보를 공유하여 정보 탐색에 드는 시간을 줄일 수 있을 뿐만 아니라 만족도 높은 여행 계획을 세워 이를 기록 및 관리할 수 있는 플랫폼


- **기술 스택**
  - Spring / Java / JavaScript / Apache Tomcat / MyBatis / jQuery / HTML / CSS
- **DB**
  - MySQL / DBeaver
- **배포**
  - AWS / RDS / EC2 / S3 / FileZilla
- **API**
  - Kakao Maps API / TourAPI 4.0 / OpenWeather API
- **etc**
  - STS / Eclipse / Sourcetree / Git / GitHub / Slack / Figma / Notion / ERDCloud


### ✨ 주요 기능

- **회원가입, 로그인**
    - 회원가입 시 패스워드 재확인(일치해야 회원가입 가능)
    - 로그인 후 세션을 통해 로그인 정보 활용
- **메인 페이지**
    - 검색어에 관한 관광지, 게시판 검색 기능
    - 게시판 별 조회수가 높은 상위 3개의 게시물 노출
    - 제주도 날씨 정보 제공(OpenWeather API)
- **관광지 정보 제공(TourAPI 4.0)**
    - 카테고리 별 관광지 소개 및 해당 관광지에 대한 정보 제공(위치, 관련 사이트, 설명)
    - 관리자 계정을 통해 관광지 DB 정보 등록 및 삭제
- **여행 일정 계획하기 및 기록**
    - Kakao Maps API를 사용하여 지도를 통해 위치를 확인하고 일정 내 원하는 날짜에 추가(로그인 후 이용 가능)
    - 일정 둘러보기를 통해 공유된 일정 확인
    - 누구와 함께 하는지 카테고리를 선택하여 특정 일정 확인
    - 나의 일정 페이지에서 작성한 일정 모아보기
- **여행기 작성 게시판**
- **동행 게시판**
    - 게시판 CRUD(로그인 후 이용 가능)
    - AJAX를 통한 페이징 및 댓글 CRUD
    - 동시성을 고려한 추천/비추천 기능
    - 게시글 조회 수 및 추천 수 확인
    - 게시글 작성자가 기록한 여행 계획 확인
    - socket을 이용한 게시글 작성자와의 채팅
- **자유 게시판**
    - 카테고리 별 목록 보기
    - 검색 내용을 통한 게시글 검색
- **회원 레벨링 시스템**
    - 게시물 및 댓글 등록 시 사용자에게 포인트를 부여하는 레벨링 로직 구현


### 아키텍처

<img src="https://github.com/YoonBeomGeun/werin/assets/145637270/33c1deaa-bd94-41c0-9f6b-95f60a867499" alt="werin" width="800" height="500">


### ERD



### WBS

<img src="https://github.com/YoonBeomGeun/werin/assets/145637270/16cea6c8-0cfd-4e5d-b3c7-ba66d282c228" alt="WBS" width="800" height="250">


### 요구사항 정의서

[요구사항정의서](https://github.com/user-attachments/files/15815105/7._.xlsx)


### 테이블 정의서

[테이블정의서](https://github.com/user-attachments/files/15815114/7._.-18.xlsx)


### 프로젝트 정의서

[프로젝트정의서](https://github.com/user-attachments/files/15815118/7._.xlsx)


### 프로젝트 설명

[프로젝트 상세 설명](https://github.com/user-attachments/files/15814969/default.pptx)

