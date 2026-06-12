# 쑥쑥동학년

**쑥쑥동학년**은 동학년 교사들이 학년 단위로 준비물과 수업 일정을 함께 조율하기 위해 만든 Rails 기반 공동 관리 시스템입니다.

## 기능 개요

쑥쑥동학년은 학년 간 준비물을 중복 없이 효율적으로 예약하고 공유하기 위한 Drag & Drop 기반 보드 시스템입니다.

동학년 선생님들이 공용 준비물 또는 수업 활동 카드를 만들고, 날짜·층·교시별 일정판에 배치하여 학년 전체의 준비물 사용 흐름을 한눈에 확인할 수 있습니다.

## 주요 기능

### 학년 공동 준비물 예약

- 공용 TODO 영역에 준비물 또는 수업 활동 카드를 등록합니다.
- 등록된 카드는 날짜·층·교시별 일정 칸으로 Drag & Drop 할 수 있습니다.
- 공용 TODO 카드에서 일정 칸으로 드래그하면 원본을 유지한 채 카드가 복제됩니다.
- 복제된 카드는 사용자 학급명과 연결되어 누가 예약했는지 확인할 수 있습니다.

### 주간 일정판

- 오늘이 포함된 한 주의 일정을 날짜별로 표시합니다.
- 각 날짜는 3층/4층 영역으로 나뉘고, 각 층에는 1~6교시 리스트가 배치됩니다.
- 현재 날짜는 일정판에서 “오늘”로 강조됩니다.
- 다음 주 일정이 없을 경우 평일 5일치 스케줄을 자동 생성할 수 있습니다.

### 카드 이동과 정렬

- 사용자는 자신이 만든 카드를 다른 교시 칸으로 이동하거나 삭제할 수 있습니다.
- 카드 정렬은 `ranked-model`을 이용해 같은 리스트 안에서 순서를 유지합니다.
- Drag & Drop 처리는 Stimulus controller와 SortableJS를 통해 구현되어 있습니다.

### 사용자와 권한

- Devise 기반 회원가입/로그인을 사용합니다.
- Rolify로 사용자 역할을 관리합니다.
- CanCanCan으로 카드 복제, 이동, 삭제, 관리 권한을 제어합니다.
- 일반 사용자는 공용 TODO 카드를 복제하고, 자신이 만든 카드를 이동/삭제할 수 있습니다.
- admin 사용자는 전체 리소스를 관리할 수 있습니다.

## 기술 스택

- Ruby 3.3.2
- Ruby on Rails 7.1
- PostgreSQL
- Hotwire Turbo / Stimulus
- Importmap
- Bootstrap 5
- SortableJS
- Devise
- Rolify
- CanCanCan
- ranked-model
- requestjs-rails
- Capistrano 계열 배포 gem

## 데이터 구조 개요

### User

- Devise 인증 사용자입니다.
- `username`을 학급명처럼 사용합니다.
- 여러 개의 Item을 가질 수 있습니다.
- 생성 시 기본적으로 `user` 역할이 부여됩니다.

### Schedule

- 특정 날짜의 일정입니다.
- 여러 개의 List를 가집니다.

### List

- 특정 날짜 안의 층/교시 칸입니다.
- `period`, `floor`, `activated` 정보를 가집니다.
- 여러 개의 Item을 가집니다.

### Item

- 준비물, 수업 활동, TODO 등을 나타내는 카드입니다.
- List와 User에 속합니다.
- `name`, `body`, `color`, `row_order` 정보를 가집니다.
- 같은 List 안에서 `row_order` 기준으로 정렬됩니다.

## 기본 사용 흐름

1. 교사가 로그인합니다.
2. 공용 TODO 영역에 준비물 또는 수업 활동 카드를 만듭니다.
3. 카드를 필요한 날짜·층·교시 칸으로 드래그합니다.
4. 공용 TODO에서 일정 칸으로 드래그한 카드는 복제되어 배치됩니다.
5. 각 교사는 자신이 배치한 카드를 이동하거나 삭제할 수 있습니다.
6. 학년 전체는 일정판을 통해 준비물 사용 시간과 수업 흐름을 함께 확인합니다.

## 주요 파일

```text
app/controllers/schedules_controller.rb      # 주간 일정 조회, 다음 주 일정 생성
app/controllers/items_controller.rb          # 카드 생성, 수정, 삭제, 이동, 복제
app/models/schedule.rb                       # 날짜별 일정
app/models/list.rb                           # 날짜 안의 층/교시 리스트
app/models/item.rb                           # 준비물 / 수업 활동 / TODO 카드
app/models/user.rb                           # Devise 사용자, Rolify 역할
app/models/ability.rb                        # CanCanCan 권한 정책
app/javascript/controllers/sortable_controller.js  # SortableJS Drag & Drop 처리
app/views/schedules/                         # 일정판 화면
app/views/items/                             # 카드 UI와 modal form
config/routes.rb                             # 라우팅
```

## 구현 메모

- 루트 경로는 `schedules#index`입니다.
- `resources :items`에는 `move`, `clone` member action이 있습니다.
- `resources :schedules` 아래에 `resources :lists`가 중첩되어 있습니다.
- `schedule_pick` 경로는 특정 주차 일정을 조회하는 용도로 준비되어 있습니다.
- TODO 영역의 첫 번째 List는 공용 카드 원본 저장소처럼 사용됩니다.
- SortableJS의 `pull: 'clone'` 설정을 이용해 공용 TODO 카드 복제 흐름을 구현합니다.

## 향후 계획

### 학년 공용 알림장

학년 전체가 공유하는 알림장 기능을 추가하여 학년 단위 공지, 준비물 안내, 행사 안내 등을 한곳에서 관리할 수 있도록 확장할 계획입니다.

### 학급별 전담 수업시간 기반 스케줄러

학급별 전담 수업시간을 반영한 스케줄러를 추가할 계획입니다.

이를 통해 외부 교육, 특별 수업, 학년 공동 행사처럼 여러 학급의 시간이 맞아야 하는 일정을 더 쉽게 조율할 수 있도록 합니다.

## 저작권

* 쑥쑥동학년은 신재훈이 만들었습니다.
* 쑥쑥동학년은 GNU GPL을 따릅니다.
