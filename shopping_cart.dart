// Function to calculate the total price of items
double calculateTotal(List<double> itemPrices, {double taxRate = 0.1}) {
  double total = itemPrices.fold(0, (sum, price) => sum + price);
  return total + (total * taxRate); // Adding tax
}

// Anonymous function to filter items with a price below a certain threshold
List<double> filterItems(List<double> itemPrices, double threshold) {
  return itemPrices.where((price) => price >= threshold).toList();
}

// Higher-order function to apply a discount function on each item
List<double> applyDiscount(List<double> prices, double Function(double) discountFunction) {
  return prices.map(discountFunction).toList();
}

// Recursive function to calculate factorial discount
double calculateFactorialDiscount(int itemsCount) {
  if (itemsCount <= 1) {
    return 1.0;
  }
  return itemsCount * calculateFactorialDiscount(itemsCount - 1);
}

void main() {
  // Example cart with item prices
  List<double> cart = [5.0, 20.0, 15.0, 30.0, 8.0];

  // Filter items that cost more than $10
  List<double> filteredCart = filterItems(cart, 10.0);
  print("Filtered items (prices above \$10): $filteredCart");

  // Applying a 10% discount on all items
  List<double> discountedCart = applyDiscount(filteredCart, (price) => price * 0.9);
  print("Discounted items: $discountedCart");

  // Calculate the total price with a 5% tax
  double totalPrice = calculateTotal(discountedCart, taxRate: 0.05);
  print("Total price after discount and tax: \$${totalPrice.toStringAsFixed(2)}");

  // Applying factorial discount based on the number of items in the cart
  int itemCount = discountedCart.length;
  double factorialDiscount = calculateFactorialDiscount(itemCount) / 100;
  double finalPrice = totalPrice * (1 - factorialDiscount);
  print("Final price after factorial discount: \$${finalPrice.toStringAsFixed(2)}");
}
