PROGRAM 1
```
void main() {
  int a = 10;
  int b = 20;
  int sum = a+b;
  print('Sum = $sum');
}
```
OUTPUT
```
Sum = 30
```
PROGRAM 2
```
void main() {
  String a = 'Hello ';
  String b = 'World';
  print('${a+b}');
}
```
OUTPUT
```
Hello World
```
PROGRAM 3
```
void main() {
  String s1 = "Hello";
  String s2 = " World";
  bool val = (s1==s2);
  print('$val');
}
```
OUTPUT
```
false
```
PROGRAM 4
```
void main() {
  List<int> nums = [1,2,3,4,5];
  print("List: $nums");
  print('First element: ${nums[0]}');
  nums.add(6);
  print("After appending: $nums");
  nums.remove(3);
  print("After removing: $nums");
  int l = nums.length;
  print("Length: $l");
}
```
OUTPUT
```
List: [1, 2, 3, 4, 5]
First element: 1
After appending: [1, 2, 3, 4, 5, 6]
After removing: [1, 2, 4, 5, 6]
Length: 5
```
