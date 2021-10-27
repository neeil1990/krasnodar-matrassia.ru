if(typeof b1c_style == "undefined") { var b1c_style = "default"; } // template
if(typeof b1c_lang  == "undefined") { var b1c_lang  = "ru"; } // language

document.write(unescape("%3Clink rel='stylesheet' href='/buyme/templates/"+b1c_style+"/style.css' type='text/css'%3E")); 

if(!window.jQuery) { 
document.write(unescape("%3Cscript src='/buyme/js/jquery.js' type='text/javascript'%3E%3C/script%3E")); 
}

document.write(unescape("%3Cscript src='/buyme/js/core.js' type='text/javascript'%3E%3C/script%3E")); 