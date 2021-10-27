<!-- Slideshow  -->
<div class="main-slider" id="home">
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-3 col-xs-12 banner-left hidden-xs">
                <img src="design/{$settings->theme|escape}/images/banner-left.jpg" alt="banner">
            </div>
            <div class="col-sm-9 col-md-9 col-lg-9 col-xs-12 jtv-slideshow">
                <div id="jtv-slideshow">
                    <div id='rev_slider_4_wrapper' class='rev_slider_wrapper fullwidthbanner-container' >
                        <div id='rev_slider_4' class='rev_slider fullwidthabanner'>
                            <ul>
                                {for $foo=0 to 100}
                                    {if file_exists("{$smarty.server.DOCUMENT_ROOT}/design/{$settings->theme|escape}/images/slider/{$foo}.jpg")}
                                        <li data-transition='fade' data-slotamount='7' data-masterspeed='1000' data-thumb=''>
                                            <img src='design/{$settings->theme|escape}/images/slider/{$foo}.jpg' data-bgposition='left top' data-bgfit='cover' data-bgrepeat='no-repeat' alt="banner"/>
                                        </li>
                                    {else}
                                        {break}
                                    {/if}
                                {/for}
                            </ul>
                            <div class="tp-bannertimer"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>