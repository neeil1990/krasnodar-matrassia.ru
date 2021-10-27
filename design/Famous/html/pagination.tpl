
{* Постраничный вывод *}

{if $total_pages_num>1}

    <!-- Листалка страниц -->
    <div class="pagination-area">
        <ul>
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
            <li><a href="{url page=null}"><i class="fa fa-angle-left"></i></a></li>
        {/if}
        {if $current_page_num>2}
            <li><a href="{url page=$current_page_num-1}"><i class="fa fa-angle-left"></i></a></li>
        {/if}

        {* Ссылка на 1 страницу отображается всегда *}
        {if $current_page_num==1}
            <li><a class="active" href="{url page=null}">1</a></li>
        {else}
            <li><a href="{url page=null}">1</a></li>
        {/if}

        {* Выводим страницы нашего "окна" *}
        {section name=pages loop=$page_to start=$page_from}
            {* Номер текущей выводимой страницы *}
            {$p = $smarty.section.pages.index+1}
            {* Для крайних страниц "окна" выводим троеточие, если окно не возле границы навигации *}
            {if ($p == $page_from+1 && $p!=2) || ($p == $page_to && $p != $total_pages_num-1)}
                {if $p==$current_page_num}
                    <li><a href="javascript:void(0)">...</a></li>
                {else}
                    <li><a href="{url page=$p}">...</a></li>
                {/if}
            {else}
                {if $p==$current_page_num}
                    <li><a class="active" href="#">{$p}</a></li>
                {else}
                    <li><a href="{url page=$p}">{$p}</a></li>
                {/if}
            {/if}
        {/section}

        {* Ссылка на последнююю страницу отображается всегда *}
        {if $current_page_num==$total_pages_num}
            <li><a class="active" href="#">{$total_pages_num}</a></li>
        {else}
            <li><a href="{url page=$total_pages_num}">{$total_pages_num}</a></li>
        {/if}

        {* <a class="modern-page-next" href="{url page=all}">все сразу</a> *}

        {if $current_page_num<$total_pages_num}
            <li><a href="{url page=$current_page_num+1}"><i class="fa fa-angle-right"></i></a></li>
        {/if}
        </ul>
    </div>
    <!-- Листалка страниц (The End) -->
{/if}
