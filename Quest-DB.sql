-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 28 2023 г., 16:57
-- Версия сервера: 8.0.30
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `Quest-DB`
--

-- --------------------------------------------------------

--
-- Структура таблицы `CONTENTS`
--

CREATE TABLE `CONTENTS` (
  `quest` int NOT NULL,
  `room` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `CONTENTS`
--

INSERT INTO `CONTENTS` (`quest`, `room`) VALUES
(4, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `PROGRESS`
--

CREATE TABLE `PROGRESS` (
  `quest` int NOT NULL,
  `player` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `QUESTIONS`
--

CREATE TABLE `QUESTIONS` (
  `question_id` int NOT NULL,
  `q_text` text COLLATE utf8mb4_general_ci NOT NULL,
  `q_answer` text COLLATE utf8mb4_general_ci NOT NULL,
  `q_hint` text COLLATE utf8mb4_general_ci NOT NULL,
  `q_pic` text COLLATE utf8mb4_general_ci NOT NULL,
  `room` int NOT NULL,
  `quest` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `QUESTIONS`
--

INSERT INTO `QUESTIONS` (`question_id`, `q_text`, `q_answer`, `q_hint`, `q_pic`, `room`, `quest`) VALUES
(1, 'Сколько ног у осьминога?', '8', '7+1', '', 1, 4),
(2, 'Нравится ли малина?', 'Да', 'Не нет', '', 1, 4),
(3, 'Какое имя у разработчика?', 'Валера', 'М Лера', '', 1, 4),
(4, 'Сколько лет разработчику?', '20', '25-5', '', 1, 4),
(5, 'Муха летает?', 'Да', 'Прямо сейчас нет', '', 1, 4),
(6, 'Программа где разработано?', 'Unity', 'Серьезно?', '', 1, 4),
(7, 'Вспушит она свои бока,\r\nСвои четыре уголка,\r\nИ тебя, как ночь настанет,\r\nВсе равно к себе притянет.', 'Подушка', '', '', 1, 4),
(8, 'Узнать его нам просто,\r\nУзнать его легко:\r\nВысокого он роста\r\nИ видит далеко.', 'Жираф', '', '', 1, 4),
(9, 'Тучек нет на горизонте\r\nНо раскрылся в небе зонтик.\r\nЧерез несколько минут\r\nОпустился…', 'Парашют', '', '', 1, 4),
(10, 'Ног нет, а хожу,\r\nРта нет, а скажу,\r\nКогда спать, когда вставать,\r\nКогда работу начинать.', 'Часы', '', '', 1, 4),
(11, 'Вместо носа — пятачок,\r\nВместо хвостика — крючок,\r\nГолос мой визглив и тонок,\r\nЯ — весёлый …', 'Поросёнок', '', '', 1, 4),
(12, 'В зоопарке,\r\nВерь, не верь,\r\nПроживает\r\nЧудо-зверь.\r\nУ него рука — во лбу\r\nТак похожа на трубу!', 'Слон', '', '', 1, 4),
(13, 'Многолюден, шумен, молод,\r\nПод землей грохочет город.\r\nА дома с народом тут\r\nВдоль по улице бегут.', 'Метро', '', '', 1, 4),
(14, 'По лужку он важно бродит,\r\nИз воды сухим выходит,\r\nНосит красные ботинки,\r\nДарит мягкие перинки.', 'Гусь', '', '', 1, 4),
(15, 'Стучат, стучат — не велят скучать.\r\nИдут, идут, а все тут как тут.', 'Часы', '', '', 1, 4),
(147, 'Кто с черным поясом?', 'Батя', 'Не я', '', 1, 4),
(148, 'ыыаыва', 'ываыа', '', '', 1, 22),
(149, 'ффвфыв', 'вйцйцу', '', '', 1, 22),
(150, 'йцуйцу', 'йцуйцу', '', '', 1, 22),
(151, 'йцуйцу', 'йцуйцу', '', '', 1, 22),
(152, 'йцуйцу', 'йцуйцу', '', '', 1, 22),
(153, 'йцуйцу', 'йцуйцу', '', '', 1, 22),
(154, 'йцуйцу', 'йцуйцу', '', '', 1, 22),
(155, 'йцуйцу', 'йцуйцу', '', '', 1, 22),
(156, 'йцуйцу', 'йцуйцу', '', '', 1, 22),
(157, 'йцуйцу', 'йцуйцу', '', '', 1, 22),
(158, 'йцуйцу', 'йцуйцу', '', '', 1, 22),
(159, 'йцуйцу', 'йцуйцу', '', '', 1, 22),
(160, 'йцуйцу', 'йцуйцу', '', '', 1, 22),
(161, 'йцуйцу', 'йцуйцу', '', '', 1, 22),
(162, 'йцуйцуйцу', 'йцуйцу', '', '', 1, 22),
(163, 'цукцукцук', 'цукцук', '', '', 1, 22);

-- --------------------------------------------------------

--
-- Структура таблицы `QUESTS`
--

CREATE TABLE `QUESTS` (
  `quest_id` int NOT NULL,
  `title` text COLLATE utf8mb4_general_ci NOT NULL,
  `disc` text COLLATE utf8mb4_general_ci NOT NULL,
  `autor` varchar(20) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `QUESTS`
--

INSERT INTO `QUESTS` (`quest_id`, `title`, `disc`, `autor`) VALUES
(4, 'Тестовое название квеста.', 'Тестовое описание квеста.', 'Torin'),
(6, 'tit', 'dis', 'Torin'),
(22, 'ываыва', 'ываыв', 'Torin');

-- --------------------------------------------------------

--
-- Структура таблицы `ROOMS`
--

CREATE TABLE `ROOMS` (
  `room_id` int NOT NULL,
  `q_count` int NOT NULL,
  `quest` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `ROOMS`
--

INSERT INTO `ROOMS` (`room_id`, `q_count`, `quest`) VALUES
(1, 4, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `USERS`
--

CREATE TABLE `USERS` (
  `login` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pass` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nick` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `s_quest` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `s_answer` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `USERS`
--

INSERT INTO `USERS` (`login`, `pass`, `nick`, `s_quest`, `s_answer`) VALUES
('Marik', 'pbkdf2:sha256:260000$xFTx4r9H2yP8QMLL$37bd109edad7431f64c33e2bf3e827a47618e203ad5776c93dfff004abbbede8', 'Marik', '1', '7'),
('Torin', '123123', 'Валера', 'Много малины кушал?', 'Конечно'),
('Torka', 'pbkdf2:sha256:260000$JxVzrruleKuIaSvg$032215ce03488178c02f332fbff10942bf7f81a42a1fa4ce3965f9b2e89e0ec6', 'Torka', '1', '1'),
('Валерка', '777', 'Валерка', '3', 'Валерка Кирпич'),
('Тюфяк', 'pbkdf2:sha256:260000$BQHuuE4ao8MHTSt2$11eeec5a6af985dbf164909575ae6ae67cc41b9d9cae93304d3ddede91950a82', 'Тюфяк', '1', '4');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `CONTENTS`
--
ALTER TABLE `CONTENTS`
  ADD KEY `quest` (`quest`),
  ADD KEY `room` (`room`);

--
-- Индексы таблицы `PROGRESS`
--
ALTER TABLE `PROGRESS`
  ADD KEY `player` (`player`),
  ADD KEY `quest` (`quest`);

--
-- Индексы таблицы `QUESTIONS`
--
ALTER TABLE `QUESTIONS`
  ADD PRIMARY KEY (`question_id`),
  ADD KEY `quest` (`quest`),
  ADD KEY `room` (`room`);

--
-- Индексы таблицы `QUESTS`
--
ALTER TABLE `QUESTS`
  ADD PRIMARY KEY (`quest_id`),
  ADD KEY `autor` (`autor`);

--
-- Индексы таблицы `ROOMS`
--
ALTER TABLE `ROOMS`
  ADD PRIMARY KEY (`room_id`),
  ADD KEY `quest` (`quest`);

--
-- Индексы таблицы `USERS`
--
ALTER TABLE `USERS`
  ADD PRIMARY KEY (`login`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `QUESTIONS`
--
ALTER TABLE `QUESTIONS`
  MODIFY `question_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT для таблицы `QUESTS`
--
ALTER TABLE `QUESTS`
  MODIFY `quest_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблицы `ROOMS`
--
ALTER TABLE `ROOMS`
  MODIFY `room_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `CONTENTS`
--
ALTER TABLE `CONTENTS`
  ADD CONSTRAINT `contents_ibfk_1` FOREIGN KEY (`quest`) REFERENCES `QUESTS` (`quest_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `contents_ibfk_2` FOREIGN KEY (`room`) REFERENCES `ROOMS` (`room_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `PROGRESS`
--
ALTER TABLE `PROGRESS`
  ADD CONSTRAINT `progress_ibfk_1` FOREIGN KEY (`player`) REFERENCES `USERS` (`login`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `progress_ibfk_2` FOREIGN KEY (`quest`) REFERENCES `QUESTS` (`quest_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `QUESTIONS`
--
ALTER TABLE `QUESTIONS`
  ADD CONSTRAINT `questions_ibfk_2` FOREIGN KEY (`quest`) REFERENCES `QUESTS` (`quest_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `QUESTS`
--
ALTER TABLE `QUESTS`
  ADD CONSTRAINT `quests_ibfk_1` FOREIGN KEY (`autor`) REFERENCES `USERS` (`login`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `ROOMS`
--
ALTER TABLE `ROOMS`
  ADD CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`quest`) REFERENCES `QUESTS` (`quest_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
