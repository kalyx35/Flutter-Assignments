QUESTION 1
```
double calculatePerPerson(double total, double tipPercent, int people) {
  double tipAmt = total*tipPercent/100;
  print('Tip Amount: $tipAmt');
  print('Total Amount: ${tipAmt+total}');
  String amt = ((total+tipAmt)/people).toStringAsFixed(2);
  double amt2 = double.parse(amt);
  return amt2;
}
void main() {
  double t = 1000.0;
  double tp = 5.0;
  int p = 5;
  double amt = calculatePerPerson(t,tp,p);
  print('Amount to be paid per person: $amt');
}
```
OUTPUT
```
Tip Amount: 50
Total Amount: 1050
Amount to be paid per person: 210
```
QUESTION 2
```
void main() {
  List<Map<String, dynamic>> movies = [
    {'movieName': 'Inception', 'ticketsBooked': 150, 'pricePerTicket': 12.50},
    {'movieName': 'The Matrix', 'ticketsBooked': 200, 'pricePerTicket': 10.00},
    {'movieName': 'Interstellar', 'ticketsBooked': 180, 'pricePerTicket': 13.75,},
    {'movieName': 'Pulp Fiction', 'ticketsBooked': 90, 'pricePerTicket': 9.50},
  ];
  double grandTotal = 0.0;
  for (var movie in movies) {
    int ticketsBooked = movie['ticketsBooked'] as int;
    double pricePerTicket = movie['pricePerTicket'] as double;
    double totalCost = ticketsBooked * pricePerTicket;
    movie['totalCost'] = totalCost;
    grandTotal += totalCost;
  }
  for (var movie in movies) {
    print('Movie: ${movie['movieName']}');
    print('  Tickets Booked: ${movie['ticketsBooked']}');
    print('  Price per Ticket: \$${movie['pricePerTicket']}');
    print('  Total Cost: \$${movie['totalCost']?.toStringAsFixed(2)}');
    print('');
  }
  print('Grand Total: \$$grandTotal');
}
```
OUTPUT
```
Movie: Inception
  Tickets Booked: 150
  Price per Ticket: $12.5
  Total Cost: $1875.00

Movie: The Matrix
  Tickets Booked: 200
  Price per Ticket: $10
  Total Cost: $2000.00

Movie: Interstellar
  Tickets Booked: 180
  Price per Ticket: $13.75
  Total Cost: $2475.00

Movie: Pulp Fiction
  Tickets Booked: 90
  Price per Ticket: $9.5
  Total Cost: $855.00

Grand Total: $7205
```
