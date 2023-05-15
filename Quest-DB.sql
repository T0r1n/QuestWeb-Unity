-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 15 2023 г., 18:04
-- Версия сервера: 8.0.30
-- Версия PHP: 8.1.9

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

--
-- Дамп данных таблицы `PROGRESS`
--

INSERT INTO `PROGRESS` (`quest`, `player`) VALUES
(4, 'Torin'),
(4, 'Тестер'),
(4, 'Новый'),
(44, 'Новый');

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
  `quest` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `QUESTIONS`
--

INSERT INTO `QUESTIONS` (`question_id`, `q_text`, `q_answer`, `q_hint`, `q_pic`, `quest`) VALUES
(1, 'Сколько ног у осьминога?', '8', '(7+1)', 'https://mobimg.b-cdn.net/v3/fetch/74/74739e1770f31cdbfdde99cc0b2925d3.jpeg?w=1470&r=0.5625', 4),
(2, 'Нравится ли малина?', 'Да', 'Не нет', '', 4),
(3, 'Какое имя у разработчика?', 'Валера', 'М Лера', '', 4),
(4, 'Сколько лет разработчику?', '20', '25-5', '', 4),
(5, 'Муха летает?', 'Да', 'Прямо сейчас нет', 'https://s00.yaplakal.com/pics/pics_original/5/0/6/17827605.jpg', 4),
(6, 'Программа где разработано?', 'Unity', 'Серьезно?', 'https://mobimg.b-cdn.net/v3/fetch/dd/dd1e9dd0f6f574a32280a8e21fe7c4c6.jpeg', 4),
(7, 'Вспушит она свои бока,\nСвои четыре уголка,\nИ тебя, как ночь настанет,\nВсе равно к себе притянет.', 'Подушка', '', 'https://f.vividscreen.info/soft/56857d2a5ac29f2897c481b80da86a41/Deliciour-Cherries-2880x1920.jpg', 4),
(8, 'Узнать его нам просто,\nУзнать его легко:\nВысокого он роста\nИ видит далеко.', 'Жираф', '', '', 4),
(9, 'Тучек нет на горизонте\nНо раскрылся в небе зонтик.\nЧерез несколько минут\nОпустился…', 'Парашют', '', '', 4),
(10, 'Ног нет, а хожу,\nРта нет, а скажу,\nКогда спать, когда вставать,\nКогда работу начинать.', 'Часы', '', '', 4),
(11, 'Вместо носа — пятачок,\nВместо хвостика — крючок,\nГолос мой визглив и тонок,\nЯ — весёлый …', 'Поросёнок', '', '', 4),
(12, 'В зоопарке,\nВерь, не верь,\nПроживает\nЧудо-зверь.\nУ него рука — во лбу\nТак похожа на трубу!', 'Слон', '', '', 4),
(13, 'Многолюден, шумен, молод,\nПод землей грохочет город.\nА дома с народом тут\nВдоль по улице бегут.', 'Метро', '', '', 4),
(14, 'По лужку он важно бродит,\nИз воды сухим выходит,\nНосит красные ботинки,\nДарит мягкие перинки.', 'Гусь', '', '', 4),
(15, 'Стучат, стучат — не велят скучать.\nИдут, идут, а все тут как тут.', 'Часы', '', '', 4),
(147, 'Кто с черным поясом?', 'Батя', 'Не я', '', 4),
(396, 'Первый вопрос', 'Ответ на первый вопрос', 'Явно  не второй', '', 39),
(397, 'Второй вопрос', '2', 'Не первый', '', 39),
(398, 'ываы', 'аыв', '', '', 39),
(399, 'ываы', 'аыв', '', '', 39),
(400, 'ыаыва', 'ыва', '', '', 39),
(401, 'ыаыва', 'ываы', '', '', 39),
(402, 'ываыва', 'ыавыва', '', '', 39),
(403, 'ываыва', 'ыаыв', '', '', 39),
(404, 'ываыва', 'ыавы', '', '', 39),
(405, 'ываыва', 'ыавывва', '', '', 39),
(406, 'ываыва', 'ываыа', '', '', 39),
(407, 'ыаыва', 'ываыва', '', '', 39),
(408, 'ываываы', 'авыыв', '', '', 39),
(409, 'ываываы', 'аыва', '', '', 39),
(410, 'ыаыва', 'ываы', '', '', 39),
(411, 'авываы', 'аыавыва', '', '', 39),
(412, 'ываыа', 'ыаы', '', '', 39),
(413, 'аывваы', 'аывы', '', '', 39),
(414, 'ываыва', 'ываыва', '', '', 39),
(415, 'ыаыва', 'ыаыва', '', '', 39),
(416, 'ываываыва', 'ыаыа', '', '', 39),
(417, 'ываыа', 'ываыав', '', '', 39),
(418, 'ываыв', 'ыавыа', '', '', 39),
(419, 'ываыввыв', 'аыыв', '', '', 39),
(452, 'sdfs', 'dfsdf', '', '', 42),
(453, 'sdfsdf', 'dfsd', '', '', 42),
(454, 'fsdfs', 'dfsd', '', '', 42),
(455, 'sdfsdf', 'sdfs', '', '', 42),
(456, 'dfsdf', 'sdfs', '', '', 42),
(457, 'sdfsdf', 'sdfsd', '', '', 42),
(458, 'sdfsdf', 'sdfsf', '', '', 42),
(459, 'sdfsd', 'sfdsd', '', '', 42),
(460, 'sdfsdf', 'sdfs', '', '', 42),
(461, 'sdfsdf', 'sdfs', '', '', 42),
(462, 'sdfsdf', 'sdfs', '', '', 42),
(463, 'sdfsd', 'sdfs', '', '', 42),
(464, 'sdfsdf', 'sfsf', '', '', 42),
(465, 'sdfsf', 'sfddsf', '', '', 42),
(466, 'sdfs', 'fdsdf', '', '', 42),
(467, 'sdfsdf', 'sdfs', '', '', 42),
(468, '1', '1', '1', 'https://weblinks.ru/wp-content/uploads/2022/08/0d6de7af1701b7f6ff551d4474ced401-730x578.jpeg', 43),
(469, '2', '2', '2', '', 43),
(470, '3', '3', '3', '', 43),
(471, '4', '4', '4', '', 43),
(472, '5', '5', '5', '', 43),
(473, '6', '6', '6', '', 43),
(474, '7', '7', '7', '', 43),
(475, '8', '8', '8', '', 43),
(476, '9', '9', '9', '', 43),
(477, '10', '10', '10', '', 43),
(478, '11', '11', '11', '', 43),
(479, '12', '12', '12', '', 43),
(480, '13', '13', '13', '', 43),
(481, '14', '14', '14', '', 43),
(482, '15', '15', '15', '', 43),
(483, '16', '16', '16', '', 43),
(484, '1', '1', '1+2-2', '', 44),
(485, '2', '2', '2', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKW11zw47iaudvguDG5ILNSpehhuW8y120wre0tQ3L&s', 44),
(486, '3', '3', '3', '', 44),
(487, '4', '4', '4', '', 44),
(488, '5', '5', '5', '', 44),
(489, '6', '6', '6', '', 44),
(490, '7', '7', '7', '', 44),
(491, '8', '8', '8', '', 44),
(492, '9', '9', '9', '', 44),
(493, '10', '10', '10', '', 44),
(494, '11', '11', '11', '', 44),
(495, '12', '12', '12', '', 44),
(496, '13', '13', '13', '', 44),
(497, '14', '14', '14', '', 44),
(498, '15', '15', '15', '', 44),
(499, '16', '16', '16', 'https://www.iguides.ru/upload/medialibrary/9f8/9f8fdff471b7d281f81f694c100b5adc.png', 44);

-- --------------------------------------------------------

--
-- Структура таблицы `QUESTS`
--

CREATE TABLE `QUESTS` (
  `quest_id` int NOT NULL,
  `title` text COLLATE utf8mb4_general_ci NOT NULL,
  `disc` text COLLATE utf8mb4_general_ci NOT NULL,
  `autor` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `QUESTS`
--

INSERT INTO `QUESTS` (`quest_id`, `title`, `disc`, `autor`) VALUES
(4, 'Тестовое название квеста.', 'Тестовое описание квеста.', 'Torin'),
(39, 'Квест на 24 вопроса', 'Уже старое описание, на 24 вопроса', 'Torin'),
(42, 'fsdfsdf', 's', 'Torin'),
(43, 'Квест на 16', '16', 'Torin'),
(44, 'Квест  Нового 2', 'Новое описание', 'Новый');

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
('Torin', 'pbkdf2:sha256:260000$N1emKWQoBRFwShK3$93aa0208c92c092bbd724cfca4a1e715df30b92255ee63118113610cebd8342f', 'Валера', 'Много малины кушал?', 'Конечно'),
('Валерка', '777', 'Валерка', '3', 'Валерка Кирпич'),
('Новый', 'pbkdf2:sha256:260000$S5YM0XzC85JW1oju$72c799ecd41272d48a9bf09f0a8acce6e2013d819c9bda7cfc8b00b2e6e81bb0', 'Новый 2', 'Какая кличка вашего животного?', 'Пеня'),
('Тестер', 'pbkdf2:sha256:260000$6z6DgZrFHUfVUkCj$80a2037a852d761cb64d3ca5c83a19651e263e9f357a0e49540e54208f471165', 'Тестер', 'Какой ваш любимый фильм?', '1+1'),
('Тортик', 'pbkdf2:sha256:260000$QQxUralmURcNAisk$2f8af9be7dfe66e7c695436d95c0869d14b2cf6572b81199ec87b643ef6fda2c', 'Тортик', '3', 'Черный'),
('Тюфяк', 'pbkdf2:sha256:260000$BQHuuE4ao8MHTSt2$11eeec5a6af985dbf164909575ae6ae67cc41b9d9cae93304d3ddede91950a82', 'Тюфяк', '1', '4'),
('Факир', 'pbkdf2:sha256:260000$ybdoWWmHzRwLRd1o$524890280c0ddc62606fe40c3707ef4643dfb8b71abf1dc4efdd51665c217ded', 'Факир', 'Какая кличка вашего животного?', 'Пёс');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `CONTENTS`
--
ALTER TABLE `CONTENTS`
  ADD KEY `room` (`room`),
  ADD KEY `contents_ibfk_1` (`quest`);

--
-- Индексы таблицы `PROGRESS`
--
ALTER TABLE `PROGRESS`
  ADD KEY `progress_ibfk_1` (`player`),
  ADD KEY `progress_ibfk_2` (`quest`);

--
-- Индексы таблицы `QUESTIONS`
--
ALTER TABLE `QUESTIONS`
  ADD PRIMARY KEY (`question_id`),
  ADD KEY `questions_ibfk_2` (`quest`);

--
-- Индексы таблицы `QUESTS`
--
ALTER TABLE `QUESTS`
  ADD PRIMARY KEY (`quest_id`),
  ADD KEY `quests_ibfk_1` (`autor`);

--
-- Индексы таблицы `ROOMS`
--
ALTER TABLE `ROOMS`
  ADD PRIMARY KEY (`room_id`),
  ADD KEY `rooms_ibfk_1` (`quest`);

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
  MODIFY `question_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=516;

--
-- AUTO_INCREMENT для таблицы `QUESTS`
--
ALTER TABLE `QUESTS`
  MODIFY `quest_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

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
  ADD CONSTRAINT `contents_ibfk_1` FOREIGN KEY (`quest`) REFERENCES `QUESTS` (`quest_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `contents_ibfk_2` FOREIGN KEY (`room`) REFERENCES `ROOMS` (`room_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `PROGRESS`
--
ALTER TABLE `PROGRESS`
  ADD CONSTRAINT `progress_ibfk_1` FOREIGN KEY (`player`) REFERENCES `USERS` (`login`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `progress_ibfk_2` FOREIGN KEY (`quest`) REFERENCES `QUESTS` (`quest_id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `QUESTIONS`
--
ALTER TABLE `QUESTIONS`
  ADD CONSTRAINT `questions_ibfk_2` FOREIGN KEY (`quest`) REFERENCES `QUESTS` (`quest_id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `QUESTS`
--
ALTER TABLE `QUESTS`
  ADD CONSTRAINT `quests_ibfk_1` FOREIGN KEY (`autor`) REFERENCES `USERS` (`login`) ON DELETE SET NULL ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `ROOMS`
--
ALTER TABLE `ROOMS`
  ADD CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`quest`) REFERENCES `QUESTS` (`quest_id`) ON DELETE CASCADE ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
