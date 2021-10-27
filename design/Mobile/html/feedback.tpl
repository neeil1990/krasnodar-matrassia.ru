{* Страница с формой обратной связи *}

{* Канонический адрес страницы *}
{$canonical="/{$page->url}" scope=parent}

<ul id="breadcrumbs">
	<li><a title="Главная" href="/"><span>Главная</span></a> /</li>
	<li><span>Контакты и адреса</span></li>
</ul>					

<h1>Контакты и адреса</h1>

{$page->body}

{*
<p class="contactLabel">По вопросам <b>приобретения</b> данного <b>готового</b> решения, обращайтесь по телефонам или по адресу электронной почты, указанным ниже.</p>

<ul class="contactList">
	<li>
		<table>
			<tbody><tr>
				<td>
					 &nbsp;<img width="37" height="38" title="cont1.png" src="design/{$settings->theme|escape}/images/cont1.png" alt="cont1.png">
				</td>
				<td>
					 +7 (800) 123-45-77<br>
					 +7 (800) 123-45-88<br>
				</td>
			</tr>
		</tbody></table>
	</li>
	<li>
		<table>
			<tbody><tr>
				<td>
					 &nbsp;<img width="37" height="38" title="cont2.png" src="design/{$settings->theme|escape}/images/cont2.png" alt="cont2.png">
				</td>
				<td>
					 <a href="mailto:info@simpla-template.org.ua">info@simpla.com</a><br>
					 <a href="skype:simpla-template?chat">simpla-template</a><br>
				</td>
			</tr>
		</tbody></table>		
	</li>
	<li>
		<table>
			<tbody><tr>
				<td>
					 &nbsp;<img width="37" height="38" title="cont3.png" src="design/{$settings->theme|escape}/images/cont3.png" alt="cont3.png">
				</td>
				<td>
					 г. Торговый<br>
					 улица Финансовая, д.5&nbsp; &nbsp; &nbsp;
				</td>
			</tr>
		</tbody></table>		
	</li>
	<li>
		<table>
			<tbody><tr>
				<td>
					 &nbsp;<img width="37" height="38" title="cont4.png" src="design/{$settings->theme|escape}/images/cont4.png" alt="cont4.png">
				</td>
				<td>
					Пн-Пт : с 10:00 до 20:00<br>
					 Сб, Вс : выходной<br>
				</td>
			</tr>
		</tbody></table>		
	</li>
</ul>

 <br>
 <br>

<div class="bx-yandex-view-layout">
	<div class="bx-yandex-view-map">
		<div id="BX_GMAP_MAP_yxOBXCX5WY" class="bx-google-map" style="height: 500px; width: 100%;">
			<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d574848.354241179!2d37.63249495!3d55.749792!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sru!2sua!4v1444023960328" width="100%" height="500" frameborder="0" style="border:0" allowfullscreen></iframe>
		</div>
	</div>
</div>
*}

{if $message_sent}
	{$name|escape}, ваше сообщение отправлено.
{else}
<hr>

<h3>Обратная связь</h3>
 <div id="callback">
<form method="post">
	{if $error}
	<div class="message_error">
		{if $error=='captcha'}
		Неверно введена капча
		{elseif $error=='empty_name'}
		Введите имя
		{elseif $error=='empty_email'}
		Введите email
		{elseif $error=='empty_text'}
		Введите сообщение
		{/if}
	</div>
	{/if}
	<div class="mf-name">
		<div class="mf-text">
			Ваше имя<span class="mf-req">*</span>		
		</div>
		<input data-format=".+" data-notice="Введите имя" value="{$name|escape}" name="name" maxlength="255" type="text"/>
	</div>
	<div class="mf-email">
		<div class="mf-text">
			Ваш E-mail<span class="mf-req">*</span>		
		</div>
		<input data-format="email" data-notice="Введите email" value="{$email|escape}" name="email" maxlength="255" type="text"/>
	</div>

	<div class="mf-message">
		<div class="mf-text">
			Сообщение<span class="mf-req">*</span>
		</div>
		<textarea data-format=".+" data-notice="Введите сообщение" rows="5"  value="{$message|escape}" name="message">{$message|escape}</textarea>
	</div>
	<div class="mf-email">
		<div class="mf-text">
			Число<span class="mf-req">*</span>		
		</div>
	<span class="captcha" style="float: left; margin-right: 15px;"><img alt="captcha" src="captcha/image.php?4994"></span> 
	<input type="text" data-notice="Введите капчу" data-format="\d\d\d\d" value="" name="captcha_code" id="comment_captcha" class="input_captcha" style="width: 150px; height: 43px;">
	</div>
	
	<input type="submit" class="submit" value="Отправить" name="feedback">
</form>
</div>
{/if}
<br>		
<link rel="stylesheet" type="text/css" href="design/{$settings->theme|escape}/css/feedback.css">