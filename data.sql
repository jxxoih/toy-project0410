create table language_mapping (
	l_id int(11) not null AUTO_INCREMENT,
	l_text VARCHAR(255) NOT NULL COMMENT "기술명",
	l_type tinyint(4) NOT NULL COMMENT "question테이블 매핑",
	PRIMARY KEY(l_id)
);

create table question (
	q_id int(11) not null AUTO_INCREMENT,
	i_question VARCHAR(255) NOT NULL COMMENT "면접질문",
	i_answer TEXT NOT NULL COMMENT "답변",
	q_type tinyint(4) NOT NULL COMMENT "0=기술전체,1=자바, 2=php, 3=프론트, 99=인성",
	use_state tinyint(1) NOT NULL DEFAULT(1) COMMENT "사용여부",
	PRIMARY KEY(q_id)
);

create table member(
	m_idx int(11) not null auto_increment,
	m_id VARCHAR(50) not null COMMENT "인증아이디",
	m_password VARCHAR(50) not null COMMENT "비밀번호",
	primary key (m_idx)
);

insert into member (m_id, m_password) values ("4671", "021912");



-- insert data
insert into language_mapping (l_text, l_type)
VALUES 
("인성면접", 99) ,
("기술전체", 0), 
("JAVA / Spring", 1),
("PHP", 2),
("React / Front", 3)
;

