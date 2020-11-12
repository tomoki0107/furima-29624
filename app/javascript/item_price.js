function profitCaluclation() {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue / 10);
    const profitNum = document.getElementById("profit");
    profitNum.innerHTML = Math.floor(inputValue - addTaxDom.innerHTML);
  })
}
window.addEventListener('load', profitCaluclation)