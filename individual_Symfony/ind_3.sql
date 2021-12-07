-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Дек 07 2021 г., 16:14
-- Версия сервера: 8.0.19
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `ind_3`
--

-- --------------------------------------------------------

--
-- Структура таблицы `currency`
--

CREATE TABLE `currency` (
  `Id` int NOT NULL,
  `type_id` int DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `price` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `currency`
--

INSERT INTO `currency` (`Id`, `type_id`, `name`, `price`) VALUES
(1, 1, 'USD', 18),
(2, 2, 'EUR', 20),
(3, 3, 'RUB', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20201125120638', '2020-11-25 13:07:24', 47),
('DoctrineMigrations\\Version20201125121212', '2020-11-25 13:12:29', 179),
('DoctrineMigrations\\Version20201125193427', '2020-12-02 09:20:20', 182),
('DoctrineMigrations\\Version20201130212740', '2020-11-30 23:14:22', 319),
('DoctrineMigrations\\Version20201201190216', '2020-12-01 20:02:33', 118),
('DoctrineMigrations\\Version20201201211205', '2020-12-02 00:13:49', 338),
('DoctrineMigrations\\Version20201201231207', '2020-12-02 00:15:52', 81);

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `description`) VALUES
(2, 'Desc', 32, 'Also descriptn'),
(4, 'new', 2, 'new');

-- --------------------------------------------------------

--
-- Структура таблицы `product_id_seq`
--

CREATE TABLE `product_id_seq` (
  `next_not_cached_value` bigint NOT NULL,
  `minimum_value` bigint NOT NULL,
  `maximum_value` bigint NOT NULL,
  `start_value` bigint NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint NOT NULL COMMENT 'increment value',
  `cache_size` bigint UNSIGNED NOT NULL,
  `cycle_option` tinyint UNSIGNED NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `type`
--

CREATE TABLE `type` (
  `Id` int NOT NULL,
  `name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `type`
--

INSERT INTO `type` (`Id`, `name`) VALUES
(1, 'USD'),
(2, 'EUR'),
(3, 'RUB'),
(4, 'UAH');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `type_id` (`type_id`);

--
-- Индексы таблицы `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `currency`
--
ALTER TABLE `currency`
  ADD CONSTRAINT `currency_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `type` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
