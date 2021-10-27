<form method="get" action="{$config->root_url}/catalog/{$category->url}">                 
<div id="smartFilter">
	<div class="filtren">
		<ul>
			<li class="lvl1 lvl1_slide back2">
				<a class="prop_name showchild" data-propid="1" href="#ul_1">Цена&nbsp;<span class="icon multimage_icons icon-minus">&nbsp;</span></a> 
				<ul class="lvl2" id="ul_1" style="display: block;">
					<div class="price_filter">
						<div class="price_slider">
							<div class="input_price">
								<label for="min_price">от</label>
								<input type="text" class="keypress" id="min_price" data-min-price="{$max_min_price->min_price|convert:null:false|floor}" name="min_price" value="{if $smarty.get.min_price}{$smarty.get.min_price}{else}0.00{/if}" autocomplete="off">
								<label for="max_price">до</label>
								<input type="text" class="keypress" id="max_price" data-max-price="{$max_min_price->max_price|convert:null:false|ceil}" name="max_price" value="{if $smarty.get.max_price}{$smarty.get.max_price}{else}0.00{/if}" autocomplete="off">
								{$currency->sign|escape}{*<input id="price_submit" style="display: none;" type="submit" value="ОК">*}
							</div>
							<div id="slider_price" class="ui-slider ui-slider-horizontal ui-widget ui-widget-content" data-slider-min-range="{$slider_max_min_price->min_price|convert:null:false|floor}" data-slider-max-range="{$slider_max_min_price->max_price|convert:null:false|ceil}">
								<div class="ui-slider-range ui-widget-header ui-widget-header-bar"></div>
								<div class="ui-slider-range ui-widget-header ui-widget-header-left ui-widget-header-hidden"></div>
								<div class="ui-slider-range ui-widget-header ui-widget-header-right ui-widget-header-hidden"></div>
								<div class="ui-slider-range ui-widget-header"></div>
								<a class="ui-slider-handle ui-state-default ui-state-left" href="#"></a>
								<a class="ui-slider-handle ui-state-default ui-state-right" href="#"></a>
							</div>
						</div>
					</div>
				</ul>
			</li>
			{if $category->brands}
			<li class="lvl1 back2 lvl1_simple">
				<a title="Производитель" class="prop_name showchild" data-code="MAKER" data-propid="17" href="#ul_17">Производитель&nbsp;<span class="icon multimage_icons icon-minus">&nbsp;</span></a> 
				<ul class="lvl2" id="ul_17" style="display: block;">
					{foreach $category->brands as $b}
						<div for="brand_{$b->id}" class="props marga">
							<li class="f_li lvl2">
								<input id="brand_{$b->id}" style="display:none;" type="checkbox" name="brand_id[]" onclick="smartFilter.click(this);" class="lvl2_checkbox" value="{$b->id}"{if $b->checked} checked{elseif $b->disabled} disabled{/if}>
								<label for="brand_{$b->id}"><span>{$b->name|escape} <i>{if !$b->checked}({$b->count}){/if}</i></span></label>
							</li>
						</div>
					{/foreach}
				<div class="clear"></div>
				</ul>
				<div class="clear"></div>
			</li>
			{/if}
			{* Фильтр по свойствам *}
			{if $features}
					{foreach $features as $f}
					<li class="lvl1 lvl1_slide back2">
						<a href="#ul_{$f->id}" data-propid="1" class="prop_name showchild">{$f->name}&nbsp;
							<span class="icon multimage_icons icon-minus">&nbsp;</span>
						</a> 
					  <ul id="ul_{$f->id}" class="lvl2"  {if !$smarty.get[$f@key]}style="display:none;"{/if}>
						{foreach $f->options as $k=>$o}
							<div for="option_{$f->id}_{$k}" class="props marga">
							<li class="f_li lvl2">
								<input style="display:none;" id="option_{$f->id}_{$k}" type="checkbox" name="{$f->id}[]" value="{$o->value|escape}"{if $o->checked} checked{elseif $o->disabled} disabled{/if}>
								<label for="option_{$f->id}_{$k}"><span>{$o->value|escape}<i>{if !$o->checked}({$o->count}){/if}</i></span></label>
							</li>
							</div>
						{/foreach}                            
					  </ul>
					</li>
				{/foreach}                            
			{/if}            
			<li class="smartbuttons back2">
				<a href="#" class="multimage_bottom smartlink_set btn1 apply">Применить</a>
				<a href="/catalog/{$category->url}" class="smartlink_reset">Очистить фильтр</a>
				<input type="submit" value="Применить" onclick="RSAL_ReplaceProbel();" name="set_filter" id="set_filter" class="none1">
				<input type="submit" value="Очистить фильтр" name="del_filter" id="del_filter" class="none1">
			</li>                
		</ul>
	</div>
</div>
<span class="count_products_search"></span>
</form>	
<link href="{$config->root_url}/design/{$settings->theme|escape}/css/filter.css" rel="stylesheet" type="text/css" media="screen"/>