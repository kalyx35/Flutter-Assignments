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

!(alt="Screenshot from 2025-01-08 21-27-17")

