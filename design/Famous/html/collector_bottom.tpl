{* retailCRM Collector *}

{if $module == 'ProductView'}
{literal}
<script type="text/javascript">

_rc('require', 'capture-form', {
	orderMethod: 'collector',
	customerComment: 'DC: форма захвата / Страница запроса: ' + window.location.href,
    'fields': {
        'phone': { required: true, label: 'Телефон' }
    },
    //'period': 60 * 24 * 7,
    labelPromo: "Хотите, мы вам перезвоним?",
    labelSend: "Перезвоните мне!"
});

$(function() {
	
	$('.product-alerts .alertymes4').click(function() {
        _rc('capture-form:show', {
			orderMethod: 'collector',
			customerComment: 'DC: кнопка «' + $(this).data('whatever') + '» / Страница запроса: ' + window.location.href,
			'fields': {
				'name': { required: true },
				'phone': { required: true, label: 'Телефон'  }
				//'email': { required: true, label: 'Эл. почта' }
			},
			labelPromo: $(this).data('whatever'),
			labelSend: 'Отправить'
        });

        return false;
    });
});
</script>
{/literal}
{/if}