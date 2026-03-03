# Dart & Flutter

## 1. Syntax (Cú pháp cơ bản)
Dart là ngôn ngữ lập trình kiểu tĩnh (statically typed) do Google phát triển. Cú pháp của Dart là sự kết hợp giữa C++, Python, Java và JavaScript. Mọi thành phần trong mã nguồn Dart đều là dạng Object. Chương trình bắt buộc phải có hàm `main()` để thực thi và mỗi câu lệnh phải kết thúc bằng dấu chấm phẩy (`;`).

### 1.1. Comments (Chú thích)
Chú thích giúp giải thích code và trình biên dịch sẽ bỏ qua nó.
```dart
// Đây là chú thích trên 1 dòng

/* 
  Đây là chú thích 
  trên nhiều dòng
*/
```

### 1.2. Keywords & Identifiers (Từ khóa & Định danh)
- **Từ khóa (Keywords):** Là các từ dành riêng của ngôn ngữ (VD: `if`, `else`, `void`, `int`, `return`,...). [Dart keywords](https://dart.dev/language/keywords)
- **Định danh (Identifiers):** Tên gọi để định danh biến, lớp hoặc hàm. Quy tắc đặt tên:
  - Chỉ chứa ký tự chữ, số, dấu gạch dưới `_` và ký hiệu dollar `$`.
  - Không thể trùng với các *keywords*.
  - Không thể chứa khoảng trắng.
  - Có phân biệt chữ hoa và chữ thường (Case-sensitive).

### 1.3. Variables and Data types (Biến & Kiểu dữ liệu)
Biến là vị trí trong bộ nhớ dùng để lưu giá trị. Nếu một biến không được gán giá trị khởi tạo, nó sẽ nhận giá trị mặc định là `null` (nếu kiểu biến cho phép nullable).

```dart
void main() {
  // 1. Strings (Chuỗi)
  String name = 'John';                 // Dùng nháy đơn hoặc kép
  var greeting = "Hello ${name}";       // Truyền biến vào chuỗi bằng ${} hoặc $

  // 2. Numbers (Số)
  int a = 20;                           // Số nguyên
  double b = 30.5;                      // Số thực
  num anyNumber = 10.5;                 // 'num' đại diện cho cả int và double

  // 3. Booleans (Giá trị đúng/sai)
  bool isTrue = true;                   // Chỉ nhận 'true' hoặc 'false'

  // 4. Collection (Tập hợp)
  var list = [10, 20, 30];              // List (Danh sách tuần tự, tương đương Array)
  var names = {'Jack', 'Jill'};         // Set (Tập hợp các giá trị không trùng lặp)
  var user = {'name': 'Alice', 'id': 1};// Map (Lưu trữ theo cặp Key-Value)
}
```

### 1.4. Operators (Toán tử trong Dart)
Dart cung cấp đa dạng các biểu thức và toán tử dùng trong xử lý dữ liệu:
- **Toán tử số học (Algebraic):** `+` (Cộng), `-` (Trừ), `*` (Nhân), `/` (Chia), `%` (Chia lấy dư).
- **Toán tử quan hệ (Relational):** Kiểm tra mối liên hệ `==` (Bằng), `!=` (Khác), `>`, `<`, `>=`, `<=`.
- **Toán tử logic (Logical):** `&&` (AND), `||` (OR), `!` (NOT).
- **Toán tử gán (Assignment):** `=`, `+=`, `-=`, `*=`, `/=`.
- **Toán tử an toàn Null (Null Aware):** Các toán tử đặc biệt `?`, `??`, `??=` dùng để check và thực thi nếu một Object là Null.

### 1.4 Cách khai báo biến
var, kiểu cụ thể, final, const, late, dynamic

### 1.5 Xử lý non-nullable:
String, int, double, ... không thể gán thành `null`

Để dùng được null, cần dùng dấu ? (int?, String?, ...)

Các cách xử lý null:
- Cần kiểm tra null trước
---


## 2. Function (Hàm)
Hàm trong Dart là đối tượng hạng nhất (first-class object), nghĩa là có thể gán hàm cho biến hoặc truyền như một tham số cho hàm khác.

- Các loại para:
  - 

```dart
// 1. Hàm cơ bản
int add(int a, int b) {
  return a + b;
}

// 2. Hàm rút gọn (Arrow function)
int multiply(int a, int b) => a * b;

void main() {
  // A. Tham số bắt buộc (Positional Parameters)
  print(add(5, 10)); 

  // B. Tham số tùy chọn có tên (Named Optional Parameters)
  void printInfo({required String name, int age = 18}) { // 'required' bắt buộc phải truyền name
    print("Name: $name, Age: $age");
  }
  printInfo(name: "John"); // Output: Name: John, Age: 18

  // C. Tham số tùy chọn theo vị trí (Positional Optional Parameters)
  void sayHello(String msg, [String? name]) {
    print("$msg ${name ?? 'Guest'}"); // Dùng '??' để gán giá trị default nếu name null
  }
  sayHello("Hi"); // Output: Hi Guest

  /*
  Các required para khôn thể đứng sau optional para
  */
}
```


```
void greet(String name, [int? age]) {
  if (age != null) {
    print('Hello, $name! You are $age years old.');
  } else {
    print('Hello, $name!');
  }
}

void main() {
  greet('Alice');      // Không truyền age. 
  greet('Bob', 30);    // Truyền cả hai tham số.
}

Hello, Alice!
Hello, Bob! You are 30 years old.
```

```
void greet({String? name, int? age}) {
  print('Hello, ${name ?? 'Guest'}! You are ${age ?? 'unknown'} years old.');
}

void main() {
  greet();                // Không truyền tham số nào.
  greet(name: 'Alice');   // Chỉ truyền name.
  greet(age: 25);         // Chỉ truyền age.
  greet(name: 'Bob', age: 30); // Truyền cả hai.
}

Hello, Guest! You are unknown years old.
Hello, Alice! You are unknown years old.
Hello, Guest! You are 25 years old.
Hello, Bob! You are 30 years old.
void greet({required String name, required int age}) {
  print('Hello, $name! You are $age years old.');
}

void main() {
  // greet();                // Lỗi: thiếu tham số bắt buộc.
  greet(name: 'Alice', age: 25); // OK
}
Hello, Alice! You are 25 years old.
```

```
void describe(String title, {int? year, String author = 'Anonymous'}) {
  print('$title was written by $author in ${year ?? 'an unknown year'}.');
}

void main() {
  describe('Flutter for Beginners');
  describe('Dart Essentials', year: 2021);
  describe('Learning Dart', year: 2023, author: 'John Doe');
}
```

---

## 3. Asynchronous (Lập trình bất đồng bộ)
Lập trình bất đồng bộ (Asynchronous programming) cho phép một chương trình thực thi các công việc khác thay vì bị chặn lại (blocking) để chờ một thao tác dài hoàn thành (ví dụ như gọi API, đọc file từ ổ cứng...). Dart xử lý bất đồng bộ chủ yếu thông qua đối tượng `Future` cùng với hai từ khóa `async` và `await`.

### 3.1. Future là gì?
Một `Future` đại diện cho kết quả của một thao tác bất đồng bộ. Nó có 2 trạng thái: 
- **Uncompleted (Chưa hoàn thành):** Khi ta gọi một hàm bất đồng bộ, nó sẽ trả về một `Future` uncompleted, tức là nó đang chờ thao tác hoàn thành để lấy kết quả hoặc báo lỗi.
- **Completed (Hoàn thành):** Khi thao tác kết thúc, `Future` sẽ hoàn thành bằng một **giá trị (value)** hoặc bị lỗi với một **báo lỗi (error)**.

Ví dụ về hàm trả về một Future bị trì hoãn sau 2 giây:
```dart
Future<String> fetchUserOrder() {
  // Giả lập lấy dữ liệu mất 2 giây
  return Future.delayed(const Duration(seconds: 2), () => 'Large Latte');
}
```

### 3.2. Làm việc với Futures (async và await)
Từ khóa `async` và `await` cung cấp một cách khai báo rõ ràng, biểu cảm để viết code bất đồng bộ mà trông giống y hệt như code đồng bộ. 

**Quy tắc sử dụng:**
- Để định nghĩa một hàm bất đồng bộ, thêm từ khóa `async` vào trước phần thân hàm.
- Từ khóa `await` chỉ hoạt động bên trong một hàm `async`.
- Kiểu trả về của hàm `async` phải mang kiểu `Future`. Cụ thể, nếu hàm trả về kiểu `T`, thì kiểu khai báo sẽ là `Future<T>`. Nếu hàm không trả về giá trị, dùng `Future<void>`.

```dart
// Thêm async vào hàm main để có thể sử dụng await bên trong
Future<void> main() async {
  print('Đang lấy thông tin order...');
  
  // Dùng await để chương trình CHỜ Future lấy dữ liệu xong rồi mới chạy tiếp
  String order = await fetchUserOrder(); 
  
  print('Cửa hàng chuẩn bị: $order');
}
```

**Luồng thực thi (Execution flow):**
Hàm `async` sẽ chạy tuần tự tựa như code đồng bộ bình thường cho đến khi nó gặp từ khóa `await` đầu tiên. Lúc này luồng hiện tại được treo (yield), cho phép các đoạn code bên ngoài tiếp tục chạy trong khi chờ thao tác tại `await` hoàn thành.

### 3.3. Xử lý lỗi với try-catch (Handling errors)
Để xử lý lỗi gây ra bởi một tác vụ trong hàm `async`,  có thể bọc câu lệnh `await` bên trong khối `try-catch`, y hệt như code đồng bộ.

```dart
Future<String> fetchErrorOrder() {
  return Future.delayed(
    const Duration(seconds: 2), 
    () => throw Exception('Không thể tìm thấy thông tin đơn hàng!'),
  );
}

Future<void> printOrderMessage() async {
  try {
    print('Awaiting user order...');
    var order = await fetchErrorOrder();
    print('Món mà  chọn là: $order'); // Dòng này không được in vì Exception ném ra ở trên
  } catch (err) {
    // Bắt lỗi được throw từ fetchErrorOrder
    print('Đã có lỗi xảy ra: $err'); 
  }
}

void main() async {
  await printOrderMessage();
}
```

---

## 4. Class (Lớp)
Trong Dart, mọi thứ đều là một object (đối tượng) và mỗi object là một instance (thực thể) của một class. Tất cả các class trong Dart đều kế thừa từ class `Object` (ngoại trừ Null).

### 4.1. Sử dụng Thành viên (Class members)
Một object bao gồm các hàm (methods) và dữ liệu (instance variables).  sử dụng dấu `.` để gọi một thành viên của object. Dùng toán tử `?.` thay vì `.` để tránh lỗi `NullPointerException` khi object có thể mang giá trị null.

```dart
var p = Point(2, 2);
p.y = 3;            // Truyền giá trị vào biến của object thông qua dấu `.`
var a = p?.y;       // Nếu p khác null, gán a = p.y. Nếu p là null, a cũng là null.
```

### 4.2. Khai báo biến trong Class (Instance variables)
Tất cả các biến instance (instance variables) khi khai báo đều sẽ ngầm định sinh ra hàm `getter` để lấy giá trị. Các biến không phải `final` sẽ tự động sinh thêm hàm `setter` để gán giá trị mới.

```dart
class Point {
  double? x;        // Khởi tạo ngầm định là null
  double? y;        
  double z = 0;     // Khởi tạo có sẵn giá trị là 0
  
  // Constructor mặc định gán trực tiếp thông qua 'this'
  Point(this.x, this.y); 
}
```

### 4.3. Constructors (Hàm khởi tạo)
Ta có thể khởi tạo một object bằng cách gọi constructor của nó. Constructor có thể mang trùng tên với class hoặc được đặt tên cụ thể (Named Constructor - kiểu `ClassName.identifier`).

```dart
class ProfileMark {
  final String name;
  final DateTime start = DateTime.now();

  // 1. Constructor mặc định
  ProfileMark(this.name);

  // 2. Named constructor (Constructor có tên) -> Tiện lợi để tạo nhiều loại object
  ProfileMark.unnamed() : name = 'Guest'; 
}

void main() {
  // Tạo object thông qua Constructor mặc định
  var p1 = ProfileMark('Alice'); 
  
  // Tạo object thông qua Named Constructor
  var p2 = ProfileMark.unnamed(); 
}
```

### 4.4. Implicit interfaces (Interface ngầm định)
Dart không có từ khóa `interface` như Java. Thay vào đó, mọi class đều **ngầm định** định nghĩa một interface bao gồm tất cả các thành viên của nó. Ta có thể tự do dùng từ khóa `implements` trên bất cứ class nào để kế thừa interface của class đó (buộc phải override lại toàn bộ).

```dart
// Mọi class đều có thể trở thành một Interface cho class khác.
class Person {
  String greet(String human_name) => 'Hello, $human_name.';
}

class Impostor implements Person {
  // Bắt buộc phải triển khai (implement) lại hàm của class Person
  @override
  String greet(String human_name) => 'Hi $human_name. Do you know who I am?';
}
```

---

## 5. OOP (Lập trình hướng đối tượng)
Lập trình hướng đối tượng (Object-Oriented Programming - OOP) là một mô hình lập trình sử dụng các "đối tượng" (objects) mang dữ liệu và hành vi để thiết kế ứng dụng.

**Ưu điểm của OOP:**
- Dễ hiểu, dễ sử dụng, tăng khả năng tái sử dụng code (Reusability).
- Giúp code dễ bảo trì, chỉnh sửa và gỡ lỗi (debug).
- Phù hợp với làm việc nhóm, chia nhỏ bài toán phức tạp thành các module/object nhỏ hơn.

Dart hỗ trợ mạnh mẽ **6 khái niệm cốt lõi** của thế giới OOP:

### 5.1. Class và Object (Lớp và Đối tượng)
- **Class:** Là khuôn mẫu (blueprint) chứa định nghĩa về thuộc tính (dữ liệu) và phương thức (hành vi).
- **Object:** Là một thực thể (instance) cụ thể được tạo ra từ Class.

### 5.2. Tính Trừu tượng (Abstraction)
Tính trừu tượng giúp ẩn đi các chi tiết thực thi phức tạp và chỉ hiển thị ra các đặc điểm, chức năng cốt lõi cần thiết đối với mỗi loại đối tượng. Trong Dart, có thể dùng `abstract class` để định nghĩa bộ khung này.

```dart
// Định nghĩa khung chung, ẩn đi chi tiết (các lớp con sẽ phải tự triển khai)
abstract class Animal {
  void makeSound(); // Phương thức trừu tượng (không cần có body)
  void sleep() => print('Đang ngủ zzz'); // Hàm đã được định nghĩa nội dung
}
```

### 5.3. Tính Kế thừa (Inheritance)
Tính kế thừa cho phép một class mới kế thừa và sử dụng lại các thuộc tính, phương thức từ một class có sẵn. Việc này giúp tiết kiệm thời gian viết code và hạn chế lặp lại. Giới hạn là Dart chỉ hỗ trợ đơn kế thừa (single inheritance) - tức là chỉ được dùng lệnh `extends` với tối đa 1 class.

```dart
class Dog extends Animal {
  @override
  void makeSound() {
    print("Gâu Gâu!");
  }
}
```

### 5.4. Tính Đóng gói (Encapsulation)
Gom nhóm, che giấu và bảo vệ dữ liệu bên trong class, không cho phép bên ngoài truy cập và thay đổi tùy tiện. 
Trong Dart, để định nghĩa một biến là private (riêng tư, chỉ truy cập được trong cùng 1 tập tin/thư viện), ta thêm dấu `_` (underscore) vào trước tên biến. Sau đó cung cấp quyền truy cập gián tiếp qua cặp hàm Getter và Setter.

```dart
class BankAccount {
  double _balance; 

  BankAccount(this._balance);

  double get balance => _balance;

  set deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
    }
  }
}
```

### 5.5. Tính Đa hình (Polymorphism)
Là khả năng một phương thức có cùng tên gọi nhưng lại thể hiện các hành vi thực thi khác nhau tùy thuộc vào đối tượng đang gọi nó là gì. Thường biểu hiện qua việc ghi đè phương thức (Override).

```dart
class Dog extends Animal {
  @override
  void makeSound() {
    print("Gâu Gâu!");
  }
}

class Cat extends Animal {
  @override
  void makeSound() {
    print("Meo Meo!");
  }
}

void main() {
  Animal myDog = Dog();
  Animal myCat = Cat();

  myDog.makeSound(); // Gâu Gâu!
  myCat.makeSound(); // Meo Meo!
}
```

---

## 6. With && Mixin (Đa kế thừa tính năng)
Trong Dart, một class chỉ có thể kế thừa (extends) **duy nhất 1** class khác. Tuy nhiên, Mixin cho phép ta định nghĩa các đoạn code (chứa thuộc tính và phương thức) có thể được **tái sử dụng trong nhiều hệ thống class khác nhau**. 

Thay vì kế thừa chằng chịt, ta chỉ cần "trộn" (mix in) các tính năng cần thiết vào class.
- Từ khóa `mixin` dùng để khai báo một mixin.
- Từ khóa `with` dùng để mang mixin đó vào class.

```dart
// 1. Khai báo mixin thông thường
mixin Swimmer {
  void swim() => print("I'm swimming");
}

mixin Flyer {
  void fly() => print("I'm flying in the sky");
}

class Animal {
  String name;
  Animal(this.name);
}

class Duck extends Animal with Swimmer, Flyer {
  Duck(String name) : super(name);
}
```

### 6.1. Hạn chế Mixin với từ khóa `on`
Ta có thể giới hạn một mixin **chỉ được phép sử dụng bởi các class kế thừa từ một class cụ thể**. Để làm việc này, sử dụng từ khóa `on`. 
Khá hữu ích khi mixin của ta cần gọi `super` để truy cập các phương thức của class cha.

```dart
class Musician {
  void play() => print('Chơi nhạc cụ!');
}

// Mixin này chỉ được phép dùng trên các class là con của Musician
mixin Singer on Musician {
  void sing() {
    print('Đang hát...');
    super.play(); // Truy cập hợp lệ vì chắc chắn class gọi mixin này là Musician
  }
}

// Lỗi: class Employee không kế thừa từ Musician nên không thể dùng mixin Singer
// class Employee with Singer {} 

// Hợp lệ:
class Idol extends Musician with Singer {}

void main() {
  Idol().sing();
}
```

### 6.2. Mixin Class (Từ Dart 3.0)
Thông thường, một mixin không thể được khởi tạo như một object (`var m = Swimmer();` là báo lỗi). Nhưng nếu ta dùng `mixin class`, nó vừa có thể hoạt động như một class thông thường, vừa có thể hoạt động như một mixin để class khác lồng vào.

```dart
mixin class Runner {
  void run() => print('Đang chạy...');
}

// Dùng như 1 class thông thường (Kế thừa)
class Athlete extends Runner {}

// Dùng như 1 mixin (Mix in)
class Dog with Runner {}
```
