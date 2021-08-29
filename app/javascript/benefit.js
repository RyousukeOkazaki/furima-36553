function benefit (){
  const itemPrice = document.getElementById("item-price");
  const tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
    itemPrice.addEventListener("input", function(){
      const inputValue = itemPrice.value;
      tax.innerHTML = Math.floor(inputValue * 0.1)
      profit.innerHTML = inputValue - tax.innerHTML
    })
};

window.addEventListener('load', benefit);
