# 나만의 문제집만들기 사이트 /// 2021-05-26 ~ 06-05
## 개발환경
 - Eclips 4.19
 - MySQL Workbench 8.0 CE
 - Tomcat 8.0

## 실행 방법
 1. Eclips에 들어가 file -> new -> Dynamic Web Project를 눌러 8.0 톰캣과 연결하여 실행환경을 만든다.
 2. git 클론 후 CreateorkBook 안에 src를 복사하여 새로만든 환경에 src에 넣는다.
 3. src -> main -> java -> util 폴더에 DatabaseConnection.java 파일을 사용할 로컬 mysql에 맞춰 id pw 를 변경한다.
 4. src -> main -> webapp 안에있는 index.jsp를 실행한다.
 
## 기능
  - 로그인, 로그아웃
  - 문제집 만들기
  - 문제 추가, 수정, 삭제
  - 개인 문제집 공유하기**
  - 공유된 문제집 개인문제집으로 가져오기**
  - 공부모드, 시험모드 구분
  - 시험모드 점수, 틀린문제 출력**
  - 검색기능, 페이징, 등록순 정렬, 풀어본사람 수
  
  ## 개발목적
   - 대학교 졸업 후 동기생들이 기사시험을 잘보길 바라며 좀더 쉽게 문제를 만들어 풀 수 있도록 문제집사이트를 개발

## 첫 웹프로젝트 개발
  * java 언어를 이용해서 처음 만들고싶었던 웹이다. 개발하면서 시간가는줄 몰랐고 기술을 터득할때마다 적용하면서 리펙토링에 소중함을 배울 수 있었다.
  다음은 프레임워크를 사용해서 모듈을 나누어 좀 더 깔끔한 개발을 할것이다.
  
  
## 데이터베이스(MySQL)

![image](https://user-images.githubusercontent.com/64072136/121827558-73663a80-ccf7-11eb-9faa-1d7a9973f5f0.png)
  
## 매인, 로그인, 문제추가  
![image](https://user-images.githubusercontent.com/64072136/120912681-2b7a5e80-c6cc-11eb-9e3d-8c40c453bcda.png)

## 문제풀기(공부모드)
  
 ![image](https://user-images.githubusercontent.com/64072136/120912943-68475500-c6ce-11eb-96d0-7c965d376afa.png)

## 문제풀기(시험모드)
![image](https://user-images.githubusercontent.com/64072136/120913523-a8a8d200-c6d2-11eb-9c9b-774921a95d63.png)

## 개인문제집, 공유문제집
![image](https://user-images.githubusercontent.com/64072136/120913892-587f3f00-c6d5-11eb-85a9-af6caaed2733.png)


  
