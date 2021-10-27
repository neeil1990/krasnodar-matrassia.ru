{* Страница отдельной записи блога *}

{* Канонический адрес страницы *}
{$canonical="/blog/{$post->url}" scope=parent}

<ul id="breadcrumbs">
	<li><a title="Главная" href="/"><span>Главная</span></a> /</li>
	<li><a title="Блог" href="/blog/"><span>Блог</span></a> /</li>
	<li><span>{$post->name|escape}</span></li>
</ul>
	
<div id="newsDetail">
	<h1>{$post->name|escape}</h1>
	<ins>{$post->date|date}</ins>
	<!-- Тело поста /-->
	{$post->text}
	<!-- Соседние записи /-->
<div id="back_forward">
	{if $prev_post}
		←&nbsp;<a class="prev_page_link" href="blog/{$prev_post->url}">{$prev_post->name}</a>
	{/if}
	{if $next_post}
		<a class="next_page_link" href="blog/{$next_post->url}">{$next_post->name}</a>&nbsp;→
	{/if}
</div>
</div>

<div class="collapsedBlock" id="reviews">
		<h2>Отзывы:</h2>
		<div class="collapsedContent opened">
			{foreach $comments as $comment}
			<div class="review">
				<span class="reviewer">{$comment->name|escape} {if !$comment->approved}ожидает модерации</b>{/if}<small>{$comment->date|date}, {$comment->date|time}</small></span>
				<div class="impressions"><p>{$comment->text|escape|nl2br}</p></div>
			</div>
			{/foreach}
			<div id="newReview">
				<h2>Добавить отзыв</h2>
				<form class="comment_form" method="post">
					<div class="left">
						<label>Общие впечатления:</label>
						<textarea  id="comment_text" name="text" data-format=".+" data-notice="Введите комментарий" cols="45" rows="10"></textarea>   
						<label>Представьтесь:</label>
						<input type="text" id="comment_name" name="name" value="{$comment_name}" data-format=".+" data-notice="Введите имя">
						<label for="comment_captcha">Число:</label>
						<div style="float: left; margin-right: 15px;" class="captcha"><img src="captcha/image.php?{math equation='rand(10,10000)'}" alt='captcha'/></div> 
						<input style="width: 150px; height: 43px;" class="input_captcha" id="comment_captcha" type="text" name="captcha_code" value="" data-format="\d\d\d\d" data-notice="Введите капчу"/>
						<input class="submit_input" type="submit" name="comment" value="Отправить" />
					</div>
				</form>
			</div>   
		</div>
	</div>


<a id="newsBack" href="/blog/">Возврат к списку</a>
<link rel="stylesheet" type="text/css" href="design/{$settings->theme|escape}/css/post.css">	
