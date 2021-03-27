window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const tax= inputValue * 0.1;
    const profit = document.getElementById("profit");
    addTaxDom.innerHTML =tax;
    profit.innerHTML = inputValue - tax;
 })
});