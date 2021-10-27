{* Шаблон текстовой страницы *}

{* Канонический адрес страницы *}
{$canonical="/{$page->url}" scope=parent}

<!-- Breadcrumbs -->
<div class="breadcrumbs">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <ul>
                    <li class="home"><a href="/">Главная</a><span>&raquo;</span></li>
                    <li><strong>{$page->header|escape}</strong></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumbs End -->

<div class="container">
    <div class="row">
        <div class="faq-page">
            <div class="col-xs-12">

                <div class="page-title">
                    <h2>{$page->header|escape}</h2>

                </div>

                {$page->body}

            </div>

        </div>
    </div>
</div>
