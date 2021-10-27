{* Шаблон текстовой страницы *}

{* Канонический адрес страницы *}
{$canonical="/{$page->url}" scope=parent}

<ul class="breadcrumb-navigation">
	<li><a href="/." title="Главная">Главная</a></li>
	<li><span class="ic1 multimage_icons next"></span></li>
	<li><a class="last" href="{$page->url}" title="{$page->header|escape}">{$page->header|escape}</a></li>
	<li><span class="ic2 multimage_icons"></span></li>
	<div class="clear"></div>
</ul>

<!-- Заголовок страницы -->
<h1 data-page="{$page->id}"  class="page_title">{$page->header|escape}</h1>
<div style="line-height:18px;">	
<!-- Тело страницы -->
{$page->body}
</div>