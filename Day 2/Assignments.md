QUESTION 1
```
import 'dart:math';

String generatePassword(int length) {
  const String chars =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#\$%^&*()_+[]{}|;:,.<>?';

  Random random = Random.secure();
  return List.generate(length, (index) => chars[random.nextInt(chars.length)])
      .join();
}

void main() {
  String password = generatePassword(12); 
  print('Generated Password: $password');
}
```
OUTPUT
```
Generated Password: )ViGh1}bNza{
```
QUESTION 2
```
int sumEvenNumbers(List<int> numbers) {
  return numbers.where((n) => n % 2 == 0).fold(0, (sum, n) => sum + n);
}

void main() {
  List<int> numbers = [1, 2, 3, 4, 5, 6, 10];
  print('Sum of even numbers: ${sumEvenNumbers(numbers)}');
}
```
OUTPUT
```
Sum of even numbers: 22
```
QUESTION 3
```
class Book {
  String name;
  String author;
  double price;

  Book(this.name, this.author, this.price);

  void display() {
    print('Book Name: $name');
    print('Author: $author');
    print('Price: \$${price.toStringAsFixed(2)}');
  }
}

void main() {
  Book book1 = Book('The Alchemist', 'Paulo Coelho', 299.50);
  book1.display();
}
```
OUTPUT
```
Book Name: The Alchemist
Author: Paulo Coelho
Price: $299.50
```
QUESTION 4
```
class Vehicle {
  String make;
  String model;

  Vehicle(this.make, this.model);

  void displayInfo() {
    print('Make: $make, Model: $model');
  }
}

class Car extends Vehicle {
  int numberOfDoors;

  Car(String make, String model, this.numberOfDoors) : super(make, model);

  void displayCarInfo() {
    displayInfo();
    print('Number of doors: $numberOfDoors');
  }
}

class Motorcycle extends Vehicle {
  String engineType;

  Motorcycle(String make, String model, this.engineType) : super(make, model);

  void displayMotorcycleInfo() {
    displayInfo();
    print('Engine type: $engineType');
  }
}

void main() {
  Car car1 = Car('Toyota', 'Camry', 4);
  print('--- Car Details ---');
  car1.displayCarInfo();

  Motorcycle bike1 = Motorcycle('Yamaha', 'R15', 'Liquid-cooled, 4-stroke');
  print('\n--- Motorcycle Details ---');
  bike1.displayMotorcycleInfo();
}
```
OUTPUT
```
--- Car Details ---
Make: Toyota, Model: Camry
Number of doors: 4

--- Motorcycle Details ---
Make: Yamaha, Model: R15
Engine type: Liquid-cooled, 4-stroke
```
QUESTION 5
```
class Shape {
  void draw() {
    print("Drawing a shape");
  }
}

class Circle extends Shape {
  @override
  void draw() {
    print("Drawing a circle");
  }
}

class Rectangle extends Shape {
  @override
  void draw() {
    print("Drawing a rectangle");
  }
}

void main() {
  List<Shape> shapes = [
    Circle(),
    Rectangle(),
    Circle(),
    Rectangle()
  ];

  for (var shape in shapes) {
    print("Shape type: ${shape.runtimeType}");
    shape.draw(); 
    print('---');
  }
}
```
OUTPUT
```
Shape type: Circle
Drawing a circle
---
Shape type: Rectangle
Drawing a rectangle
---
Shape type: Circle
Drawing a circle
---
Shape type: Rectangle
Drawing a rectangle
---
```
QUESTION 6
```
import 'dart:math';

class PasswordGenerator {
  int length;
  bool includeSpecialChars;
  String _password = "";

  PasswordGenerator(this.length, this.includeSpecialChars);

  String generatePassword() {
    const String lettersLower = "abcdefghijklmnopqrstuvwxyz";
    const String lettersUpper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    const String numbers = "0123456789";
    const String special = "!@#\$%^&*()-_=+[]{};:,.<>?/";

    String chars = lettersLower + lettersUpper + numbers;
    if (includeSpecialChars) {
      chars += special;
    }

    Random random = Random();
    _password = List.generate(length, (_) => chars[random.nextInt(chars.length)]).join();
    return _password;
  }

  void displayPassword() {
    if (_password.isEmpty) {
      print("No password generated yet. Please call generatePassword() first.");
    } else {
      print("Generated Password: $_password");
    }
  }
}

void main() {
  PasswordGenerator generator = PasswordGenerator(12, true);

  generator.generatePassword();
  generator.displayPassword();

  PasswordGenerator simpleGenerator = PasswordGenerator(10, false);
  simpleGenerator.generatePassword();
  simpleGenerator.displayPassword();
}
```
OUTPUT
```
Generated Password: x0BJ4lNw.%Oy
Generated Password: ibx3ohpYWl
```
QUESTION 7
```
Map<String, int> calculateSumAndProduct(List<int> numbers) {
  int sum = 0;
  int product = 1;

  for (int num in numbers) {
    sum += num;
    product *= num;
  }

  return {
    "sum": sum,
    "product": product,
  };
}

void main() {
  List<int> nums = [2, 3, 5];
  Map<String, int> result = calculateSumAndProduct(nums);
  
  print(result); 
}
```
OUTPUT
```
{sum: 10, product: 30}
```
QUESTION 8
```
class TodoItem {
  String title;
  String description;
  bool isCompleted;

  TodoItem(this.title, this.description, {this.isCompleted = false});

  void markCompleted() {
    isCompleted = true;
  }

  @override
  String toString() {
    String status = isCompleted ? "✅ Completed" : "❌ Not Completed";
    return "$title - $description [$status]";
  }
}

class TodoList {
  List<TodoItem> items = [];

  void addItem(String title, String description) {
    items.add(TodoItem(title, description));
  }

  void markItemCompleted(int index) {
    if (index >= 0 && index < items.length) {
      items[index].markCompleted();
    } else {
      print("Invalid item index.");
    }
  }

  void displayItems() {
    if (items.isEmpty) {
      print("No to-do items found.");
    } else {
      for (int i = 0; i < items.length; i++) {
        print("${i + 1}. ${items[i]}");
      }
    }
  }
}

void main() {
  TodoList myList = TodoList();

  // Adding tasks
  myList.addItem("Buy groceries", "Milk, Bread, Eggs");
  myList.addItem("Workout", "30 minutes of cardio");
  myList.addItem("Read book", "Finish chapter 4");

  // Marking some as completed
  myList.markItemCompleted(0);
  myList.markItemCompleted(2);

  // Displaying tasks
  myList.displayItems();
}
```
OUTPUT
```
1. Buy groceries - Milk, Bread, Eggs [✅ Completed]
2. Workout - 30 minutes of cardio [❌ Not Completed]
3. Read book - Finish chapter 4 [✅ Completed]
```
