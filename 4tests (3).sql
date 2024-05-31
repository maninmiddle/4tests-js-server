-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Май 23 2021 г., 20:06
-- Версия сервера: 8.0.25-0ubuntu0.20.04.1
-- Версия PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `4tests`
--

-- --------------------------------------------------------

--
-- Структура таблицы `tasks`
--

CREATE TABLE `tasks` (
  `id` int UNSIGNED NOT NULL,
  `testId` int NOT NULL,
  `text` varchar(144) NOT NULL,
  `variants` varchar(2048) NOT NULL,
  `rightVariants` varchar(144) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `tasks`
--

INSERT INTO `tasks` (`id`, `testId`, `text`, `variants`, `rightVariants`) VALUES
(92, 60, 'Привет', 'привет,пока,привет,привет,лаад,бвдыда,млсбвд,абабвдсбб,сбвбдвдаб,сбвб', '0'),
(93, 60, 'как дела?', 'абвдв,бсбсдв', '0'),
(94, 61, 'с', 'с,с,с', '1,0,2'),
(95, 62, 'с', 'с,с', '0'),
(96, 63, 'c', 'x,c,x', '1'),
(97, 63, 'v', 'x,a', '1'),
(98, 63, 'x', 'c,c', '1'),
(99, 65, 'dsf', 'sdfsd,sdfsf', '0'),
(100, 66, '123', '123,123', '1');

-- --------------------------------------------------------

--
-- Структура таблицы `tests`
--

CREATE TABLE `tests` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(144) DEFAULT NULL,
  `subject` varchar(144) DEFAULT NULL,
  `completeTime` int DEFAULT NULL,
  `password` varchar(144) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `tests`
--

INSERT INTO `tests` (`id`, `name`, `subject`, `completeTime`, `password`) VALUES
(60, 'Тест', 'Тест', 15, ''),
(61, '3030', '3030', 999, '7127'),
(62, 'м', 'с', 8, ''),
(63, 'x', 'x', 8, 'c'),
(64, '213123', '123123122131', 123, '12312312'),
(65, 'fdsgfds', 'fsdgsdf', 120, '123'),
(66, '123', '123', 123, '123');

-- --------------------------------------------------------

--
-- Структура таблицы `variants`
--

CREATE TABLE `variants` (
  `id` int UNSIGNED NOT NULL,
  `taskId` int NOT NULL,
  `text` varchar(144) NOT NULL,
  `isRight` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `variants`
--

INSERT INTO `variants` (`id`, `taskId`, `text`, `isRight`) VALUES
(179, 92, 'привет', 1),
(180, 92, 'пока', 0),
(181, 92, 'привет', 0),
(182, 92, 'привет', 0),
(183, 92, 'лаад', 0),
(184, 92, 'бвдыда', 0),
(185, 92, 'млсбвд', 0),
(186, 92, 'абабвдсбб', 0),
(187, 92, 'сбвбдвдаб', 0),
(188, 92, 'сбвб', 0),
(189, 93, 'абвдв', 1),
(190, 93, 'бсбсдв', 0),
(191, 94, 'с', 1),
(192, 94, 'с', 1),
(193, 94, 'с', 1),
(194, 95, 'с', 1),
(195, 95, 'с', 0),
(196, 96, 'c', 1),
(197, 96, 'x', 0),
(198, 96, 'x', 0),
(199, 97, 'a', 1),
(200, 97, 'x', 0),
(201, 98, 'c', 0),
(202, 98, 'c', 1),
(203, 99, 'sdfsd', 1),
(204, 99, 'sdfsf', 0),
(205, 100, '123', 0),
(206, 100, '123', 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `variants`
--
ALTER TABLE `variants`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT для таблицы `tests`
--
ALTER TABLE `tests`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT для таблицы `variants`
--
ALTER TABLE `variants`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=207;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
