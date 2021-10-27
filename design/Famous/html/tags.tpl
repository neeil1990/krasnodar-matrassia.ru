{if $tags}
<div class="block popular-tags-area ">
    <div class="sidebar-bar-title">
        <div class="h3">Теги</div>
    </div>
    <div class="tag">
        <ul>
            {foreach $tags as $tag}
            <li><a href="products?keyword={$tag}">{$tag}</a></li>
            {/foreach}
        </ul>
    </div>
</div>
{/if}