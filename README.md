### Instagooram
Rails를 기반으로 [Instagram API](https://web.archive.org/web/20180305181555/https://www.instagram.com/developer/endpoints)를 GraphQL API로 재해석하여 구현

#### Built with
- Ruby 2.5
- Ruby on Rails 5.2 (API only)
- GraphQL
- PostgreSQL
- Git
- AWS EB, RDS, EC2

#### 개발 환경 설정
1. 의존 패키지 설치
```
instagooram$ bundle install
```

2. PostgreSQL 설치 및 유저 생성
```
instagooram$ brew install postgresql
instagooram$ psql postgres
postgres=# CREATE ROLE instagooram WITH LOGIN PASSWORD 'instagooramkcd' CREATEDB;
postgres=# \q
```

3. Database 생성 및 마이그레이션
```
instagooram$ rails db:create
instagooram$ rails db:migrate
instagooram$ rails db:seed
```

---

- 서버 시작
```
instagooram$ rails server
```

#### 배포 환경 설정
1. AWS EB CLI 설치 및 환경 설정
```
instagooram$ brew install awsebcli
instagooram$ eb init
... eb에서 interactive모드로 이것저것 물어보면 적절히 입력
instagooram$ eb create
```
2. AWS EB의 데이터베이스를 PostgreSQL로 설정
- AWS Management Console의 EB 메뉴로 가서 1에서 설정한 앱을 선택
- Configuration > Database 가서 Engine을 postgres로 선택 및 나머지 적절히 선택
- 우측 하단 Save 버튼 클릭후 기다리면 앱이 재시작되어 데이터베이스와 연결

---

- 갱신된 내용 배포하기
```
instagooram$ git add .
instagooram$ git commit -m "Add stuff"
instagooram$ eb deploy
... 배포 과정 기다리기
```

- 디버깅
```
# 서버 상태
instagooram$ eb status
# 인스턴스 주소 브라우저로 바로 열기(쓸일은 없음)
instagooram$ eb open
# 웹서버 로그 확인
instagooram$ eb logs
# SSH
instagooram$ eb ssh
```

### API
1. 구현 범위
- Users, Relationships, Media, Likes

2. 접속 URL, 토큰 정보, REST endpoint별 GraphQL 매핑
- [Insomnia REST API Client](https://insomnia.rest/download/) export 파일 참고(프로젝트 루트의 `Insomnia_2018-04-20_instagooram.json`)

### 더 해볼만한
- 테스트 코드
- GraphQL 인풋 타입 개선(https://medium.com/graphql-mastery/json-as-an-argument-for-graphql-mutations-and-queries-3cd06d252a04)
- 테이블 인덱스 추가
- 공통으로 처리하는 부분 리팩토링 등
