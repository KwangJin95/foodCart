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

|기능|화면|기능|화면|
|:--|:--|:--|:--|
|상품 조회|<img src="https://github.com/user-attachments/assets/4381f3a7-13bb-4e15-b96b-f221db32fb01" width="320" height="240">|상품 관리|<img src="https://github.com/user-attachments/assets/0478ad3b-5843-487f-9f94-731eca403d6c" width="320" height="240">|
|장바구니 관리|<img src="https://github.com/user-attachments/assets/cdfd813c-341f-4475-a184-a2adc8533ee8" width="320" height="240">|주문 및 목록 조회|<img src="https://github.com/user-attachments/assets/d96a61f5-457e-44fd-843d-c9bb0c2b49bc" width="320" height="240">|
|문의 조회|<img src="https://github.com/user-attachments/assets/a0e74a96-fdff-425b-b990-304ed76c9ea5" width="320" height="240">|문의 답변|<img src="https://github.com/user-attachments/assets/08b856a0-ba6d-4990-bbd8-8f495c514ba9" width="320" height="240">|

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
### ✔️내가 구현한 기능 미리보기

|기능|화면|
|:--|:--|
|회원가입(등록)|<img src="https://github.com/user-attachments/assets/bb7090a2-4ae6-4bdc-a43b-d1ab854d3a1e" width="480" height="360">| 
- 중복 확인 버튼 클릭 시 아이디 또는 이메일이 미입력이거나 이미 존재하는 경우 해당하는 값에 대한 경고 메시지 표시
- 중복 확인 버튼 클릭 시 DB 조회 후 DB에 존재하지 않아 사용 가능한 아이디 또는 이메일인 경우 사용 가능 메시지 표시 후 확인 완료 버튼으로 바뀌고 버튼을 비활성화 처리
- 중복 확인 완료된 경우 아이디 또는 이메일에 새로운 값을 입력하면 중복 확인 버튼으로 활성화
- 가입하기 버튼 클릭 시 미입력 및 유효값 확인 후 해당하는 값에 대한 경고 메시지 표시, 
- 가입하기 버튼 클릭 시 비밀번호와 비밀번호 확인이 다른 경우 경고 메시지 표시
- 가입하기 버튼 클릭 시 중복 확인이 완료되지 않은 경우 경고 메시지 표시
- 회원가입 성공 시 메인 페이지로 이동 후 가입 완료 메시지 표시
- 취소 버튼 클릭 시 이전 페이지로 이동



|:--|:--|
|로그인|<img src="https://github.com/user-attachments/assets/3afcc437-200e-4a3c-a8bc-5fe1f0f46fb2" width="480" height="360">|

|아이디 찾기|<img src="https://github.com/user-attachments/assets/eee8785c-4c20-4f39-a579-1d941e813679" width="480" height="360">||
|비밀번호 찾기|<img src="https://github.com/user-attachments/assets/184fa7eb-6e55-49b4-9821-fd2bcf801013" width="480" height="360">||
|내 정보 조회 및 수정|<img src="https://github.com/user-attachments/assets/063f5ba6-b2d5-49ab-888b-4b093eb6c052" width="480" height="360">||
|탈퇴|<img src="https://github.com/user-attachments/assets/9ac4e5ec-a64e-4c00-8740-40f8af66a69c" width="480" height="360">||
|회원정보 관리|<img src="https://github.com/user-attachments/assets/12a19cb6-4888-44db-bd6e-a788d84bc493" width="480" height="360">||

---
