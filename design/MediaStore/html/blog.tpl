{* Список записей блога *}

{* Канонический адрес страницы *}
{$canonical="/blog" scope=parent}

<ul class="breadcrumb-navigation">
  <li>
  <a href="./" title="Главная">Главная</a>
  </li>
  <li>
  <span class="ic1 multimage_icons next">
  </span>
  </li>
  <li>
  <a class="last" href="/blog/" title="Блог">Блог</a>
  </li>
  <li>
  <span class="ic2 multimage_icons">
  </span>
  </li>
  <div class="clear">
  </div>
</ul>

<!-- Заголовок /-->
<h1>{$page->name}</h1>

{include file='pagination.tpl'}

<div class="news-list">
	{foreach $posts as $post}
	  <div class="news-item clearfix">
    <div class="news-item-name">
    <b>{$post->date|date}</b><br />
      <a  data-post="{$post->id}" href="blog/{$post->url}">{$post->name|escape}</a>
    </div>
    <div class="news-item-prev_text">
   {$post->annotation}
      <div class="news-item-link2detail">
        <a  data-post="{$post->id}" href="blog/{$post->url}">Подробнее
          <i class="icon multimage_icons"></i></a>
      </div>
    </div>
  </div>
	{/foreach}
</div>
<!-- Статьи #End /-->    

{include file='pagination.tpl'}
          