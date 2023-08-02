function pricePreview() {
  const price = document.getElementById("item-price");
  const commission = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  const commissionRate = 0.1;

  price.addEventListener('input', () => {
    const priceValue = price.value;
    const commissionValue = Math.floor(priceValue * commissionRate);
    const profitValue = priceValue - commissionValue;

    commission.innerHTML = commissionValue.toLocaleString();
    profit.innerHTML = profitValue.toLocaleString();
  });
};

window.addEventListener('turbo:load', pricePreview());