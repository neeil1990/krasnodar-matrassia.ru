{* Информер сравнения товаров *}
<div id="compare_informer" >
	{if $compare->total>0}
<div id="cat_compare_fixed">
	<div style="display:block;" id="popupcomparelist">
	<div style="width:56px;" class="catalog_compare_list">
		<form method="get" action="/compare/">
			<div class="scroll_comparelist_ clearfix">
		
				<a href="compare/remove/{$product->id}" class="catalog_compare_list-item">
				<div class="catalog_compare_list-item-pic">
				<a style="font-size: 45px; font-weight: bold; text-decoration: none;" rel="nofollow" title="" href="/compare/" class="cat_compare_fixed-item_link">
		                    {$compare->total}
							</a>
				</div>
				
				</a>
			
			</div>
			{if $compare->total>1}
			<a href="#" class="submit btn2">Сравнить</a>
			<input type="submit" value="Сравнить" class="none1 go2compareresult"><input type="hidden" value="COMPARE" name="action"><input type="hidden" value="6" name="IBLOCK_ID">
		{/if}
		</form>
	</div>
	</div>
		</div>
{/if}

</div>
