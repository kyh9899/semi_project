## MVC(Model-View-Controller) 패턴
### 1. MVC(Model-View-Controller) 패턴
* MVC 패턴은 디자인 패턴 중 하나로 데이터 처리(Model), 클라이언트가 보는 페이지(View), 그리고 중간에서 이들을 제어하는 컨트롤러(Controller)로 역할을 분담해 설계하는 디자인 패턴을 말한다.
* MVC 패턴을 활용하게 되면 각각 정해진 역할에만 집중하기 때문에 유지 보수 및 확장성이 용이한 장점이 있지만 설계하는 시간과 개발 시간이 증가하는 단점이 있다.
### 2. Model
* 비즈니스 영역의 로직 처리와 데이터 처리 부분을 담당한다.
  * VO(Value Object), DTO(Data Transfer Object)는 계층 간 데이터 교환을 위한 용도의 객체이다.
  * DAO(Data Access Object)는 Data에 접근하기 위한 용도의 객체이다.
  * Service는 전달할 데이터들을 가공하고 비즈니스 로직을 처리하기 위한 용도의 객체이다.
### 3. View
* 사용자 인터페이스 부분을 담당한다.
* 주로 모델(Model)로부터 전달받은 데이터들을 사용자에게 보여주는 역할을 한다.
### 4. Controller
* 뷰(View)와 모델(Model), 모델(Model)과 뷰(View)를 제어하는 부분을 담당한다.
* 뷰(View)를 통해 사용자가 입력한 값을 전달받거나 모델(Model)로부터 처리된 데이터를 뷰(View)로 전달하는 역할을 한다.
## JDBC(Java DataBase Connectivity)
### 1. JDBC(Java DataBase Connectivity)
* 자바에서 데이터베이스에 접근할 수 있게 해주는 표준 Programming API이다.
* 자바와 데이터베이스 연결 시 사용하는 DBMS에 알맞은 JDBC 드라이버를 사용해야 한다.
* JDBC 드라이버를 사용하면 DBMS의 종류 상관없이 동일한 방법으로 데이터베이스에 다양한 작업을 할 수 있다.
  ![image](https://github.com/Ismoon-Training/java/assets/26870393/a7f25421-d09d-47e8-b3f7-39f401194347)
### 2. JDBC 주요 객체
#### 2.1. DriverManager
* DriverManager 클래스는 JDBC 드라이버를 통하여 Connection을 만드는 역할을 한다.
* `Class.forName()` 메소드를 이용해서 JDBC 드라이버를 등록하면 드라이버 내부에 있는 클래스들을 동적으로 로드한다.
  ```java
  Class.forName("oracle.jdbc.driver.OracleDriver"); // 오라클
  Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); // MSSQL
  Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL
  ```
#### 2.2. Connection
* DriverManager 클래스를 통해 실제 데이터베이스와 연결된 Connection 객체를 얻을 수 있다.
* Connection 객체는 직접 생성이 불가능하고 `DriverManager.getConnection()` 메소드를 호출하여 Connection 객체를 얻어올 수 있다.
  ```java
  Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "web", "web");
  ```
#### 2.3. Statement
* Connection 객체를 통해 데이터베이스에 SQL 구문을 전달하여 실행시키고 결과를 반환받는 역할을 하는 객체이다.
* Statement 객체는 직접 생성이 불가능하고 Connection 객체의 `createStatement()` 메소드를 호출하여 Statement 객체를 생성할 수 있다.
  ```java
  Statement stmt = connection.createStatement();
  ```
* SQL 구문의 종류에 따라 실행에 필요한 메소드가 달라진다.
  ```java
  // SELECT 쿼리 실행 (ResultSet 객체를 리턴한다.)
  ResultSet rs = stmt.executeQuery("SELECT * FROM EMPLOYEE");

  // INSERT, UPDATE, DELETE 쿼리 실행 (정수값을 리턴한다.)
  int result = stmt.executeUpdate("DELETE FROM EMPLOYEE")
  ```
#### 2.4. PreparedStatement
* SQL 구문을 미리 컴파일 하고 실행 시간 동안 인수 값을 위한 공간을 확보한다는 점에서 Statement와 다르다.
* PreparedStatement 객체는 직접 생성이 불가능하고 Connection 객체의 `prepareStatement()` 메소드를 호출하여 PreparedStatement 객체를 생성할 수 있다.
  ```java
  String query = "SELECT * FROM EMPLOYEE WHERE EMP_NO = ?";
  PreparedStatement pstmt = connection.preparedStatement(query);

  pstmt.setString(1, "201");

  ResultSet rs = prepareStatement.executeQuery();
  ```
#### 2.5. ResultSet
* ResultSet 객체는 SELECT 쿼리의 실행 결과에 의해 생성된 테이블(Result Set)을 담고 있으며 커서(cursor)로 조회된 행들의 데이터에 접근할 수 있다.
  ```java
  ResultSet rs = stmt.executeQuery("SELECT * FROM EMPLOYEE");

  while(rs.next()){
    System.out.println(rs.getString("EMP_NO") + ", " + rs.getString(2));
  }
  ```
