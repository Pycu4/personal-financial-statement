-- phpMyAdmin SQL Dump
-- version 4.4.12
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Ноя 13 2016 г., 21:10
-- Версия сервера: 5.6.25
-- Версия PHP: 5.6.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `personal_financial_statement`
--

-- --------------------------------------------------------

--
-- Структура таблицы `accounts`
--

CREATE TABLE IF NOT EXISTS `accounts` (
  `account_id` smallint(11) NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `account_owner` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `expense_categories`
--

CREATE TABLE IF NOT EXISTS `expense_categories` (
  `expense_category_id` int(11) NOT NULL,
  `expense_category_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `expense_category_links`
--

CREATE TABLE IF NOT EXISTS `expense_category_links` (
  `expense_category_child` int(11) NOT NULL,
  `expense_category_parent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `income_categories`
--

CREATE TABLE IF NOT EXISTS `income_categories` (
  `income_category_id` int(11) NOT NULL,
  `income_category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `income_category_links`
--

CREATE TABLE IF NOT EXISTS `income_category_links` (
  `income_category_child` int(11) NOT NULL,
  `income_category_parent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `owners`
--

CREATE TABLE IF NOT EXISTS `owners` (
  `owner_id` tinyint(4) NOT NULL,
  `owner_firstname` varchar(255) NOT NULL,
  `owner_lastname` varchar(255) NOT NULL,
  `owner_middlename` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `receipts`
--

CREATE TABLE IF NOT EXISTS `receipts` (
  `receipt_id` int(11) NOT NULL,
  `receipt_timestamp` int(10) NOT NULL,
  `receipt_number` int(11) NOT NULL,
  `receipt_scan` varchar(255) NOT NULL,
  `receipt_note` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `receipt_store_links`
--

CREATE TABLE IF NOT EXISTS `receipt_store_links` (
  `receipt_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `stores`
--

CREATE TABLE IF NOT EXISTS `stores` (
  `store_id` int(11) NOT NULL,
  `store_legal` varchar(255) NOT NULL,
  `store_name` varchar(255) NOT NULL,
  `store_zip` mediumint(6) NOT NULL,
  `store_city` varchar(255) NOT NULL,
  `store_address` text NOT NULL,
  `store_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `transactions`
--

CREATE TABLE IF NOT EXISTS `transactions` (
  `transaction_id` int(11) NOT NULL,
  `transaction_timestamp` int(10) NOT NULL,
  `transaction_sum` int(11) NOT NULL,
  `transaction_receipt` int(11) NOT NULL,
  `transaction_account` smallint(6) NOT NULL,
  `transaction_note` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `transaction_expense_category_links`
--

CREATE TABLE IF NOT EXISTS `transaction_expense_category_links` (
  `transaction_id` int(11) NOT NULL,
  `transaction_category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `transaction_income_category_links`
--

CREATE TABLE IF NOT EXISTS `transaction_income_category_links` (
  `transaction_id` int(11) NOT NULL,
  `transaction_category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `transaction_store_links`
--

CREATE TABLE IF NOT EXISTS `transaction_store_links` (
  `transaction_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `transfers`
--

CREATE TABLE IF NOT EXISTS `transfers` (
  `transfer_id` int(11) NOT NULL,
  `transfer_timestamp` int(10) NOT NULL,
  `transfer_receipt` int(11) NOT NULL,
  `transfer_start` smallint(6) NOT NULL,
  `transfer_finish` smallint(6) NOT NULL,
  `transfer_sum` int(11) NOT NULL,
  `transfer_note` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`account_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `account_owner` (`account_owner`);

--
-- Индексы таблицы `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`expense_category_id`),
  ADD KEY `expense_category_id` (`expense_category_id`);

--
-- Индексы таблицы `expense_category_links`
--
ALTER TABLE `expense_category_links`
  ADD PRIMARY KEY (`expense_category_child`,`expense_category_parent`),
  ADD KEY `expense_category_child` (`expense_category_child`,`expense_category_parent`),
  ADD KEY `expense_category_parent` (`expense_category_parent`);

--
-- Индексы таблицы `income_categories`
--
ALTER TABLE `income_categories`
  ADD PRIMARY KEY (`income_category_id`),
  ADD KEY `income_category_id` (`income_category_id`);

--
-- Индексы таблицы `income_category_links`
--
ALTER TABLE `income_category_links`
  ADD PRIMARY KEY (`income_category_child`,`income_category_parent`),
  ADD KEY `income_category_child` (`income_category_child`,`income_category_parent`),
  ADD KEY `income_category_parent` (`income_category_parent`);

--
-- Индексы таблицы `owners`
--
ALTER TABLE `owners`
  ADD PRIMARY KEY (`owner_id`),
  ADD KEY `owner_id` (`owner_id`);

--
-- Индексы таблицы `receipts`
--
ALTER TABLE `receipts`
  ADD PRIMARY KEY (`receipt_id`),
  ADD KEY `receipt_id` (`receipt_id`);

--
-- Индексы таблицы `receipt_store_links`
--
ALTER TABLE `receipt_store_links`
  ADD PRIMARY KEY (`receipt_id`,`store_id`),
  ADD KEY `receipt_id` (`receipt_id`,`store_id`),
  ADD KEY `store_id` (`store_id`);

--
-- Индексы таблицы `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`store_id`),
  ADD KEY `store_id` (`store_id`);

--
-- Индексы таблицы `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `transaction_account` (`transaction_account`),
  ADD KEY `transaction_receipt` (`transaction_receipt`);

--
-- Индексы таблицы `transaction_expense_category_links`
--
ALTER TABLE `transaction_expense_category_links`
  ADD PRIMARY KEY (`transaction_id`,`transaction_category`),
  ADD KEY `transaction_id` (`transaction_id`,`transaction_category`),
  ADD KEY `transaction_category` (`transaction_category`);

--
-- Индексы таблицы `transaction_income_category_links`
--
ALTER TABLE `transaction_income_category_links`
  ADD PRIMARY KEY (`transaction_id`,`transaction_category`),
  ADD KEY `transaction_id` (`transaction_id`,`transaction_category`),
  ADD KEY `transaction_category` (`transaction_category`);

--
-- Индексы таблицы `transaction_store_links`
--
ALTER TABLE `transaction_store_links`
  ADD PRIMARY KEY (`transaction_id`,`store_id`),
  ADD KEY `transaction_id` (`transaction_id`,`store_id`),
  ADD KEY `store_id` (`store_id`);

--
-- Индексы таблицы `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`transfer_id`),
  ADD KEY `transfer_start` (`transfer_start`,`transfer_finish`),
  ADD KEY `transfer_finish` (`transfer_finish`),
  ADD KEY `transfer_receipt` (`transfer_receipt`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `accounts`
--
ALTER TABLE `accounts`
  MODIFY `account_id` smallint(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `expense_category_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `income_categories`
--
ALTER TABLE `income_categories`
  MODIFY `income_category_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `owners`
--
ALTER TABLE `owners`
  MODIFY `owner_id` tinyint(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `receipts`
--
ALTER TABLE `receipts`
  MODIFY `receipt_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `stores`
--
ALTER TABLE `stores`
  MODIFY `store_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `transfers`
--
ALTER TABLE `transfers`
  MODIFY `transfer_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`account_owner`) REFERENCES `owners` (`owner_id`);

--
-- Ограничения внешнего ключа таблицы `expense_category_links`
--
ALTER TABLE `expense_category_links`
  ADD CONSTRAINT `expense_category_links_ibfk_1` FOREIGN KEY (`expense_category_child`) REFERENCES `expense_categories` (`expense_category_id`),
  ADD CONSTRAINT `expense_category_links_ibfk_2` FOREIGN KEY (`expense_category_parent`) REFERENCES `expense_categories` (`expense_category_id`);

--
-- Ограничения внешнего ключа таблицы `income_category_links`
--
ALTER TABLE `income_category_links`
  ADD CONSTRAINT `income_category_links_ibfk_1` FOREIGN KEY (`income_category_child`) REFERENCES `income_categories` (`income_category_id`),
  ADD CONSTRAINT `income_category_links_ibfk_2` FOREIGN KEY (`income_category_parent`) REFERENCES `income_categories` (`income_category_id`);

--
-- Ограничения внешнего ключа таблицы `receipt_store_links`
--
ALTER TABLE `receipt_store_links`
  ADD CONSTRAINT `receipt_store_links_ibfk_1` FOREIGN KEY (`receipt_id`) REFERENCES `receipts` (`receipt_id`),
  ADD CONSTRAINT `receipt_store_links_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`);

--
-- Ограничения внешнего ключа таблицы `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`transaction_account`) REFERENCES `accounts` (`account_id`),
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`transaction_receipt`) REFERENCES `receipts` (`receipt_id`);

--
-- Ограничения внешнего ключа таблицы `transaction_expense_category_links`
--
ALTER TABLE `transaction_expense_category_links`
  ADD CONSTRAINT `transaction_expense_category_links_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`transaction_id`),
  ADD CONSTRAINT `transaction_expense_category_links_ibfk_2` FOREIGN KEY (`transaction_category`) REFERENCES `expense_categories` (`expense_category_id`);

--
-- Ограничения внешнего ключа таблицы `transaction_income_category_links`
--
ALTER TABLE `transaction_income_category_links`
  ADD CONSTRAINT `transaction_income_category_links_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`transaction_id`),
  ADD CONSTRAINT `transaction_income_category_links_ibfk_2` FOREIGN KEY (`transaction_category`) REFERENCES `income_categories` (`income_category_id`);

--
-- Ограничения внешнего ключа таблицы `transaction_store_links`
--
ALTER TABLE `transaction_store_links`
  ADD CONSTRAINT `transaction_store_links_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`transaction_id`),
  ADD CONSTRAINT `transaction_store_links_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`);

--
-- Ограничения внешнего ключа таблицы `transfers`
--
ALTER TABLE `transfers`
  ADD CONSTRAINT `transfers_ibfk_1` FOREIGN KEY (`transfer_start`) REFERENCES `accounts` (`account_id`),
  ADD CONSTRAINT `transfers_ibfk_2` FOREIGN KEY (`transfer_finish`) REFERENCES `accounts` (`account_id`),
  ADD CONSTRAINT `transfers_ibfk_3` FOREIGN KEY (`transfer_receipt`) REFERENCES `receipts` (`receipt_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
