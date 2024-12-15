# 쇼핑몰(식품) [FOOD CART]


* **이름** : foodCart (푸드카트)
* **기간** : 2주
* **인원** : 풀스택 4명
* **소개** : 아이티윌에서 진행한 2차 프로젝트이며, MVC model-1 패턴에서 Servlet, JSP와 myBatis를 사용한 개발 및 웹페이지 구현을 목적으로 마켓컬리를 모방하여 만든 쇼핑몰 사이트입니다.

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

---
## ERD
![erd2](https://github.com/user-attachments/assets/99fa3e40-a7d9-433b-9d07-8015e4442958)

---
## 주요 기능
### 기능 미리보기
#### ✔️내가 구현한 기능

|기능|화면|기능|화면|
|:--|:--|:--|:--|
|회원가입(등록)|<img src="https://github.com/user-attachments/assets/bace1b2a-b594-47b7-b73d-f0dcd022521e" width="320" height="240">|로그인|<img src="https://github.com/user-attachments/assets/0286a7a0-4b1d-464f-ac79-3e710d4ed7a3" width="320" height="240">|
|아이디 찾기|<img src="https://github.com/user-attachments/assets/0cb58ece-2ea7-471d-9eaa-a86fe3fe9085" width="320" height="240">|비밀번호 찾기|<img src="https://github.com/user-attachments/assets/7bdacee6-8f84-4339-a83f-65583b650857" width="320" height="240">|
|내 정보 수정|<img src="https://github.com/user-attachments/assets/779ff8dd-4b33-4ac5-9b5d-d35e014ab03a" width="320" height="240">|탈퇴|<img src="https://github.com/user-attachments/assets/98d8b992-2d84-4439-a53c-e00ff81b5c62" width="320" height="240">|
|회원정보 관리|<img src="https://github.com/user-attachments/assets/0b4462da-36f4-4215-8943-062f5b9098b7" width="320" height="240">

---
#### 팀원들이 구현한 기능

|기능|화면|기능|화면|
|:--|:--|:--|:--|
|장바구니 관리|<img src="https://github.com/user-attachments/assets/232c2b6d-1513-4f62-ac88-20e06f55d3b8" width="320" height="240">|주문 및 목록 조회|<img src="https://github.com/user-attachments/assets/0893f443-e42b-4742-a1d7-519f5ad24d64" width="320" height="240">|
|상품 조회|<img src="https://github.com/user-attachments/assets/a35b9de2-41df-4b9f-9670-af6fbe206c1e" width="320" height="240">|상품 관리|<img src="https://github.com/user-attachments/assets/459357de-91cc-43e4-b799-4ffca8887dec" width="320" height="240">|
|문의 조회|<img src="https://github.com/user-attachments/assets/b0df7dc6-38a4-40cb-b0c9-69749d846255" width="320" height="240">|문의 답변|<img src="https://github.com/user-attachments/assets/1ccba602-55e6-4435-8691-8a99c0696368" width="320" height="240">|

---
### 요약

|**분류**|**공통**|**사용자**|**관리자**|
|:--|:--|:--|:--|
|회원|회원가입, 로그인, 아이디 찾기, 비밀번호 찾기|내 정보 조회 및 수정, 탈퇴|회원정보 관리|
|상품|상품 목록 및 상품 상세 조회||상품 관리|
|장바구니||장바구니 목록 조회 및 수정, 삭제||
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

|기능|화면|
|:--|:--|
|회원가입(등록)|<img src="https://github.com/user-attachments/assets/24e0497d-1b9c-4825-a4b3-a1c91030eb24">|

- 중복 확인 버튼 클릭 시 아이디 또는 이메일이 미입력이거나 이미 존재하는 경우 해당하는 값에 대한 경고 메시지 표시
- 중복 확인 버튼 클릭 시 DB 조회 후 DB에 존재하지 않아 사용 가능한 아이디 또는 이메일인 경우 사용 가능 메시지 표시 후 확인 완료 버튼으로 바뀌고 버튼을 비활성화 처리
- 중복 확인 완료된 경우 아이디 또는 이메일에 새로운 값을 입력하면 중복 확인 버튼으로 활성화
- 가입하기 버튼 클릭 시 미입력 및 유효값 확인 후 해당하는 값에 대한 경고 메시지 표시, 
- 가입하기 버튼 클릭 시 비밀번호와 비밀번호 확인이 다른 경우 경고 메시지 표시
- 가입하기 버튼 클릭 시 중복 확인이 완료되지 않은 경우 경고 메시지 표시
- 회원가입 성공 시 메인 페이지로 이동 후 가입 완료 메시지 표시
- 취소 버튼 클릭 시 이전 페이지로 이동
---

|:--|:--|
|로그인|<img src="https://github.com/user-attachments/assets/1eef93c1-e941-4eb3-890e-e329f97ffe00" width="480" height="360">|

|:--|:--|
|아이디 찾기|<img src="" width="480" height="360">|

|:--|:--|
|비밀번호 찾기|<img src="" width="480" height="360">|

|:--|:--|
|내 정보 조회 및 수정|<img src="" width="480" height="360">|

|:--|:--|
|탈퇴|<img src="" width="480" height="360">|

|:--|:--|
|회원정보 관리|<img src="" width="480" height="360">|

---
