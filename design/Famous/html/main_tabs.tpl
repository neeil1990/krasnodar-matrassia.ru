<div class="home-tab">
    <div class="tab-title text-left">
        <h2>Лучшие предложения</h2>
        <ul class="nav home-nav-tabs home-product-tabs">
            <li class="active"><a href="#tab_all" data-toggle="tab" aria-expanded="false">Рекомендуемые</a></li>
            <li><a href="#tab_recomended" data-toggle="tab" aria-expanded="false">Новинки</a></li>
        </ul>
    </div>
    <div id="productTabContent" class="tab-content">
        <div class="tab-pane active in" id="tab_all">
            <div class="featured-pro">
                <div class="slider-items-products">
                    <div id="computer-slider" class="product-flexslider hidden-buttons">
                        <div class="slider-items slider-width-col4">
                            {* Рекомендуемые товары *}
                            {get_featured_products var=featured_products}
                            {if $featured_products}
                                {foreach $featured_products as $product}
                                    {include file='product_block.tpl'}
                                {/foreach}
                            {/if}
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="tab-pane fade" id="tab_recomended">
            <div class="top-sellers-pro">
                <div class="slider-items-products">
                    <div id="smartphone-slider" class="product-flexslider hidden-buttons">
                        <div class="slider-items slider-width-col4 ">
                            {* Новинки *}
                            {get_new_products var=new_products limit=8}
                            {if $new_products}
                                {foreach $new_products as $product}
                                    {include file='product_block.tpl'}
                                {/foreach}
                            {/if}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>