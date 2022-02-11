function item_price () {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
    const calcProfit = document.getElementById("profit");
      const calc_value = inputValue * 0.1
      calcProfit.innerHTML = Math.floor(inputValue - calc_value);
  })

}

window.addEventListener('load', item_price);