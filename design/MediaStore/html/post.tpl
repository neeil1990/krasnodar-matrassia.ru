{* Страница отдельной записи блога *}

{* Канонический адрес страницы *}
{$canonical="/blog/{$post->url}" scope=parent}

<ul class="breadcrumb-navigation">
	<li><a title="Главная" href="/">Главная</a></li>
	<li><span class="ic1 multimage_icons next"></span></li>
	<li><a title="Сравнение товаров" href="blog/{$post->url}" class="last">{$post->name|escape}</a></li>
	<li><span class="ic2 multimage_icons"></span></li>
	<div class="clear"></div>
</ul>
<!-- Заголовок /-->
<h1 data-post="{$post->id}">{$post->name|escape}</h1>
<b>{$post->date|date}</b>
<br /><br />
<!-- Тело поста /-->
{$post->text}
<br />
<p><a class="news-back_link" href="/blog/"><i class="icon multimage_icons"></i>Возврат к списку</a></p>
<!-- Комментарии -->
<div id="comments">
	<h2>Комментарии</h2>
	{if $error}
		<div class="message_error">
			{if $error=='captcha'}
			Неверно введена капча
			{elseif $error=='empty_name'}
			Введите имя
			{elseif $error=='empty_comment'}
			Введите комментарий
			{/if}
		</div>
	{/if}
	<div class="catalog-element-reviews">
		<div id="fancyboxreviewform" style="display:none;">   
			<div>
				<div class="popup">
					<div class="popup_head back0">Оставить отзыв</div>
					<div class="popup_dashed">
						<div class="popup_body">
							<div class="answer_form">
								<!--Форма отправления комментария-->	
								<form method="post" class="reviews-form clearfix">
									<div>
										<input type="text" class="textinput40 multimage_backs textinput_author" id="REVIEW_AUTHOR" name="name" value="{$comment_name}" data-format=".+" data-notice="Введите имя" placeholder="Ваше имя">
										<textarea class="textareainput textareainput_comment multimage_backs" id="textareaMsgComment" placeholder="Комментарий:" name="text" data-format=".+" data-notice="Введите комментарий">{$comment_text}</textarea><br><br>
										<div class="captcha">
											<input class="textinput40 multimage_backs textinput_captcha" type="text"  name="captcha_code" value="" data-format="\d\d\d\d" data-notice="Введите капчу" placeholder="Символы на картинке">
											<img class="captcha_image" src="captcha/image.php?{math equation='rand(10,10000)'}" alt="Защита от автоматических сообщений" >
										</div><br>
									</div>
									<input class="btn2" name="comment" id="submitForEeview" type="submit" value="Отправить" tabindex="2">
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div>
			<div id="forum_topic_list" class="reviews-block-button clearfix"><a class="js_fancy_window btn2" href="#fancyboxreviewform">Оставить отзыв</a></div>
			{if $comments}  
				<div class="reviews-block-container reviews-reviews-block-container">
					<div class="reviews-block-outer">
						<div class="reviews-block-inner">
							{foreach $comments as $comment}
								<a name="comment_{$comment->id}"></a>   
								<table cellspacing="0" border="0" class="reviews-post-table reviews-post-first reviews-post-last reviews-post-{if $comment@iteration%2 == 0}even{else}odd{/if} " id="message21">
									<thead>
										<tr>
											<td>
											  <div class="poster">
												<div class="icon multimage_icons profil_icon"></div>
												<b class="poster_name">{$comment->name|escape}</b>{if !$comment->approved}ожидает модерации{/if}
												<span class="poster_rating"></span>
												<span class="message-post-date">{$comment->date|date}, {$comment->date|time}</span>
												<div class="clear"></div>
											  </div>
										  </td>
										</tr>
									</thead>
									<tbody>
										  <tr>
											<td>
												<div class="reviews-text">
													<div class="message_text_comment"><b>Комментарий:</b>{$comment->text|escape|nl2br}</div>
												</div>
											</td>
										  </tr>
									</tbody>
								</table><br/>
							{/foreach}
						</div>
					</div>
				</div> 
			{else}
				<p><font class="errortext">Тут еще никто ничего не писал, стань первым!</font></p>
			{/if}

		</div>
	</div>	
</div>
<!-- Комментарии (The End) -->