{* Список записей блога *}

{* Канонический адрес страницы *}
{$canonical="/blog" scope=parent}

<ul id="breadcrumbs">
	<li><a title="Главная" href="/blog"><span>Главная</span></a> /</li>
	<li><span>Блог</span></li>
</ul>						

<!-- Заголовок /-->
<h1>{$page->name}</h1>

<div id="newsList">
	{foreach $posts as $post}
	<table class="item">
		<tbody>
			<tr>
				<td>
					<ins>{$post->date|date}</ins>
					<a class="name" href="blog/{$post->url}">{$post->name|escape}</a>
					<p class="newsPreview">{$post->annotation}</p>
				</td>
			</tr>
		</tbody>
	</table>
	{/foreach}
<br>
{include file='pagination.tpl'}
</div>
<link rel="stylesheet" type="text/css" href="design/{$settings->theme|escape}/css/blog.css">	