window.addEventListener('load', function tax(item_price){
    const addTaxDom = document.getElementById("add-tax-price");
    const Value = addTaxDom
    const priceInput = document.getElementById("item-price")
    priceInput.addEventListener("keyup", () => {
      const price = priceInput.value
      addTaxDom.innerHTML = Math.floor(price / 10);
      const addProfitDom = document.getElementById("profit");
      addProfitDom.innerHTML = price - (price / 10)
    });
    })