<?php
	// Параметры подключения к базе данных
	define('DB_SERVER', 'localhost'); // Имя сервера базы данных
	define('DB_USERNAME', 'root'); // Имя пользователя базы данных
	define('DB_PASSWORD', '123456'); // Пароль пользователя базы данных
	define('DB_NAME', 'Quest-DB'); // Имя базы данных

	// Подключаемся к базе данных MySQL
	$mysql = new mysqli(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);

	if ($mysql->connect_error) exit('Ошибка подключения к БД');
	$mysql->set_charset('utf8')
?>