insert into question (i_question, i_answer, q_type)
values 
("리액트 라이프사이클", "최초 컴포넌트 객체가 생성될때, 초기에 화면을 그려줄 때, 업데이트가 될 때, 컴포넌트가 소멸될 때 호출", 3),
("state를 직접 변경하지 않고 setState를 사용하는 이유", "state는 불변성을 유지해야되기 때문\nstate를 직접 수정하게 되면 리액트가 render함수를 호출하지 않음", 3),
("App.js처럼 상위 컴포는터에서 하위컴포넌트에 데이터 전달 방법", "상태관리 라이브러리를 사용하거나, 상위 컴퍼넌트에 함수를 만들어 함수를 통해 데이터를 변경하면 하위 컴퍼넌트의 데이터들이 변경됨", 3),
("클래스 컴퍼넌트와, 펑션 컴퍼넌트의 차이", "클래스컴포넌트는 라이프 사이클을 가지고 있어 생명주기 메소드에 알고있어 하는 단점이 있고, 펑션 컴포넌트는 이러한 기능을 hook을 사용하여 생명주기에 원하는 동작을 하게 한다.", 3),
("Virtual DOM이란 ? ", "DOM 변화를 최소화 시켜주는 역할을 한다.", 3),
("useMemo와 useCallback의 원리", "성능 최적화를 위해 사용되는 hook이다.\n useMemo는 특정 결과 값을 재사용하는 반면에 useCallback은 특정함수를 재사용하고 싶을때 사용", 3),
("Php에서 mySQL 연결 방법", "mysqli_connect() 함수를 사용", 2),
("Public, private, protected의 차이", "Public : 어디서나, Private : 같은 클래스에서, Protected : 같은 클래스 및 자식 클래스에서 접근 가능", 2),
("static은 무엇인가?", "클래스 내에서 정적 함수 앞에 static 키워드를 붙여서 선언하면 클래스의 인스턴스 없이 바로 호출할 수 있음.", 2),
("Php에서 참조란 ?", "메모리 주소 공간을 같이 사용.\n &키워드를 사용해 주소를 표시", 2),
("세션과 쿠키, 캐시 차이", "- 쿠키: 로컬에 필요한 데이터를 저장하고 서버의 처리가 필요하지 않아 속도가 빠름\n- 세션: 서버에 저장하며, 로컬에 SESSION ID를 쿠키로 저장하고 서버는 클라이언트마다의 세션을 갖기에 부하가 생김\n- 캐시: 자주 사용하는 데이터나 값을 미리 복사해 놓는 임시 저장소, 메모리상에 저장
보통은 변화가 없는 static 파일, 이미지 또는 사진 파일(jpg, png 등등), CSS, JS 등 정적이고, 용량이 큰 파일들이다. 용량이 큰 파일인 만큼 다시 사용할때 재 다운로드받지 않고 저장소(캐시)에 저장하고 다시 재사용한다.", 2),
("include(), require(), include_once(), require_one() 차이", "include는 호출될 때 파일을 포함시키며 파일이 없더라도 코드가 실행됨\n require는 무조건 파일을 포함시키며 파일이 없다면 코드가 실행되지 않음\n once가 추가되면 해당 파일을 오직 한번만 추가한다는 옵션을 의미",2),
("연산자 == , === 차이", "== 는 값이 같으면 참.\n=== 는 지금 값의 데이터 타입이 같아야 참", 2),
("객체와 배열의 차이", "배열은 키, 인덱스로 접근하고 비슷한 데이터가 담김\n객체는 프로퍼티로 접근하고 관련된 정보를 저장함", 2),
("PHP 상수 선언", "define 함수를 사용하거나 클래스 내에서 const 키워드로 선언 가능", 2),
("RESTful API 란 ?", "자원, 메소드, 메시드 등을 정의하여 HTTP메소드를 사용해 클라이언트와 서버간의 통신을 가능하게하는 HTTP프로토콜 기반의 웹서비스 아키텍쳐입니다.", 3),
("Async/await이란 ?", "async/await는 비동기적인 작업을 처리할 수 있는 문법 입니다.\n async 함수를 정의하면 함수 내부에서 await 키워드를 이용하여 비동기적으로 처리되는 작업이 완료될 때까지 기다린 후, 결과값을 반환하는 처리를 할 수 있습니다.", 3),
("브라우저 렌더링 원리", "먼저 DOM을 생성하여 HTML 문서를 파싱하여 DOM 트리 생성 > CSS 파일을 파싱하여 CSSOM 트리를 생성 > DOM과 CSSOM을 결합하여 렌더 트리를 생성 합니다.", 3),
("이벤트 버블링이란?", "HTML에서 이벤트가 발생했을 때, 해당 요소에서 이벤트가 처리된 후. 상위 요소로 이벤트가 전파되는 현상을 말합니다", 3),
("스토리북이란?", "컴포넌트의 다양한 경우를 정리할 수 있도록 도와주는 시각화 도구.", 3),
("TDD 란?", "개발자가 코드를 작성하기 전에 먼저 테스트 케이스를 작성하고 이를 통과시키는 것을 중심으로 개발을 진행하는 방법입니다.\n효과:코드 품질 향상, 버그를 미리 발견하여 개선하는데 도움",3),
("SSG 란 ?", "정적인 HTML, CSS, JavaScript 파일을 생성하는 소프트웨어입니다\n동적인 서버 측 프로그래밍 없이 정적인 웹 페이지를 생성할 수 있습니다.\n장점 : 웹서버의 보안에 대한 걱정이 줄어듬, 로딩속도 향상", 3),
("Flex와 Grid의 차이", "Flex는 아이템들의 크기가 자유로워 주로 유동적인 레이아웃을 구성하는데 적합하고\n Grid는 아이템들의 크기를 미리 정의하여 각 셀의 크기를 일정하게 유지하기때문에 변화가 적은 레이아웃을 구성하는데 적합하다.", 3),
("SPA(Single page application/React) 란 ?", "필요한 데이터만 비동기로 받아와서 동적으로 현재 화면에 다시 렌더링 하는 방식\n대표적으로 리액트", 3),
("SPA 방식 사용이유", "필요한 영역만 캐치하여 즉각적인 화면의 변화를 줄 수 있기 때문에 사용자에게 자연스러운 사용감을 줄수있음.", 3),
("JVM 역할", "스택 기반으로 동작하며, Java Byte Code를 OS에 맞게 해석 해주는 역할을하고, 가비지컬렉션을 통해 자동적인 메모리 관리를 해준다.", 1),
("자바 컴퍼일과정.", "java파일 생성 -> build -> java compiler의 javac의 명령어를 통해 바이트코드를 생성 -> Class Loader를 통해 JVM 메모리 내로 로드한다 -> 실행엔진을 통해 OS에 맞는 기계어로 해석된다", 1),
("가비지 컬렉션이란 ?", "JVM메모리 관리 기법 중 하나로 시스템에서 동적으로 할당됐던 메모리 영역 중에서 필요없어진 메모리 영역을 회수하여 메모리를 관리해주는 기법.", 1),
("가비지 컬렉션 과정 ", "작업을 수행하기 위해 JVM이 어플리케이션의 실행을 잠시 멈추고,\n가비지컬렉션을 실행하는 쓰레드를 제외한 모든 쓰레드들의 작업을 중단 후\n사용하지 않는 메모르릴 제거 하고 작업이 재개된다.", 1),
("객체지향 프로그래밍(OOP) 란?", "객체들 간의 상호작용을 통해 프로그램을 만드는 것이라고 알고있습니다.\n특징으로는 캡슐화, 상속, 추상화, 다형성 등이 있고, 모듈 재사용으로 확장 및 유지보수가 용이하다는 장점이 있습니다.", 1),
("클래스와 객체", "클래스 : 객체를 만들어내기 위한 설계도 혹은 틀, 객체를 생성하는데 사용\n객체 : 자신의 고유 이름과 필드(상태), 메소드(행동)를 갖습니다.", 1),
("생성자란?", "클래스와 같은 이름의 메소드.\n객체가 생성될 때 호출되는 메소드.",1),
("불변객체", "객체 생성 이후 내부의 상태가 변하지 않는 객체를 말합니다.\nfinal키워드를 사용해 불변 객체를 만들 수 있습니다.", 1),
("불변객체 final 키워드를 사용해 얻는 이점", "병렬 프로그래밍에 유용하며, 동기화를 고려하지 않아도 된다.\n부수효과를 피해 오류를 최소화 할 수 있다.\n가비지 컬렉션 성능을 높일 수 있다.", 1),
("오버라이딩과 오버로딩 설명", "오버라이딩 : 상위 클래스에 있는 메소드를 하위 클래스에서 재정의 하는것\n오버로딩 : 매개변수의 개수나 타입을 다르게 하여 같은 이름의 메소드를 여러 개 정의하는 것", 1),
("자바의 메모리 영역", "자바의 메모리 공간은 크게 Method, Stack, Heap 영역으로 구분되고, 데이터 타입에 따라 할당.\n메소드 영역 : 전역변수와 static변수를 저장하며, Method영역은 프로그램의 시작부터 종료까지 메모리에 남아있다.\n스택 영역 : 지역변수와 매개변수 데이터 값이 저장되는 공간, 메소드가 호출될 때 메모리에 할당되고 종료되면 메모리가 해제된다. 변수에 새로운 데이터가 할당되면 이전 데이터는 지워짐\n힙 영역 : new 키워드로 생성되는 객체(인스턴스), 배열 등이 heap 영역에 저장되며, 가비지 컬렉션에 의해 메모리가 관리되어 진다.", 1),
("각 메모리 영역이 할당되는 시점", "Method : JVM이 동작해서 클래스가 로딩될 때 생성\n Stack : 컴파일 타입 시 할당\n Heap : 런타임시 할당", 1),
("Static 키워드란 ?", "static 키워드를 사용한 변수나 메소드는 클래스가 메모리에 올라갈 때 자동으로 생성되며 클래스 로딩이 끝나면 바로 사용할 수 있다.",1),
("static을 사용하는 이유", "static은 자주 변하지 않는 값이나 공통으로 사용되는 값 같은 공용자원에 대한 접근에 있어서 매번 메모리에 로딩되거나 값을 읽어들이는 것보다 일종의 ‘전역변수’와 같은 개념을 통해 접근하는 것이 비용도 줄이고 효율을 높일 수 있다.", 1),
("JSON 이란?", "데이터를 표시하는 표현 방법, JavaScript에서 객체를 만들 때 사용하는 표현식", 1),
("JVM, JDK 차이", "JVM은 자바 가상머신이고, 자바코드를 컴파일 해서 나온 결과를 실행시켜주는 가상 머신\nJDK는 자바 개발 키트이다.", 1),
("리액트와 뷰의 차이점", "리액트는 단방향 데이터 바인딩 방식이고\n뷰는 양방향 데이터 바인딩 방식을 이용한다",3),
("URL URI 차이", "URL은 웹페이지를 찾는데 사용하고\n URI는 HTML, XML 및 기타파일에 사용됩니다", 3),
("자바스크립트 모듈시스템을 사용하는 이유", "자바스크립트 모듈시스템을 사용하는 이유", 3),
("rem em 차이", "rem은 가장 상단에있는 객체의 기준으로 변화하고\n em은 객체의 직계 부모의 기준으로 변화한다", 3),
("promise와 async 차이", "promise란\n실행은 되었지만 결과를 아직 반환하지않은 객체",3),
("일반 함수와 화살표 함수 차이", "대표적으로 화살표 함수는 this, argument 바인딩을 갖지 않는 차이가 있습니다", 3),
("WAS 와 WS 차이", "WAS는 비즈니스 로직을 넣을수있음(톰캣, php, ASP등)\n WS는 비즈니스로직을 넣을수 없음(Nginx, Apache 등)", 1),
("스트레스를 해소하는 방법", "스트레스가 생기면 잠깐 밖에나가 마음을 추스리고 다시 일을 합니다. 그리고 운동을 좋아하기 때문에 퇴근후 운동을 하면서 스트레스를 해소합니다.",99),
("코드리뷰하는 방법", "작업이 끝나고 팀원이 코드리뷰를 할때까지 기다리기 보다\n
우선 코드가 겹치지 않는 선에서 작업 단위로 브랜치를 만들어서 작업하고, 코드리뷰가 완료되면 merge합니다", 99),
("2차원 배열에서 키값(문자)으로 값을 찾는 법", "array_column으로 컬럼 배열을 찾고 array_search로 키 값을 통해 찾을 수 있다", 2),
("sql 인젝션을 대비한 php 방법", "mysqli_real_escape_string 같은 기본 내장 함수로 체크", 2),
("문자열에서 마지막 문자를 제거하고 싶을때", "replace, slice 등으로 문자열을 바꿀 수 있음", 2),
("PHP의 장단점", "장점 : 대부분 운영체제에서 돌아감, 인터프리터언어 이므로 바로 결과를 받을 수 있음.\n단점 : 웹개발에 특화, 과거의 스파게티 코드 존재"),