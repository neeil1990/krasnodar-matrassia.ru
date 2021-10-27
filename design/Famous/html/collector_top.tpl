{* retailCRM Collector *}

{literal}
<style>
.rc-cf-logo {
	display: hide !important;
	opacity: 0 !important;
	z-index: -9999 !important;
}
div.rc-cf-dialog {
	max-width: 80% !important;
}
input.rc-cf-input {
	max-width: 90% !important;
}
div.rc-cf-send {
	height: auto !important;
	line-height: 1.5em !important;
	text-align: center !important;
	padding-top: 0.5em !important;
	padding-bottom: 0.5em !important; 
}
</style>
{/literal}

{if $user}
	{literal}
	<script type="text/javascript">
		(function(_,r,e,t,a,i,l){_['retailCRMObject']=a;_[a]=_[a]||function(){(_[a].q=_[a].q||[]).push(arguments)};_[a].l=1*new Date();l=r.getElementsByTagName(e)[0];i=r.createElement(e);i.async=!0;i.src=t;l.parentNode.insertBefore(i,l)})(window,document,'script','https://collector.retailcrm.pro/w.js','_rc');
		
		_rc('create', 'RC-64305714021-3', {
	{/literal}
        	'customerId': '{$user->id}'
    {literal}
    	});
    	
		_rc('send', 'pageView');
	</script>
	{/literal}
{else}
	{literal}
	<script type="text/javascript">
		(function(_,r,e,t,a,i,l){_['retailCRMObject']=a;_[a]=_[a]||function(){(_[a].q=_[a].q||[]).push(arguments)};_[a].l=1*new Date();l=r.getElementsByTagName(e)[0];i=r.createElement(e);i.async=!0;i.src=t;l.parentNode.insertBefore(i,l)})(window,document,'script','https://collector.retailcrm.pro/w.js','_rc');
		
		//_rc('create', 'RC-64305714021-3');
		_rc('create', 'RC-64305714021-3', {
                'customerId': '0'
        });
		_rc('send', 'pageView');
	</script>
	{/literal}
{/if}
