<form method="get" action="{$config->root_url}/catalog/{$category->url}">


    <div class="block product-price-range ">
        <div class="sidebar-bar-title">
            <div class="h3">Цена</div>
        </div>
        <div class="block-content">
            <div class="slider-range">
                <div
                        data-label-reasult="Ценовой диапазон:"
                        data-min="{$slider_max_min_price->min_price|convert:null:false|floor}"
                        data-max="{$slider_max_min_price->max_price|convert:null:false|ceil}"
                        data-unit="руб" class="slider-range-price" id="slider_price"
                        data-value-min="{if $smarty.get.min_price}{$smarty.get.min_price}{else}{$slider_max_min_price->min_price|convert:null:false|floor}{/if}"
                        data-value-max="{if $smarty.get.max_price}{$smarty.get.max_price}{else}{$slider_max_min_price->max_price|convert:null:false|ceil}{/if}">
                </div>
                <div class="amount-range-price">
                    Ценовой диапазон:
                    {if $smarty.get.min_price}{$smarty.get.min_price}{else}{$slider_max_min_price->min_price|convert:null:false|floor}{/if} руб -
                    {if $smarty.get.max_price}{$smarty.get.max_price}{else}{$slider_max_min_price->max_price|convert:null:false|ceil}{/if} руб
                </div>
                <input type="hidden" class="" id="min_price" data-min-price="{$max_min_price->min_price|convert:null:false|floor}" name="min_price" value="{if $smarty.get.min_price}{$smarty.get.min_price}{else}{$slider_max_min_price->min_price|convert:null:false|floor}{/if}" autocomplete="off">
                <input type="hidden" class="" id="max_price" data-max-price="{$max_min_price->max_price|convert:null:false|ceil}" name="max_price" value="{if $smarty.get.max_price}{$smarty.get.max_price}{else}{$slider_max_min_price->max_price|convert:null:false|ceil}{/if}" autocomplete="off">
            </div>
        </div>
    </div>

    {if $variants_width || $variants_height}
    <div class="block product-price-range ">
        <div class="sidebar-bar-title">
            <div class="h3">Размер&nbsp;</div>
        </div>

        <div class="block-content">
            <div class="slider-range">
                {if $variants_height}
                    <label class="required">Ширина</label>
                    <div class="custom_select">
                        <select class="input form-control" name="height" id="variants_height">
                            <option value="0">0</option>
                            {foreach $variants_height as $h}
                                <option value="{$h->height}" {if $filter.height == $h->height}selected{/if}>{$h->height}</option>
                            {/foreach}
                        </select>
                    </div><br>
                {/if}
                {if $variants_width}
                <label class="required">Длина</label>
                <div class="custom_select">
                    <select class="input form-control" name="width" id="variants_width">
                        <option value="0">0</option>
                        {foreach $variants_width as $w}
                            <option value="{$w->width}" {if $filter.width == $w->width}selected{/if}>{$w->width}</option>
                        {/foreach}
                    </select>
                </div>
                {/if}
            </div>
        </div>
    </div>
    {/if}

    {if $variants_color}
    <div class="block product-price-range ">
        <div class="sidebar-bar-title">
            <div class="h3">Цветовое решение&nbsp;</div>
        </div>
        <div class="block-content">
            <div class="slider-range">
                <label class="required">Цвет</label>
                <div class="custom_select">
                    <select class="input form-control" name="color" id="variants_color">
                        <option></option>
                        {foreach $variants_color as $c}
                            <option value="{$c->color}" {if $smarty.get.color == $c->color}selected{/if}>{$c->color}</option>
                        {/foreach}
                    </select>
                </div><br>
            </div>
        </div>
    </div>
    {/if}


    {if $features}
        {foreach $features as $f}
        <div class="block product-price-range ">
            <div class="sidebar-bar-title">
                <div class="h3">{$f->name}&nbsp;</div>
            </div>
            <div class="block-content">
                <div class="slider-range">
                    <ul class="check-box-list">
                        {foreach $f->options as $k=>$o}
                            <li>
                                <input id="option_{$f->id}_{$k}" type="checkbox" name="{$f->id}[]" value="{$o->value|escape}"{if $o->checked} checked{elseif $o->disabled} disabled{/if}>
                                <label for="option_{$f->id}_{$k}"> <span class="button"></span> {$o->value|escape}<span class="count">{if !$o->checked}({$o->count}){/if}</span> </label>
                            </li>
                        {/foreach}
                    </ul>
                </div>
            </div>
        </div>
        {/foreach}
    {/if}

    <div class="block">
        <div class="block-content">
            <div class="actions">
                <button type="submit" value="Применить" onclick="RSAL_ReplaceProbel();" name="set_filter" id="set_filter" title="Vote" class="button button-vote"><span>Применить</span></button>
                <a type="submit" href="/catalog/{$category->url}" title="Vote" class="button button-vote"><span>Очистить фильтр</span></a>
            </div>
        </div>
    </div>

</form>
