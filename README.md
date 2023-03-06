# [파이널 프로젝트] 오늘의 밥

### [오늘의 밥 바로가기](https://gd1class.iptime.org:8844/GDJ56_BOB_final/)
- 오늘의 밥은 식재료 판매와 원데이 클래스 등 식품 관련 서비스들을 이용할 수 있는 종합 푸드 사이트입니다.
- 사이트명은 오늘의 집을 참고하여 작명하였습니다.
- 디자인 및 기능들은 마켓컬리를 상당 부분 참고하였습니다.

## 1. 제작 기간 및 참여 인원
- 기간: 2022.12.26~2023.02.15
- 인원: 6명

## 2. 개발 환경
- 언어: Java 11, JavaScript, HTML, CSS, SQL
- 프레임워크: Spring Framework 5.2.0, MyBatis, Bootstrap
- 라이브러리: jQuery, Lombok, JSTL, Gson, JavaMail
- IDE: Spring Tool Suite 3, SQL Developer
- 빌드 도구: Maven
- DBMS: Oracle Database
- WAS: Apache Tomcat v9.0
- 기술: JSP, Ajax
- 버전 관리: GitHub

## 3. ERD 설계
<img src="https://user-images.githubusercontent.com/118409554/220550124-79701d7b-fb57-40e0-9935-7c58aa2eac21.png"/>

- ERD는 ERDCloud 사이트를 사용했습니다.
- 주소: https://www.erdcloud.com/d/v53NYk65djAi8wC8L

## 4. 담당한 기능
- 메인 화면 디자인
- SNS 공유 기능
- 회원가입(SMTP / 다음 주소 API 사용)
- 로그인
- 스프링 시큐리티 적용
- 아이디/비밀번호 찾기
- 정기 구독 신청(PortOne API 사용)
- 공지사항/1:1문의 게시판(Ajax 페이징 처리 적용)

