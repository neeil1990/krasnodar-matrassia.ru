<div class="js_tabs">
  <div class="catalog-element-tabs persoanlise_tabs">
    <div class="personal-tabsheader">
      <div class="personal-tabsheader-tablink js_tabs_header">
        <div class="tabs_title">Показать: 
        </div>
        <a rel="nofollow" class="incative incative-border select" href=".tab_all">
          <span class="tabbg-center">Рекомендуемые
          </span>
          <span class="img-cart multimage_icons">
          </span></a>
        <a rel="nofollow" class="incative incative-border" href=".tab_recomended">
          <span class="tabbg-center">Новинки 
          </span>
          <span class="img-cart multimage_icons">
          </span></a>
        <a rel="nofollow" class="incative incative-border" href=".tab_viewed">
          <span class="tabbg-center">Акции и скидки
          </span>
          <span class="img-cart multimage_icons">
          </span></a>
      </div>
      <div class="clear">
      </div>
    </div>
    <div class="personal-tabscontent">

  <div class="personal-tabscontent second_tabs">
      <div class="tab_all tabs-content js_tabs_content showed content">
{* Рекомендуемые товары *}
{get_featured_products var=featured_products}
{if $featured_products}
{foreach $featured_products as $product}
{include file='product_block.tpl'}
{/foreach}
{/if}
   </div>
  <div class="clear">
  </div>
    <div class="tab_recomended tabs-content js_tabs_content">
      <div id="ajaxpages_catalog_pagemain_recomended" class="content">
{* Новинки *}
{get_new_products var=new_products limit=8}
{if $new_products}
{foreach $new_products as $product}
{include file='product_block.tpl'}
{/foreach}
{/if}
      </div>
      <div class="clear">
      </div>
    </div>

    <div class="tab_viewed tabs-content js_tabs_content">
      <div id="ajaxpages_catalog_pagemain_alreadyviewed" class="content">
{* Акционные товары *}
{get_discounted_products var=discounted_products limit=8}
{if $discounted_products}
{foreach $discounted_products as $product}
{include file='product_block.tpl'}
{/foreach}
{/if}
      </div>
      <div class="clear">
      </div>
    </div>
  </div>
</div>  
</div> 
</div>    