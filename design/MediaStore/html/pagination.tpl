{* Постраничный вывод *}

{if $total_pages_num>1}
{* Скрипт для листания через ctrl → *}
{* Ссылки на соседние страницы должны иметь id PrevLink и NextLink *}
<script type="text/javascript" src="js/ctrlnavigate.js"></script>           

<!-- Листалка страниц -->
<div class="modern-page-navigation">
	
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


	{if $current_page_num==2}
	<a class="modern-page-previous" href="{url page=null}"><i class="icon multimage_icons"></i>Пред.</a>{/if}
	{if $current_page_num>2}
	<a class="modern-page-previous" href="{url page=$current_page_num-1}"><i class="icon multimage_icons"></i>Пред.</a>{/if}

	{* Ссылка на 1 страницу отображается всегда *}
	{if $current_page_num==1}
                      <span class="modern-page-first modern-page-current">1
                        <span class="img-cart multimage_icons">
                        </span>
                      </span>
                      {else}	
	<a  class="number" href="{url page=null}">1</a>
	{/if}
	
	{* Выводим страницы нашего "окна" *}	
	{section name=pages loop=$page_to start=$page_from}
		{* Номер текущей выводимой страницы *}	
		{$p = $smarty.section.pages.index+1}	
		{* Для крайних страниц "окна" выводим троеточие, если окно не возле границы навигации *}	
		{if ($p == $page_from+1 && $p!=2) || ($p == $page_to && $p != $total_pages_num-1)}
	{if $p==$current_page_num}
	                      <span class="modern-page-first modern-page-current">...
                        <span class="img-cart multimage_icons">
                        </span>
                      </span>
	{else}
		<a class="number" href="{url page=$p}">...</a>
		{/if} 
		{else}
	{if $p==$current_page_num}
	                      <span class="modern-page-first modern-page-current">{$p}
                        <span class="img-cart multimage_icons">
                        </span>
                      </span>
	{else}
		<a class="number" href="{url page=$p}">{$p}</a>
		{/if} 		
		{/if}
	{/section}

	{* Ссылка на последнююю страницу отображается всегда *}
	{if $current_page_num==$total_pages_num}
                      <span class="modern-page-first modern-page-current">{$total_pages_num}
                        <span class="img-cart multimage_icons">
                        </span>
                      </span>	
	{else}
	<a  class="number"  href="{url page=$total_pages_num}">{$total_pages_num}</a>
	{/if}
	
	{* <a class="modern-page-next" href="{url page=all}">все сразу</a> *}

	{if $current_page_num<$total_pages_num}

	<a class="modern-page-next" href="{url page=$current_page_num+1}">След.
                        <i class="icon multimage_icons"></i></a>{/if}
	
</div>
<!-- Листалка страниц (The End) -->
{/if}