## 5. 구현한 기능 설명
#### 1. 스프링 시큐리티 로그인
- pom.xml에 시큐리티 의존성 등록
- [security-context.xml](https://github.com/hanairu96/GDJ56_BOB_final_personal/blob/main/GDJ56_BOB_final/src/main/webapp/WEB-INF/spring/security-context.xml)
  - <security:http> 태그의 하위 태그인 <security:form-login>에 로그인 페이지, username과 password의 파라미터, 로그인 성공/실패 시 이동할 주소 설정
  - BCryptPasswordEncoder 클래스를 이용하는 암호화 관련 Bean 등록
  - 로그인에 사용할 SecurityService 클래스를 Bean으로 등록
  - <security:authentication-manager> 태그에서 인증 받는 방법에 대해 설정을 함
- [Member 클래스](https://github.com/hanairu96/GDJ56_BOB_final_personal/blob/main/GDJ56_BOB_final/src/main/java/com/today/bab/member/model/vo/Member.java)
  - UserDetails 인터페이스를 구현한 클래스
  - getAuthorities() 메소드를 오버라이딩
    - ArrayList로 권한과 관련된 List<GrantedAuthority> auth 객체를 생성
    - 권한명을 매개변수로 하여 SimpleGrantedAuthority 객체를 생성하고 auth 리스트에 add
    - auth 리스트를 리턴
- [SecurityService 클래스](https://github.com/hanairu96/GDJ56_BOB_final_personal/blob/main/GDJ56_BOB_final/src/main/java/com/today/bab/security/SecurityService.java)
  - UserDetailsService 인터페이스를 구현한 클래스
  - username를 매개변수로 받는 loadUserByUsername() 메소드를 오버라이딩
  - username이 id인 Member가 DB에 있는지 여부를 mapper에 등록된 SQL문을 통해 확인
  - 해당 Member가 있으면 Member를 리턴하고, 없으면 UsernameNotFoundException 예외 처리
- [MemberController 클래스](https://github.com/hanairu96/GDJ56_BOB_final_personal/blob/main/GDJ56_BOB_final/src/main/java/com/today/bab/member/controller/MemberController.java)
  - 로그인 실패하면 매핑주소가 "/member/loginFail"인 메소드로 가서 커스텀 예외인 LoginAccessException 예외 발생시킴
  - 로그인 성공하면 매핑주소가 "/member/loginSuccess"인 메소드로 감
    - SecurityContextHolder.getContext().getAuthentication().getPrincipal();으로 member를 생성
    - Model 객체의 속성에 member 객체를 loginMember라는 이름으로 추가함
    - @SessionAttributes({"loginMember"}) 어노테이션을 추가해 리다이렉트 되더라도 loginMember를 키로 가지는 세션이 살아있게 함
    - 최종적으로 return에 적혀진 주소로 리다이렉트
#### 2. 로그인 시 로그인페이지 이전에 접속했던 페이지로 이동하기
- [loginpage.jsp](https://github.com/hanairu96/GDJ56_BOB_final_personal/blob/main/GDJ56_BOB_final/src/main/webapp/WEB-INF/views/member/loginpage.jsp)
  - 로그인 페이지 접속 시 document.referrer로 이전 주소를 받아옴
  - ajax로 이전 주소 값을 서버에 보냄
- [MemberController 클래스](https://github.com/hanairu96/GDJ56_BOB_final_personal/blob/main/GDJ56_BOB_final/src/main/java/com/today/bab/member/controller/MemberController.java)
  - 로그인페이지에서 보내 온 주소 값을 CookieGenerator 객체를 이용해 쿠키로 저장함
  - 로그인 성공 시 request.getCookies()로 모든 쿠키를 불러온 후 저장한 쿠키명과 일치하는 쿠키를 찾음
  - 해당 쿠키에 저장된 주소로 리다이렉트시킴
#### 3. 정기 구독 신청
- [subApply.jsp](https://github.com/hanairu96/GDJ56_BOB_final_personal/blob/main/GDJ56_BOB_final/src/main/webapp/WEB-INF/views/subscription/subApply.jsp)
  - PortOne(舊 아임포트) 라이브러리를 CDN 방식으로 불러옴
  - 결제하기 버튼을 누르면 requestPay() 메소드가 실행되고 카카오페이로 정기 결제가 진행됨
  - 정기 결제가 성공하면 ajax로 회원 아이디와 결제 항목을 서버로 전송 후 결제 성공 메시지 뜸
  - 정기 결제가 실패하면 결제 실패 메시지가 뜸
- [SubController 클래스](https://github.com/hanairu96/GDJ56_BOB_final_personal/blob/main/GDJ56_BOB_final/src/main/java/com/today/bab/sub/controller/SubController.java)
  - HashMap으로 생성한 param 객체에 회원 아이디와 결제 항목을 put함
  - param 객체를 Service와 Dao로 보내고 mapper의 INSERT문으로 SUBSCRIPTION 테이블에 값을 추가함
  - SQL문이 정상적으로 완료되면 true를, 아니면 false를 리턴
#### 4. Ajax 페이징 처리
- 현재 페이지, 페이지당 데이터수, 전체 데이터수를 매개변수로 받아 페이지바를 생성하는 getPage() 메소드를 작성
- 리스트 출력 시 페이지바도 나오게 함
- 페이지바의 버튼을 누르면 버튼의 숫자를 ajax로 서버에 보냄
- 받은 데이터를 Service와 Dao로 보내고 mapper로 전체 데이터를 받아옴
- Dao에서 RowBounds 객체를 생성해 특정 페이지의 데이터만 가져오게 함
- 가져온 데이터를 List로 받고 해당 리스트를 리턴
- jsp의 ajax에서 받아온 리스트를 이용해 출력할 테이블을 새로 생성하고 html() 메소드로 테이블을 교체함
  <> 및 파일명 추가 예정
## 6. 트러블 슈팅
- 문제 종류, 원인, 해결 방법(코드)

## 7. 회고/느낀 점
#### 만족한 점
#### 아쉬운 점
