  <h1>나만의 문제집만들기 사이트 ///
	2021-05-26 ~ 2021-06-05</h1>
    
    첫 프로젝트
	
  <h2>개발환경</h2>
  
  - Eclips
  - MySQL
  - Tomcat Apache
  
  <h2>기능</h2>
  
  - 로그인, 로그아웃
  - 문제집 만들기
  - 문제 추가, 수정, 삭제
  - 개인 문제집 공유하기 (주요)
  - 공유된 문제집 개인문제집으로 가져오기(주요)
  - 공부모드, 시험모드 구분
  - 시험모드 점수, 틀린문제 출력(주요)
  - 검색기능, 페이징, 등록순 정렬, 풀어본사람 수
  
  
  <h2>개발 목표</h2>
  
  - 대학교 졸업 후 동기생들이 기사시험을 잘보길 바라며 좀더 쉽게 문제를 만들어 풀 수 있도록 문제집사이트를 개발


  <h2>첫 웹프로젝트 개발</h2>
  가장 자신있는 언어인 JAVA를 활용하여 만들 수 있는게 뭐가있을까 하다가 Springboot 프레임워크를 발견하여 공부를 시작했다. 하지만 이해가 되지않고 프레임워크를 사용하기전에
  JSP를 공부하면 도움이 될 수 있다는 사실을 알게되었고 공부를 시작했다. 게시판을 따라 만들고 익힌 기술로 만들고싶은 사이트를 만들었다.
  그냥 프로젝트 만드는 것이 확실한 공부법임을 깨닫게 해준 첫 프로젝트이다.
  
  
  
  디자인은 서칭했다.
<br/>
  
  <h1>- 매인, 로그인, 문제추가 -</h1>
  
<br/>
  
  ![image](https://user-images.githubusercontent.com/64072136/120912681-2b7a5e80-c6cc-11eb-9e3d-8c40c453bcda.png)
  
<br/>
  <h1>- 문제풀기(공부모드) -</h1>
  
<br/>
  
  ![image](https://user-images.githubusercontent.com/64072136/120912943-68475500-c6ce-11eb-96d0-7c965d376afa.png)

<br/>

  <h1>- 문제풀기(시험모드) -</h1>
  <br/>
    
    
![image](https://user-images.githubusercontent.com/64072136/120913523-a8a8d200-c6d2-11eb-9c9b-774921a95d63.png)

<br/>
<h1>- 개인문제집, 공유문제집 -</h1>
<br/>

![image](https://user-images.githubusercontent.com/64072136/120913892-587f3f00-c6d5-11eb-85a9-af6caaed2733.png)


<br/>

  <h1>- 데이터베이스(MySQL) -</h1>
  <br/>

![image](https://user-images.githubusercontent.com/64072136/120913749-549eed00-c6d4-11eb-9170-0f925ae0fa24.png)


  
<h2>기억나는 오류 및 해결방법</h2>

Loading class `com.mysql.jdbc.Driver'. This is deprecated. The new driver class is `com.mysql.cj.jdbc.Driver'. The driver is automatically registered via the SPI and manual loading of the driver class is generally unnecessary.
com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column 'work2_qw' at row 1
 - 데이터베이스 컬럼 크기 초과,, 문제가 길어서 생긴 오류 , 데이터베이스 크기조절로해결
  
You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'userid='11' and work1id='1' and work2id='2'' at line 1
 - 쿼리문 PrepareStatement set과정 타입 불일치하여생김, 타입 일치로 해결
  
