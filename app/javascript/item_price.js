window.addEventListener('load', function(){
  let priceInput = document.getElementById("item-price")

  priceInput.addEventListener('input', function(){
    console.log(priceInput);
    const inputValue = priceInput.value;
  
    
    let addTaxDom = document.getElementById("add-tax-price")
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1)

    let profitDom = document.getElementById("profit")
    profitDom.innerHTML = Math.floor(inputValue * 0.9)
  })

})





