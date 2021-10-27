{$meta_title = "Сравнение товаров" scope=parent}

<!-- Breadcrumbs -->
<div class="breadcrumbs">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <ul>
                    <li class="home"><a href="/">Главная</a><span>&raquo;</span></li>
                    <li><strong>Сравнение товаров</strong></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumbs End -->

{if $compare->total>0}

    <!-- Main Container -->
    <section class="main-container col1-layout">
        <div class="main container">
            <div class="col-main">
                <div class="compare-list">
                    <div class="page-title">
                        <h2>Сравнение товаров</h2>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-bordered table-compare">
                            <tr>
                                <td class="compare-label">Изображение</td>
                                {foreach $compare->products as $product}
                                <td class="compare-pro">
                                    <a href="products/{$product->url}">
                                        <img src="{$product->image|resize:160:160}" alt="Product">
                                    </a>
                                </td>
                                {/foreach}
                            </tr>
                            <tr>
                                <td class="compare-label">Название</td>
                                {foreach $compare->products as $product}
                                <td><a href="products/{$product->url}">{$product->name}</a></td>
                                {/foreach}
                            </tr>
                            <tr>
                                <td class="compare-label">Цена</td>
                                {foreach $compare->products as $product}
                                <td class="price">{$product->variant->price|convert} {$currency->sign|escape}</td>
                                {/foreach}

                            </tr>

                            {foreach from=$compare->features key=k item=i}
                            <tr>
                                <td class="compare-label">{$k}</td>
                                {foreach from=$i.items item=ii}
                                <td>{$ii|strip_tags}</td>
                                {/foreach}
                            </tr>
                            {/foreach}


                            <tr>
                                <td class="compare-label"></td>
                                {foreach $compare->products as $product}
                                <td class="action">
                                    <form class="" name="buy_form" action="cart">
                                    {* Не показывать выбор варианта, если он один и без названия *}
                                    <select name="variant" style='display:none;'>
                                        {foreach $product->variants as $v}
                                            <option value="{$v->id}" {if $v->compare_price > 0}compare_price="{$v->compare_price|convert}"  discount="{($v->compare_price-$v->price)|convert}"{/if} price="{$v->price|convert}">
                                                {$v->name}
                                            </option>
                                        {/foreach}
                                    </select>
                                    <button type="submit" class="add-cart button button-sm"><i class="fa fa-shopping-basket"></i></button>
                                    </form>
                                    <form action="compare/remove/{$product->id}">
                                        <button type="submit" class="button button-sm"><i class="fa fa-close"></i></button>
                                    </form>
                                </td>
                                {/foreach}
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>


{else}
    Список сравнения пуст
{/if}