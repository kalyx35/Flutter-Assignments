QUESTION 1
```
void main() {
 String destinationZone = 'ABC';
 double weightKg = 3.5;

 double shippingCost;

 if (destinationZone == 'XYZ') {
    shippingCost = 5 * weightKg;
    print('Shipping cost: ${shippingCost.toStringAsFixed(2)}');
  } else if (destinationZone == 'ABC') {
    shippingCost = 7 * weightKg;
    print('Shipping cost: ${shippingCost.toStringAsFixed(2)}');
  } else if (destinationZone == 'PQR') {
    shippingCost = 10 * weightKg;
    print('Shipping cost: ${shippingCost.toStringAsFixed(2)}');
  } else {
    print('Error: Invalid destination zone.');
  }
}
```
OUTPUT
```
Shipping cost: 24.50
```
QUESTION 2
```
  void main() {
  double totalBill = 1820;
  int numberOfPeople = 5;

  if (numberOfPeople <= 0) {
    print("Error: Number of people must be greater than 0.");
    return;
  }

  double splitAmount = totalBill / numberOfPeople;

  print("Each person should pay: ${splitAmount}");
}
```
OUTPUT
```
Each person should pay: 364
```
QUESTION 3
```
  void main() {
  List<int> a = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89];

  print("Numbers less than 5:");
  for (int number in a) {
    if (number < 5) {
      print(number);
    }
  }
}
```
OUTPUT
```
Numbers less than 5:
1
1
2
3
```
QUESTION 4
```
  void main() {
  String input = '1,2,3,4,5,5,6,7,8,9,9';

  List<String> numList = input.split(',');

  Set<String> numSet = numList.toSet();

  print("List: $numList");
  print("Set: $numSet");
}
```
OUTPUT
```
 List: [1, 2, 3, 4, 5, 5, 6, 7, 8, 9, 9]
 Set: {1, 2, 3, 4, 5, 6, 7, 8, 9}
```
