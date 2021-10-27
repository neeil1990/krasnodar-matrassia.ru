<form id="smartFilterForm" method="GET"  action="{$config->root_url}/catalog/{$category->url}">
	<div id="smartFilter">
		<span class="hd2">Выбор по параметрам:</span>
		<ul>
			<li class="lvl1"><a class="hd3">Базовая цена</a>
				<ul id="slider_price">
					<li class="lvl2">
						<div id="sl_1" class="rangeSlider">
							<label>От</label><input type="text" onchange="smartFilter.keyup(this)"  class="keypress" id="min_price" data-min-price="{$max_min_price->min_price|convert:null:false|floor}" name="min_price" value="{if $smarty.get.min_price}{$smarty.get.min_price}{else}{$max_min_price->min_price|convert:null:false|floor}{/if}" autocomplete="off">
							<label>До</label><input type="text" onchange="smartFilter.keyup(this)" class="keypress" id="max_price" data-max-price="{$max_min_price->max_price|convert:null:false|ceil}"   name="max_price" value="{if $smarty.get.max_price}{$smarty.get.max_price}{else}{$max_min_price->max_price|convert:null:false|ceil}{/if}" autocomplete="off">
						</div>
					</li>
				</ul>
			</li>
			<li class="lvl1"> <a class="hd3">Особбые</a>
				<ul id="ul_1172">
					<li class="lvl2 {if $discounted->disabled}lvl2_disabled{/if}"><div style="position:relative;" {if $discounted->disabled}class="disabled"{/if}><div style="width:15px;height:15px;" class="electroCheck_div{if $discounted->checked}_active{/if}"></div> <input type="checkbox" data-class="electroCheck_div" class="electroCheck" id="discounted" name="discounted" value="1" style="opacity: 0;" {if $discounted->checked} checked{elseif $discounted->disabled} disabled{/if}><label for="discounted">Акционные <i>{if !$discounted->checked}({$discounted->count}){/if}</i></label> </div></li>
					<li class="lvl2 {if $featured->disabled}lvl2_disabled{/if}"><div style="position:relative;" {if $featured->disabled}class="disabled"{/if}><div style="width:15px;height:15px;" class="electroCheck_div{if $featured->checked}_active{/if}"></div> <input type="checkbox" data-class="electroCheck_div" class="electroCheck" id="featured" name="featured" value="1" style="opacity: 0;" {if $featured->checked} checked{elseif $featured->disabled} disabled{/if}><label for="featured">Рекомендуемые <i>{if !$featured->checked}({$featured->count}){/if}</i></label> </div></li>
				</ul>
			</li>
			{if $category->brands}
				<li class="lvl1"><a class="hd3">Производитель (справочник)</a>
					<ul id="ul_2">
						{foreach $category->brands as $b}
							<li class="lvl2 {if $b@iteration > 5}off{/if} {if $b->disabled}lvl2_disabled{/if}"><div {if $b->disabled}class="disabled"{/if} style="position:relative;"><div style="width:15px;height:15px;" class="electroCheck_div{if $b->checked}_active{/if}"></div> 
							<input type="checkbox" data-class="electroCheck_div"  class="electroCheck" id="brand_{$b->id}" name="brand_id[]" value="{$b->id}" style="opacity: 0;" {if $b->disabled}disabled=""{/if} {if $b->checked}checked="checked"{/if}><label for="brand_{$b->id}">{$b->name|escape} <i>{if !$b->checked}({$b->count}){/if}</i></label></div></li>
						{/foreach}
					</ul>
					{if $b@iteration > 5}<a class="showALL" href="#">Показать все</a>{/if}
				</li>
			{/if}
			{if $features}
			{foreach $features as $f}
			<li class="lvl1"> <a class="hd3">{$f->name}</a>
				<ul id="ul_{$f->id}">
					{foreach $f->options as $k=>$o}
					<li class="lvl2 {if $o@iteration > 5}off{/if} {if $o->disabled}lvl2_disabled{/if}">
					<div {if $o->disabled}class="disabled"{/if} style="position:relative;"><div style="width:15px;height:15px;" class="electroCheck_div{if $o->checked}_active{/if}"></div> 
					<input type="checkbox" data-class="electroCheck_div" class="electroCheck" id="option_{$f->id}_{$k}"  name="{$f->id}[]" value="{$o->value|escape}" style="opacity: 0;" {if $o->disabled}disabled=""{/if} {if $o->checked}checked="checked"{/if}><label for="option_{$f->id}_{$k}">{$o->value|escape} <i>{if !$o->checked}({$o->count}){/if}</i></label> </div></li>
				{/foreach}
				</ul>
				{if $o@iteration > 5}<a class="showALL" href="#">Показать все</a>{/if}
			</li>
			{/foreach}
			{/if}
		</ul>
		<ul id="smartFilterControls">
			<li><a id="set_filter"  href="javascript:void(0)" onclick="$('#filter form').submit();"><img alt="Показать" src="design/{$settings->theme|escape}/images/filter.png">Показать</a></li>
			<li><a id="del_filter" href="catalog/{$category->url}"><img alt="Сбросить" src="design/{$settings->theme|escape}/images/clear.png">Сбросить</a></li>
		</ul>
	</div>
</form>
<script type="text/javascript">
	var LANG = {
		"SHOW_ALL"    :  "Показать все",
		"HIDE_ALL"    :  "Скрыть",
		};
</script>