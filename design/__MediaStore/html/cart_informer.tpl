{* Информера корзины (отдаётся аяксом) *}
                
                  <div class="basket_top_panel-title nowrap">Моя корзина
                  </div>
                  <div id="basket_top_panel-info" class="basket_top_panel-info nowrap">Товаров: 
                    <span class="js_basket_nums">{$cart->total_products} 
                    </span> &nbsp; Сумма: 
                    <span class="js_basket_summa">{$cart->total_price|convert}  {$currency->sign|escape}
                    </span>

                  </div>

