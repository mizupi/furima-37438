function item_price () {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const calc_value = Math.floor(inputValue * 0.1);
    addTaxDom.innerHTML = calc_value;
    const calcProfit = document.getElementById("profit");
      calcProfit.innerHTML = Math.floor(inputValue - calc_value);
  })

}

window.addEventListener('load', item_price);