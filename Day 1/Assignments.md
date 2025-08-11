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
}```
![bg](https://github.com/user-attachments/assets/6915b699-ab4b-42e8-a13b-ca1c8529bef1)
