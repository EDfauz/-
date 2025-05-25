-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: mysql
-- Время создания: Май 25 2025 г., 15:00
-- Версия сервера: 8.0.29
-- Версия PHP: 8.0.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `ais_fauzetdinov9071_test`
--

-- --------------------------------------------------------

--
-- Структура таблицы `flat`
--

CREATE TABLE `flat` (
  `id` int NOT NULL COMMENT 'ID Квартиры',
  `id_house` int NOT NULL COMMENT 'ID Дома',
  `size` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Площадь квартиры',
  `flat number` int NOT NULL COMMENT 'Номер квартиры'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `flat`
--

INSERT INTO `flat` (`id`, `id_house`, `size`, `flat number`) VALUES
(1, 1, '73 м²', 1),
(2, 1, '90 м²', 2),
(3, 1, '110 м²', 3),
(4, 2, '90 м²', 1),
(5, 2, '110 м²', 2),
(6, 3, '73 м²', 1),
(7, 3, '110 м²', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `house`
--

CREATE TABLE `house` (
  `id` int NOT NULL COMMENT 'ID Дома',
  `adress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Адрес дома'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Дом';

--
-- Дамп данных таблицы `house`
--

INSERT INTO `house` (`id`, `adress`) VALUES
(1, '1/1'),
(2, '1/2'),
(3, '1/3');

-- --------------------------------------------------------

--
-- Структура таблицы `meeting`
--

CREATE TABLE `meeting` (
  `id` int NOT NULL COMMENT 'id собрания',
  `date` date NOT NULL COMMENT 'дата',
  `id_house` int NOT NULL COMMENT 'id дома'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `meeting`
--

INSERT INTO `meeting` (`id`, `date`, `id_house`) VALUES
(1, '2025-05-30', 1),
(2, '2025-06-05', 2),
(3, '2025-06-18', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `meeting_question`
--

CREATE TABLE `meeting_question` (
  `id` int NOT NULL COMMENT 'id вопроса собрания',
  `id_meeting` int NOT NULL COMMENT 'id собрания',
  `text` varchar(255) NOT NULL COMMENT 'текст'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `meeting_question`
--

INSERT INTO `meeting_question` (`id`, `id_meeting`, `text`) VALUES
(1, 1, 'Замена лифта'),
(2, 2, 'Ремонт подъезда'),
(3, 3, 'Установка камер видеонаблюдения ');

-- --------------------------------------------------------

--
-- Структура таблицы `owner`
--

CREATE TABLE `owner` (
  `id` int NOT NULL COMMENT 'id владельца',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'ФИО',
  `id_flat` int NOT NULL COMMENT 'id квартиры',
  `share` varchar(10) DEFAULT NULL COMMENT 'доля в праве'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `owner`
--

INSERT INTO `owner` (`id`, `name`, `id_flat`, `share`) VALUES
(1, 'Смирнов Д.Р.', 1, '100%'),
(2, 'Иванов И.И.', 2, '75%'),
(3, 'Романов Д.А.', 3, '50%'),
(4, 'Пушкин А.С.', 4, '25%'),
(5, 'Зозуля Е.В.', 5, '50%'),
(6, 'Никитенко Д.П.', 6, '100%'),
(7, 'Ильин А.А.', 7, '75%');

-- --------------------------------------------------------

--
-- Структура таблицы `vote`
--

CREATE TABLE `vote` (
  `id` int NOT NULL COMMENT 'id',
  `id_owner` int NOT NULL COMMENT 'id владельца',
  `id_meeting_question` int NOT NULL COMMENT 'id вопроса собрания',
  `result` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'результат'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `vote`
--

INSERT INTO `vote` (`id`, `id_owner`, `id_meeting_question`, `result`) VALUES
(1, 1, 1, '0'),
(2, 2, 1, '1'),
(3, 3, 1, '2'),
(4, 4, 2, '2'),
(5, 5, 2, '0'),
(6, 6, 3, '1'),
(7, 7, 3, '2');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `flat`
--
ALTER TABLE `flat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_house` (`id_house`);

--
-- Индексы таблицы `house`
--
ALTER TABLE `house`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `meeting`
--
ALTER TABLE `meeting`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_house` (`id_house`);

--
-- Индексы таблицы `meeting_question`
--
ALTER TABLE `meeting_question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_meeting` (`id_meeting`);

--
-- Индексы таблицы `owner`
--
ALTER TABLE `owner`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_flat` (`id_flat`);

--
-- Индексы таблицы `vote`
--
ALTER TABLE `vote`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_meeting_question` (`id_meeting_question`),
  ADD KEY `id_owner` (`id_owner`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `flat`
--
ALTER TABLE `flat`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID Квартиры', AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `house`
--
ALTER TABLE `house`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID Дома', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `meeting`
--
ALTER TABLE `meeting`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'id собрания', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `meeting_question`
--
ALTER TABLE `meeting_question`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'id вопроса собрания', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `owner`
--
ALTER TABLE `owner`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'id владельца', AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `vote`
--
ALTER TABLE `vote`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'id', AUTO_INCREMENT=8;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `flat`
--
ALTER TABLE `flat`
  ADD CONSTRAINT `flat_ibfk_1` FOREIGN KEY (`id_house`) REFERENCES `house` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `meeting`
--
ALTER TABLE `meeting`
  ADD CONSTRAINT `meeting_ibfk_1` FOREIGN KEY (`id_house`) REFERENCES `house` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `meeting_question`
--
ALTER TABLE `meeting_question`
  ADD CONSTRAINT `meeting_question_ibfk_1` FOREIGN KEY (`id_meeting`) REFERENCES `meeting` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `owner`
--
ALTER TABLE `owner`
  ADD CONSTRAINT `owner_ibfk_1` FOREIGN KEY (`id_flat`) REFERENCES `flat` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `vote`
--
ALTER TABLE `vote`
  ADD CONSTRAINT `vote_ibfk_1` FOREIGN KEY (`id_meeting_question`) REFERENCES `meeting_question` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `vote_ibfk_2` FOREIGN KEY (`id_owner`) REFERENCES `owner` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
