

<div class="modal fade" id="shop-popup" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <div class="h4 modal-title">Заказать звонок</div>
            </div>
            <form>
                <div class="modal-body">
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">Ваше имя</label>
                            <input type="text" name="cname" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">Номер телефона</label>
                            <input type="text" name="cphone" class="form-control" autocomplete="tel" required>
                        </div>
                        <div class="form-group">
                            <label for="message-text" class="control-label">Сообщение:</label>
                            <textarea class="form-control" name="ccmnt" required></textarea>
                        </div>
                </div>
                <div class="modal-footer">
                    <div class="agree_block">
                        <input type="checkbox" id="agree_checkbox" class="agree_checkbox" checked="checked" required>
                        <label for="agree_checkbox">Я принимаю условия политики конфиденциальности</label>
                        <a class="agree_link" href="/politika-konfidentsialnosti">Политика конфиденциальности</a>
                    </div>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Закрыть</button>
                    <button type="submit" class="btn btn-primary">Отправить сообщение</button>
                </div>
            </form>
        </div>
    </div>
</div>


<div class="modal fade bs-example-modal-sm" id="success" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <div class="h4 modal-title" id="mySmallModalLabel">Статус сообщения</div>
            </div>
            <div class="modal-body">
                <div class="alert alert-success" role="alert">...</div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
