{* Постраничный вывод *}

{if $total_pages_num>1}
{* Скрипт для листания через ctrl → *}
{* Ссылки на соседние страницы должны иметь id PrevLink и NextLink *}
<script type="text/javascript" src="js/ctrlnavigate.js"></script>           

<!-- Листалка страниц -->
<div class="pagination">
	
	{* Количество выводимых ссылок на страницы *}
	{$visible_pages = 11}

	{* По умолчанию начинаем вывод со страницы 1 *}
	{$page_from = 1}
	
	{* Если выбранная пользователем страница дальше середины "окна" - начинаем вывод уже не с первой *}
	{if $current_page_num > floor($visible_pages/2)}
		{$page_from = max(1, $current_page_num-floor($visible_pages/2)-1)}
	{/if}	
	
	{* Если выбранная пользователем страница близка к концу навигации - начинаем с "конца-окно" *}
	{if $current_page_num > $total_pages_num-ceil($visible_pages/2)}
		{$page_from = max(1, $total_pages_num-$visible_pages-1)}
	{/if}
	
	{* До какой страницы выводить - выводим всё окно, но не более ощего количества страниц *}
	{$page_to = min($page_from+$visible_pages, $total_pages_num-1)}

	{if $current_page_num==2}<a class="prev" href="{url page=null}">Назад ({$current_page_num-1} стр)</a>{/if}
	{if $current_page_num>2}<a class="prev" href="{url page=$current_page_num-1}">Назад ({$current_page_num-1}  стр)</a>{/if}
	{if $current_page_num<$total_pages_num}<a class="next" href="{url page=$current_page_num+1}">Вперед ({$current_page_num+1}  стр)</a>{/if}
	<a class="next" href="{url page=all}">все сразу</a>
	<span class="bx_wsnw">Товаров: {{$products|count}}</span>
</div>
<!-- Листалка страниц (The End) -->
{/if}
