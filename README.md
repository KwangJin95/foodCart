# FOOD CART _ 쇼핑몰(식품)


* **이름** : foodCart (푸드카트)
* **기간** : 2주
* **인원** : 풀스택 4명
* **소개** : 아이티윌에서 진행한 2차 프로젝트이며, MVC model-1 패턴에서 Servlet, JSP와 myBatis를 사용한 개발 및 웹페이지 구현을 목적으로
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;마켓컬리를 모방하여 만든 쇼핑몰 사이트입니다.

---
## 프로젝트 기술스택
**프론트엔드**

<img src="https://img.shields.io/badge/HTML5-E34F26?style=flat-square"/> <img src="https://img.shields.io/badge/CSS3-1572B6?style=flat-square"/> <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=flat-square"/> <img src="https://img.shields.io/badge/jQuery-0769AD?style=flat-square"/> <img src="https://img.shields.io/badge/Ajax-66FFFF?style=flat-square"/> 
<img src="https://img.shields.io/badge/Bootstrap-7952B3?style=flat-square"/>

**백엔드**

<img src="https://img.shields.io/badge/Java8-007396?style=flat-square"/> <img src="https://img.shields.io/badge/ORACLE-F80000?style=flat-square"/> <img src="https://img.shields.io/badge/MyBatis-000000?style=flat-square"/> <img src="https://img.shields.io/badge/Apache Tomcat-F8DC75?style=flat-square"/>

**개발 툴**

<img src="https://img.shields.io/badge/Eclipse%20IDE-2C2255?style=flat-square&logo=java&logoColor=white"/>

---
## 프로젝트 관련 문서
<a href="https://drive.google.com/drive/folders/1IiFT1U2YMJfbsPDQK5y7H2NuOwM-2iQ4?usp=drive_link" style="text-decoration: none;">문서 목록 보러가기</a>

