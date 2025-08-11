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

!(<img width="299" height="271" alt="Screenshot from 2025-01-08 21-27-17" src="https://github.com/user-attachments/assets/dcb28f14-f0f6-429a-8a46-a4000228b02a" />)

