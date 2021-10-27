<section class="blog_post">
    <div class="container">

        <!-- row -->
        <div class="row">

            <!-- Center colunm-->
            <div class="center_column col-xs-12 col-sm-12" id="center_column">
                <div class="page-title">
                    <h2>{$page->name}</h2>
                </div>
                <ul class="blog-posts">

                    {foreach $posts as $post}
                        <li class="post-item wow fadeInUp">
                            <article class="entry">
                                <div class="row">
                                    <div class="col-sm-4">
                                        <div class="entry-thumb image-hover2">
                                            <a href="offer/{$post->url}">
                                                {if preg_match('/src="(.*?)"/i', $post->annotation, $matches)}
                                                    <figure><img src="{$matches[1]}" alt="{$post->name|escape}"></figure>
                                                {/if}
                                            </a>
                                        </div>
                                    </div>
                                    <div class="col-sm-8">
                                        <h3 class="entry-title"><a href="offer/{$post->url}">{$post->name|escape}</a></h3>
                                        <div class="entry-meta-data">
                                            <span class="cat"> <i class="pe-7s-folder"></i>&nbsp; <a href="offer">{$page->name} </a> </span>
                                            <span class="date"><i class="pe-7s-date"></i>&nbsp; {$post->date|date}</span>
                                        </div>
                                        <div class="entry-excerpt">{$post->annotation|strip_tags}</div>
                                        <div class="entry-more"> <a href="offer/{$post->url}" class="button"> Подробнее &nbsp; <i class="fa fa-angle-double-right"></i></a> </div>
                                    </div>
                                </div>
                            </article>
                        </li>
                    {/foreach}
                </ul>
                <div class="sortPagiBar">
                    {include file='pagination.tpl'}
                </div>
            </div>
            <!-- ./ Center colunm -->
        </div>
        <!-- ./row-->
    </div>
</section>
<!-- Main Container End -->