---
## ERD
![erd2](https://github.com/user-attachments/assets/99fa3e40-a7d9-433b-9d07-8015e4442958)

---
## 주요 기능
### 기능 미리보기
#### ✔️내가 구현한 기능
<table>
  <tr>
    <th>기능</th>
    <th>화면</th>
    <th>기능</th>
    <th>화면</th>
  </tr>
  <tr>
    <td><b>회원<br>가입<br>(등록)</b></td>
    <td width="40%"><img src="https://github.com/user-attachments/assets/bace1b2a-b594-47b7-b73d-f0dcd022521e"></td>
    <td><b>로그인</b></td>
    <td width="40%"><img src="https://github.com/user-attachments/assets/0286a7a0-4b1d-464f-ac79-3e710d4ed7a3"></td>
  </tr>
  <tr>
    <td><b>아이디<br>찾기</b></td>
    <td width="40%"><img src="https://github.com/user-attachments/assets/0cb58ece-2ea7-471d-9eaa-a86fe3fe9085"></td>
    <td><b>비밀<br>번호<br>찾기</b></td>
    <td width="40%"><img src="https://github.com/user-attachments/assets/7bdacee6-8f84-4339-a83f-65583b650857"></td>
  </tr>
  <tr>
    <td><b>내 정보<br>수정</b></td>
    <td width="40%"><img src="https://github.com/user-attachments/assets/779ff8dd-4b33-4ac5-9b5d-d35e014ab03a"></td>
    <td><b>탈퇴</b></td>
    <td width="40%"><img src="https://github.com/user-attachments/assets/98d8b992-2d84-4439-a53c-e00ff81b5c62"></td>
  </tr>
  <tr>
    <td><b>회원<br>정보<br>관리</b></td>
    <td width="40%"><img src="https://github.com/user-attachments/assets/0b4462da-36f4-4215-8943-062f5b9098b7"></td>
  </tr>
</table>

---
#### 팀원들이 구현한 기능
<table>
  <tr>
    <th>기능</th>
    <th>화면</th>
    <th>기능</th>
    <th>화면</th>
  </tr>
  <tr>
    <td><b>장바<br>구니<br>관리</b></td>
    <td width="40%"><img src="https://github.com/user-attachments/assets/aa274cef-38d7-4b31-8e02-475ec510817f"></td>
    <td><b>주문 및<br>목록 <br>조회</b></td>
    <td width="40%"><img src="https://github.com/user-attachments/assets/0893f443-e42b-4742-a1d7-519f5ad24d64"></td>
  </tr>
  <tr>
    <td><b>상품<br>조회</b></td>
    <td width="40%"><img src="https://github.com/user-attachments/assets/a9c6140a-8407-4940-8589-c466ccf9fc87"></td>
    <td><b>상품<br>관리</b></td>
    <td width="40%"><img src="https://github.com/user-attachments/assets/57ac9922-4cf7-443a-be31-11aa589465a7"></td>
  </tr>
  <tr>
    <td><b>문의<br>조회</b></td>
    <td width="40%"><img src="https://github.com/user-attachments/assets/b0df7dc6-38a4-40cb-b0c9-69749d846255"></td>
    <td><b>문의<br>답변</b></td>
    <td width="40%"><img src="https://github.com/user-attachments/assets/1ccba602-55e6-4435-8691-8a99c0696368"></td>
  </tr>
</table>

---
### 요약

|**분류**|**공통**|**사용자**|**관리자**|
|:--|:--|:--|:--|
|회원|회원가입, 로그인, 아이디 찾기, 비밀번호 찾기|내 정보 조회 및 수정, 탈퇴|회원정보 관리|
|상품|상품 목록 및 상품 상세 조회||상품 관리|
|장바구니||장바구니 관리||
|주문||주문 관리||
|리뷰|리뷰 목록 및 상세 조회|리뷰 관리|리뷰 관리|
|문의||문의 관리|문의 관리|

---
### [ 공통 기능 ]

#### 회원
* **회원가입** : 사용자는 아이디, 비밀번호, 이름, 핸드폰 번호, 이메일, 주소를 모두 입력 및 유효값 체크 후 회원가입할 수 있다. 아이디, 이메일은 중복 확인이 필수이다.
* **로그인** : 사용자 및 관리자는 본인의 아이디, 비밀번호를 입력하여 로그인할 수 있다.
* **아이디 찾기** : 사용자는 회원가입 시 사용한 이름, 핸드폰 번호, 이메일을 입력 및 유효값 체크 후 아이디를 찾을 수 있다.
* **비밀번호 찾기** : 사용자는 회원가입 시 사용한 이름, 핸드폰 번호, 이메일, 주소를 입력 및 유효값 체크 후 비밀번호를 찾을 수 있다.

#### 상품
* **상품 목록 및 상품 상세 조회** : 사용자는 카테고리별 상품 목록 및 상품 상세를 조회할 수 있다. 상품명으로 상품 목록을 검색할 수 있다.

#### 리뷰
* **리뷰 목록 및 리뷰 상세 조회** : 사용자는 리뷰 목록 및 리뷰 상세를 조회할 수 있다.

---
### [ 사용자 기능 ]

#### 회원
* **내 정보 조회 및 수정** : 회원은 본인의 회원정보를 조회 및 비밀번호, 이름, 핸드폰 번호, 주소를 입력 및 유효값 체크 후 수정할 수 있다.
* **탈퇴** : 회원은 비밀번호를 입력 및 유효값 체크 후 탈퇴할 수 있다.
  
#### 장바구니
* **장바구니 관리** : 회원은 본인의 장바구니 목록을 조회할 수 있고, 상품 수량 수정 및 삭제할 수 있다.

#### 주문
* **주문 관리** : 회원은 결제방식 선택 후 상품을 주문할 수 있고, 본인의 주문 목록을 조회 및 주문일로 검색할 수 있다.

#### 리뷰(미구현)
* **리뷰 관리** : 회원은 본인이 작성한 리뷰 목록을 조회 및 리뷰 수정, 삭제할 수 있다.

#### 문의
* **문의 관리** : 회원은 본인이 작성한 문의 목록 및 문의 상세를 조회, 수정, 삭제할 수 있다.

---
### [ 관리자 기능]

#### 회원
* **회원 관리** : 관리자는 아이디, 이름, 핸드폰 번호, 이메일, 주소, 가입일 등의 옵션으로 회원 목록 및 상세를 조회할 수 있고 회원정보 등록, 수정, 삭제할 수 있다.
  
#### 상품
* **상품 관리** : 관리자는 상품 등록, 상품 목록 조회 후 상품 정보를 수정할 수 있다.

#### 문의
* **문의 관리** : 관리자는 문의 정보를 수정, 삭제 및 답변을 등록할 수 있다.

---
### ✔️내가 구현한 기능 상세

<table>
  <tr>
    <th>기능</th>
    <th>화면</th>
  </tr>
  <tr>
    <td><b>회원가입(등록)</b></td>
    <td width="85%"><img src="https://github.com/user-attachments/assets/24e0497d-1b9c-4825-a4b3-a1c91030eb24"></td>
  </tr>
</table>

- 중복 확인 버튼 클릭 시 아이디 또는 이메일이 미입력이거나 이미 존재하는 경우 해당하는 값에 대한 경고 메시지 표시
- 중복 확인 버튼 클릭 시 DB 조회 후 DB에 존재하지 않아 사용 가능한 아이디 또는 이메일인 경우 사용 가능 메시지 표시 후 확인 완료 버튼으로 바뀌고 버튼을 비활성화 처리
- 중복 확인 완료된 경우 아이디 또는 이메일에 새로운 값을 입력하면 중복 확인 버튼으로 활성화
- 가입하기 버튼 클릭 시 미입력 및 유효값 확인 후 해당하는 값에 대한 경고 메시지 표시
- 가입하기 버튼 클릭 시 비밀번호와 비밀번호 확인이 다른 경우 경고 메시지 표시
- 가입하기 버튼 클릭 시 중복 확인이 완료되지 않은 경우 경고 메시지 표시
- 회원가입 성공 시 메인 페이지로 이동 후 가입 완료 메시지 표시
- 취소 버튼 클릭 시 이전 페이지로 이동
---

<table>
  <tr>
    <th>기능</th>
    <th>화면</th>
  </tr>
  <tr>
    <td><b>로그인</b></td>
    <td width="85%"><img src="https://github.com/user-attachments/assets/1eef93c1-e941-4eb3-890e-e329f97ffe00"></td>
  </tr>
</table>

- 아이디 또는 비밀번호 미입력 또는 가입되지 않은 경우 해당하는 값에 대한 경고 메시지 표시
- 가입된 아이디, 비밀번호 입력 시 로그인 후 메인 페이지로 이동
- 아이디 찾기, 비밀번호 찾기, 회원가입 버튼 클릭 시 해당 페이지로 이동
---

<table>
  <tr>
    <th>기능</th>
    <th>화면</th>
  </tr>
  <tr>
    <td><b>아이디 찾기</b></td>
    <td width="85%"><img src="https://github.com/user-attachments/assets/31c3d5b5-bafd-4c90-9970-768a1c0cc9af"></td>
  </tr>
</table>

- 입력하기 버튼 클릭 시 미입력 값이 있는 경우 해당하는 값에 대한 입력 요청 메시지 표시
- 입력하기 버튼 클릭 시 핸드폰 번호의 경우 13자리, “010”으로 시작, “-” 문자 입력 및 그 외 자리는 숫자로 입력하지 
  않은 경우 메시지 표시, 이메일은 “@”를 포함하지 않을 경우 메시지 표시
- 회원정보 조회 결과 입력값에 대한 가입 정보가 없는 경우 로그인 화면으로 이동 후 메시지 표시
- 회원정보 조회 결과 있는 경우 해당 아이디 정보를 메시지로 표시
- 취소 버튼 클릭 시 로그인 화면으로 이동
---

<table>
  <tr>
    <th>기능</th>
    <th>화면</th>
  </tr>
  <tr>
    <td><b>비밀번호 찾기</b></td>
    <td width="85%"><img src="https://github.com/user-attachments/assets/2fc549ca-7ab4-46b5-9974-28b797fe187b"></td>
  </tr>
</table>

- 입력하기 버튼 클릭 시 미입력 값이 있는 경우 해당하는 값에 대한 입력 요청 메시지 표시
- 입력하기 버튼 클릭 시 핸드폰 번호의 경우 13자리, “010”으로 시작, “-” 문자 입력 및 그 외 자리는 숫자로 입력하지 않은 경우 메시지 표시, 이메일은 “@”를 포함하지 않을 경우 메시지 표시
- 회원정보 조회 결과 입력값에 대한 가입 정보가 없는 경우 로그인 화면으로 이동 후 메시지 표시
- 회원정보 조회 결과 있는 경우 해당 비밀번호 정보를 메시지로 표시
- 취소 버튼 클릭 시 로그인 화면으로 이동
---

<table>
  <tr>
    <th>기능</th>
    <th>화면</th>
  </tr>
  <tr>
    <td><b>내 정보 조회 및 수정</b></td>
    <td width="85%"><img src="https://github.com/user-attachments/assets/8e1f8c6e-c7cc-4364-bdd0-044f84636bd1"></td>
  </tr>
</table>

- 아이디, 이메일 외에 정보 수정 가능
- 수정하기 버튼 클릭 시 미입력 값이 있는 경우 해당하는 값에 대한 입력 요청 메시지 표시
- 수정하기 버튼 클릭 시 새 비밀번호와 새 비밀번호 확인이 불일치한 경우 경고 및 재입력 요청 메시지 표시
- 수정하기 버튼 클릭 시 핸드폰 번호의 경우 13자리, “010”으로 시작, “-” 문자 입력 및 그 외 자리는 숫자로 입력하지 않은 경우 메시지 표시, 이메일은 “@”를 포함하지 않을 경우 메시지 표시
- 수정하기 버튼 클릭 시 “회원정보 수정 완료했습니다. 다시 로그인 해주세요.” 메시지 표시 후 로그인 화면으로 이동
- 취소 버튼 클릭 시 내 정보 조회 화면으로 이동
---

<table>
  <tr>
    <th>기능</th>
    <th>화면</th>
  </tr>
  <tr>
    <td><b>탈퇴</b></td>
    <td width="85%"><img src="https://github.com/user-attachments/assets/3c1baaa8-c32a-4213-a1f0-ff8208c6fb67"></td>
  </tr>
</table>

- 올바르지 않은 비밀번호 입력 후 비밀번호 확인 버튼 클릭 시 경고 및 재입력 요청 메시지 표시
- 올바른 비밀번호 입력 후 비밀번호 확인 버튼 클릭 시 “탈퇴 버튼을 눌러주십시오.” 메시지 표시 후 비밀번호 확인 버튼이 확인 완료 버튼으로 변경 및 비활성화되고 탈퇴 버튼이 활성화됨
- 탈퇴 버튼 클릭 시 탈퇴 완료 메시지 표시 후 로그인 화면으로 이동
- 취소 버튼 클릭 시 내 정보 조회 화면으로 이동
---

<table>
  <tr>
    <th>기능</th>
    <th>화면</th>
  </tr>
  <tr>
    <td><b>회원정보 관리</b></td>
    <td width="85%"><img src="https://github.com/user-attachments/assets/d6e935fc-a32c-48c1-b6ad-81aeb297e4dc"></td>
  </tr>
</table>

- 전체보기 외 옵션 선택 후 검색 버튼 클릭 시 키워드 미입력일 경우 경고 메시지 표시
- 전체보기 외 옵션 선택 후 검색 버튼 클릭 시 핸드폰 번호, 이메일의 경우 입력값 검증 후 경고 메시지 표시
- 전체보기 외 옵션 선택 후 검색 버튼 클릭 시 가입일 제외 해당 키워드를 포함하는 옵션 정보 검색 후 회원정보 표시
- 수정하기 버튼 클릭 시 해당 회원 정보 수정 화면으로 이동
- 삭제하기 버튼 클릭 시 “정말로 삭제하시겠습니까?” 메시지 표시 후 해당 회원 정보 삭제
- 회원 등록 버튼 클릭 시 회원 등록 화면으로 이동
---

## 사용법
- version : JDK 1.8, oracle 11g (port:1521 / service:XE), Tomcat 9
- encoding : UTF-8
- libraries : jstl-1.2, mybatis-3.5.13, ojdbc6

1. 오라클 설치 후 관리자 계정에서 root 폴더의 script.sql 파일 실행 -> src/com/mystudy/mybatis/config.xml에서 DB 설정정보 참고
2. WEB-INF/lib 폴더에 필요한 library 파일 존재 -> eclipse에서 구동시 build path에 등록 필요
3. 패키지 구조
```
├─src                         
│  └─com
│      └─mystudy
│          ├─command                   : service 
│          ├─common                    : paging java 파일
│          ├─controller                : controller
│          ├─model                     : DAO, VO 파일
│          └─mybatis                   : mybatis 설정, mapper xml 파일 / SqlSessionFactory 반환 java 파일
└─WebContent
    ├─board                            : bootstrap css, js 파일
    ├─cart                             : 장바구니 jsp 파일
    ├─css                              : 상품 페이지 css 파일
    ├─img                              : image 파일 / menu, footer jspf 파일 
    ├─member                           : 회원 jsp 파일
    ├─META-INF
    ├─order                            : 주문 jsp 파일
    ├─photo                            : 상품 image 파일
    ├─product                          : 상품 jsp 파일
    ├─qa                               : 문의 jsp 파일
    └─WEB-INF
        └─lib                          : 필요 library jar 파일
```
