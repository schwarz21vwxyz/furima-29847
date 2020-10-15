window.addEventListener('load', function(){

  
  const price_input = document.getElementById("item-price")
  const Add_tax_price = document.getElementById("add-tax-price")
  const Profit = document.getElementById("profit")


  price_input.addEventListener('input', function(){
    const price = document.getElementById("item-price").value;
    let fee = (price / 10)
    Add_tax_price.innerHTML = fee
    let total = (price - fee)
    Profit.innerHTML = total

  })

})