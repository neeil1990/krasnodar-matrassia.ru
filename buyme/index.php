<?


// настройка

//адрес почты для отправки уведомления
$to = "info@matrassia.ru"; //несколько ящиков могут перечисляться через запятую
$from = "info@matrassia.ru"; //адрес, от которого придёт уведомление

$id = "";
$key = "";
$frm = "BuyMe"; // не меняйте. Если меняете, добавьте новую подпись в Bytehand и дождитесь апрува
$num_sms = ""; // ваш номер без "+", например, 380501112233 или 79218886622

function gF($s){ // no shit
	$s = substr((htmlspecialchars($_GET[$s])), 0 , 500);
	if (strlen($s)>1) return $s;
}

switch (gF("lng")) { //languages
	case "ru": $ln = 0; break;
	case "ua": $ln = 1; break;
	case "en": $ln = 2; break;
}

$l[0]["sent"] = "Заказ только что был отправлен";
$l[1]["sent"] = "Замовлення тільки що було відправлено";
$l[2]["sent"] = "Your offer has been just receipt";

$l[0]["err"] = "Пожалуйста, заполните все поля";
$l[1]["err"] = "Будь ласка, заповніть всі поля";
$l[2]["err"] = "Please fill in all the fields";

$l[0]["ok"] = "Спасибо, заказ принят. Ждите звонка";
$l[1]["ok"] = "Дякуємо, замовлення прийнято. Чекайте на дзвінок";
$l[2]["ok"] = "Thanks, your offer has been confirmed. Wait for our call";

$l[0]["title"] = "BuyMe: новый заказ";
$l[1]["title"] = "BuyMe: нове замовлення";
$l[2]["title"] = "BuyMe: new offer";

$l[0]["name"] = "Имя";
$l[1]["name"] = "Ім'я";
$l[2]["name"] = "Name";

$l[0]["contact"] = "Контакт";
$l[1]["contact"] = "Контакт";
$l[2]["contact"] = "Contact";

$l[0]["comment"] = "Комментарий";
$l[1]["comment"] = "Коментар";
$l[2]["comment"] = "Comment";

$l[0]["footer"] = "<a href='http://dedushka.org/tag/buyme/'>Следите</a> за обновлениями скрипта.<br>Спасибо за использование BuyMe.";
$l[1]["footer"] = "<a href='http://dedushka.org/tag/buyme/'>Слідкуйте</a> за оновленнями скрипта.<br>Дякую за користування BuyMe.";
$l[2]["footer"] = "<a href='http://dedushka.org/tag/buyme/'>Follow</a> the script renewals.<br>Thanks for using BuyMe.";

function getOptions(){ // get product options
	$captions = $_GET["captions"];
	$options = $_GET["options"];
	$i = 0;	
	foreach ($options as $value) {
		$opts .= $captions[$i].": ".$value."<br>";
		$i++;
	}
	return $opts;
}

function sendSMS($to, $text){ // sms
	global $id;
	global $key;
	global $from;
	global $frm;
	$result = @file_get_contents('http://bytehand.com:3800/send?id='.$id.'&key='.$key.'&to='.urlencode($to).'&partner=callme&from='.urlencode($frm).'&text='.urlencode($text));
	if ($result === false) { return false; } else {	return true; }
}

// translit thx2 ProgrammerZ.Ru
function translit($str){
$tr = array("А"=>"A","Б"=>"B","В"=>"V","Г"=>"G","Д"=>"D","Е"=>"E","Ж"=>"J","З"=>"Z","И"=>"I",
"Й"=>"Y","К"=>"K","Л"=>"L","М"=>"M","Н"=>"N","О"=>"O","П"=>"P","Р"=>"R","С"=>"S","Т"=>"T",
"У"=>"U","Ф"=>"F","Х"=>"H","Ц"=>"TS","Ч"=>"CH","Ш"=>"SH","Щ"=>"SCH","Ъ"=>"","Ы"=>"YI","Ь"=>"",
"Э"=>"E","Ю"=>"YU","Я"=>"YA","а"=>"a","б"=>"b","в"=>"v","г"=>"g","д"=>"d","е"=>"e","ж"=>"j",
"з"=>"z","и"=>"i","й"=>"y","к"=>"k","л"=>"l","м"=>"m","н"=>"n","о"=>"o","п"=>"p","р"=>"r",
"с"=>"s","т"=>"t","у"=>"u","ф"=>"f","х"=>"h","ц"=>"ts","ч"=>"ch","ш"=>"sh","щ"=>"sch","ъ"=>"y",
"ы"=>"yi","ь"=>"","э"=>"e","ю"=>"yu","я"=>"ya");
return strtr($str,$tr);
}

header("Content-Type: text/html; charset=utf-8"); //charset

// далее можно не трогать

$time = time(); // время отправки
$interval = $time - gF("time");
if ($interval < 1) { // если прошло менее часа, указано в секундах
	$result = "err";
	$cls = "b1c_err";
	$time = "";
	$message = $l[$ln]["sent"];
} else {

if (gF("cnt")){ // data to send
	$ip = $_SERVER['REMOTE_ADDR']; 
	$contact = gF("cnt");
	$name = gF("nam");
	$comment = gF("cmt");
	$url = gF("url");

	$title = $l[$ln]["title"];
	$mess = "
	<p><b>".$l[$ln]["contact"]."</b><br>".$contact."</p>
	<p><b>".$l[$ln]["name"]."</b><br>".$name."</p>
	<p>".(getOptions())."</p>
	<p><b>".$l[$ln]["comment"]."</b><br>".$comment."</p>";

	$mess = $mess."<p><b>URL</b><br>".$url."</p>
	<p><b>ip</b><br>".$ip."<hr>".$l[$ln]["footer"];
	
	$headers  = "Content-type: text/html; charset=utf-8 \r\n"; 
	$headers .= "From: BuyMe 1.0b <".$from.">\r\n"; 

$msg_sms = translit($options[0]).":".$phone." ";
$msg_sms .= substr(translit($comment), 0, (160-strlen($msg_sms)));

@mail($to, $title, $mess, $headers);
	$result = "ok";
	$cls = "b1c_ok";
	$message = $l[$ln]["ok"]; //сообщение об отправке
	if ($bytehandId) { 
		@sendSMS($num_sms, $msg_sms); 
	}
} else {
	$result = "err";
	$cls = "b1c_err";
	$time = "";
	$message = $l[$ln]["err"];
}
}
?>{
"result": "<? echo $result; ?>",
"cls": "<? echo $cls; ?>",
"time": "<? echo $time; ?>",
"message": "<? echo $message; ?>"
}