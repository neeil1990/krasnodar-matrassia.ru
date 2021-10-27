
<ul class="breadcrumb-navigation">
	<li><a title="Главная" href="/">Главная</a></li>
	<li><span class="ic1 multimage_icons next"></span></li>
	<li><a title="Сравнение товаров" href="/compare/" class="last">Сравнение товаров</a></li>
	<li><span class="ic2 multimage_icons"></span></li>
	<div class="clear"></div>
</ul>
{if $compare->total>0}
<!-- catalog_compare_result -->
<div id="catalog_compare_result" class="catalog_compare_result clearfix">

<script language="JavaScript">
function toggleCompareDiffProperties(objCheckbox)
{
var arrObj = $('table.compare > tbody > tr').not('.diff').not('.action');

  if( $(objCheckbox).attr('checked') )
  {
    arrObj.hide();
  }
  else
  {
    arrObj.show();
  }
}

// Скрываем/отображаем колонки
function showHideCompareColumn(objInTd, needShow)
{
  var td = $(objInTd).parents('td:first');
  var index = th.index();

  $('table.compare').find('tr.hideable').each(function(rowIndex)
  {
    var td = $(this).find('td').eq(index);
    if(td.length == 0) td = $(this).find('td').eq(index);

    var content = '';//$(td).find('div.hidden').html();
    if(! needShow) content = '<div class="hidden">' + $(td).html() + '</div>&nbsp;';
    else content = $(td).find('div.hidden').html();

    // Нв верхней строке будет кнопочка, чтобы можно было развернуть (это если мы скрываем колонку)
    if(! rowIndex && ! needShow)
    {
      content = '<center><div class="expand" title="Показать скрытый товар" onclick="showHideCompareColumn(this, true); return false"></div></center>' + content;
    }

    $(td).html(content);
  });
}

</script>


	<!--<div class="personal-tabsheader switch_prop_show">
		<div class="personal-tabsheader-tablink">
			<a href="#" class="incative incative-border select js_show_all_props" rel="nofollow">
			<span class="tabbg-center">Все характеристики</span><span class="img-cart multimage_icons"></span></a>
			<a href="#" class="incative incative-border js_show_uniq_props" rel="nofollow"><span class="tabbg-center ">Только различающиеся</span>
			<span class="img-cart multimage_icons"></span></a><div class="clear"></div>
		</div>-->
		<div class="clear"></div>
	</div>
	<div class="around_names">
		<table cellspacing="0" cellpadding="0" border="0" class="names compare">
			<thead><tr><th valign="top">  <label style="cursor: pointer"><input type="checkbox" onclick="toggleCompareDiffProperties(this)"><a> показать <b>только отличия</b></a></label><br /></th></tr></thead>
			<tbody>
				<tr data-groupcode="OSNOVNOE" class="group back1 diff hideable">
				<td valign="top" title="Основное">Основное</td>
				</tr>
				<tr data-pcode="MAKER" data-allempty="N" data-allsame="N" class="property property_code_MAKER diff hideable">
				<td valign="top"><span title="Производитель">Производитель</span></td>
				</tr>
				<tr data-groupcode="uslessproperties" class="group back1 diff hideable">
				<td valign="top" title="Остальные характеристики">Остальные характеристики</td>
				</tr>
				{foreach from=$compare->features key=k item=i}
				<tr data-pcode="{$k|escape}" data-allempty="N" data-allsame="N" class="property property_code_DOSTAVKA_INFO {if $i.diff}diff hideable{/if}">
				<td {if $i.diff}class='diff'{/if} valign="top"><span title="Время доставки">{$k|escape}</span></td>
				</tr>
				{/foreach}
			</tbody>
		</table>
	</div>
	<div data-showintime="4" data-itemw="238" class="main_slider compare_slider">
	{if $compare->total>4}<a href="#" class="main_slider-arrow_prev compare_slider icon multimage_icons left disabled"></a>{/if}
	<div class="main_slider-slider compare_slider">
		<div data-count="7" style="width: 1666px; left: 0px;" class="main_slider-slider_inner compare_slider">
			<table cellspacing="0" cellpadding="0" border="0" class="elements compare">
				<thead>
					<tr class="element">
						{foreach $compare->products as $product}
						<th valign="top">
							<div class="element_info">
								<div class="element_info-picture">
									<a href="products/{$product->url}">
									<img  border="0" alt="" src="{$product->image|resize:160:160}" class="image"></a>
								</div>
								<a href="compare/remove/{$product->id}" class="icon multimage_icons delete_icon" rel="nofollow"></a>
								<div class="catalog-item-name">
									<a title="{$product->name|escape}" href="products/{$product->url}" class="text_fader">{$product->name|escape}</a>
								</div>
								<div class="element_info-price clearfix"><div class="price">{$product->variant->price|convert} {$currency->sign|escape}</div></div>
							<div class="catalog-item-buy_btn">
		{if $product->variants|count > 0}
        <noindex>
          <form class="clearfix variants" name="buy_form" action="cart">
		  <div class="catalog-item-compare">
			{* Не показывать выбор варианта, если он один и без названия *}
			<select name="variant" style='display:none;'>
				{foreach $product->variants as $v}
				<option value="{$v->id}" {if $v->compare_price > 0}compare_price="{$v->compare_price|convert}"  discount="{($v->compare_price-$v->price)|convert}"{/if} price="{$v->price|convert}">
				{$v->name}
				</option>
				{/foreach}
			</select>
			<br>
            </div>

            <input  class="grandibtn1 submit add2basket js_add2basket_link" type="submit" value="В корзину" data-result-text="Товар добавлен в корзину">

            
            </form>
        </noindex>
        {/if}
							</div>
						</th>
						{/foreach}
					</tr>
				</thead>
				<tbody>
					<tr class="group back1 diff hideable" style="height: 33px;">
						<td colspan="7">&nbsp;</td>
					</tr>
					<tr data-pcode="MAKER" data-allempty="N" data-allsame="N" class="property_line property_code_MAKER {if $i.diff}diff hideable{/if}" style="height: 33px;">
						{foreach $compare->products as $product}
						<td data-intvalue="0" class="value"><span title="{$product->brand|escape}">{$product->brand|escape}</span></td>
						{/foreach}
					</tr>
					<tr class="group back1 diff hideable" style="height: 33px;">
						<td colspan="7">&nbsp;</td>
					</tr>
					{foreach from=$compare->features key=k item=i}
					<tr data-pcode="FOR_TAB_SOSTAV" data-allempty="N" data-allsame="N" class="property_line property_code_FOR_TAB_SOSTAV {if $i.diff}diff hideable{/if}">
						{foreach from=$i.items item=ii}
						<td data-intvalue="0" class="value">
							{$ii|strip_tags|truncate:30}
						</td>
						{/foreach}
					</tr>
					{/foreach}
				</tbody>
			</table>
		</div>
	</div>
	{if $compare->total>4}
		<a href="#" class="main_slider-arrow_next compare_slider icon multimage_icons right"></a>
		<div class="slider_buttons_for_tablet">
			<a href="#" class="main_slider-arrow_prev compare_slider"><i class="icon multimage_icons"></i>&nbsp;Назад</a> &nbsp; &nbsp; &nbsp; &nbsp; 
			<a href="#" class="main_slider-arrow_next compare_slider ">Далее&nbsp;<i class="icon multimage_icons"></i></a>
		</div>
		{/if}
	</div>
</div>
</div>
{else}
					Список сравнения пуст
					{/if}
