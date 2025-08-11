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

<img width="614" height="493" alt="image" src="https://github.com/user-attachments/assets/aa955a19-4b67-470f-b276-e442e9d55e6e" />
