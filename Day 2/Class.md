PROGRAM 1
```
void main() {
  Map<String, String> capitals = {'USA':'Washington D.C.',
                                  'France':'Paris',
                                 'Japan':'Tokyo'};
  print('Country-Capital Map: $capitals');
  print('Capital of USA: ${capitals['USA']}');
  capitals['Germany'] = 'Berlin';
  print('After adding Germany: $capitals');
  print('Printing pairs by iterating:');
  for(var country in capitals.keys) {
    var capital = capitals[country];
    print('The capital of $country is $capital');
  }
  capitals.remove('France');
  print('After removing France: $capitals');
  bool hasJapan = capitals.containsKey('Japan');
  print('Does the map have the country Japan? $hasJapan');
}
```
OUTPUT
```
Country-Capital Map: {USA: Washington D.C., France: Paris, Japan: Tokyo}
Capital of USA: Washington D.C.
After adding Germany: {USA: Washington D.C., France: Paris, Japan: Tokyo, Germany: Berlin}
Printing pairs by iterating:
The capital of USA is Washington D.C.
The capital of France is Paris
The capital of Japan is Tokyo
The capital of Germany is Berlin
After removing France: {USA: Washington D.C., Japan: Tokyo, Germany: Berlin}
Does the map have the country Japan? true
```
PROGRAM 2
```
void main() {
  int a = 10;
  int b = 20;
  String op = '/';
  if(op=='+') {
    print('Sum = ${a+b}');
  }
  else if(op=='-') {
    print('Difference = ${a-b}');
  } 
  else if(op=='*') {
    print('Product = ${a*b}');
  } 
  else {
    print('Quotient = ${a/b}');
  } 
}
```
OUTPUT
```
Quotient = 0.5
```
PROGRAM 3
```
void main() {
  int i;
  print('Odd numbers:');
  for(i=1;i<=10;i++) {
    if(i%2==0)
      continue;
    print('$i');
  }
}
```
OUTPUT
```
Odd numbers:
1
3
5
7
9
```
PROGRAM 4
```
void calculateSI(double p, double r, double t) {
  print('Simple Interest = ${p*r*t/100}');
}
void main() {
  double p = 5000;
  double r = 3;
  double t = 3;
  calculateSI(p,r,t);
}
```
OUTPUT
```
Simple Interest = 450.0
```
PROGRAM 5
```
class Rectangle {
  double? length;
  double? breadth;
  double area() {
    return length!*breadth!;
  }
}
void main() {
  Rectangle obj = Rectangle();
  obj.length=10;
  obj.breadth=5;
  print('Area of rectangle is ${obj.area()}');
}
```
OUTPUT
```
Area of rectangle is 50.0
```
