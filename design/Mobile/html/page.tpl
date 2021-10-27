{* Шаблон текстовой страницы *}

{* Канонический адрес страницы *}
{$canonical="/{$page->url}" scope=parent}

<ul id="breadcrumbs">
	<li><a title="Главная" href="/"><span>Главная</span></a> /</li>
	<li><span>{$page->header|escape}</span></li>
</ul>

<!-- Заголовок страницы -->
<h1 data-page="{$page->id}">{$page->header|escape}</h1>

<!-- Тело страницы -->
{$page->body}