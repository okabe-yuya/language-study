const someOrder = {
  items: [
      {name: "apple", price: 8, quantity: 8},
      {name: "banana", price: 10, quantity: 5},
      {name: "grape", price: 14, quantity: 10, shipping: true},
  ]
}

const orderTotal = (order) => {
  const totalItems = order.items
      .filter(x => !x.shipping)
      .reduce((prev, next) => prev.price + next.price);
  const shippingItem = order.items.find(x => !!x.shipping);
  const shipping = totalItems > 20 ? 0 : shippingItem.price;
  return totalItems + shipping
}

result = orderTotal(someOrder);
console.log(result === 32);

//クソ便利な置き換えを発見
console.log(null || 4)
console.log(undefined || 4)