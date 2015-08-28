-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Авг 26 2015 г., 17:21
-- Версия сервера: 5.6.24-72.2
-- Версия PHP: 5.5.9-1ubuntu4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `cherkashin_eco`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Icon`
--

CREATE TABLE IF NOT EXISTS `Icon` (
  `id` int(11) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `Icon`
--

INSERT INTO `Icon` (`id`, `url`, `type`) VALUES
(1, 'http://eco.cherkashin.forlabs.ru/icon/IconUrni.png', 1),
(2, 'http://eco.cherkashin.forlabs.ru/icon/IconPark.png', 1),
(3, 'http://eco.cherkashin.forlabs.ru/icon/IconShop.png', 1),
(4, 'http://eco.cherkashin.forlabs.ru/icon/IconSvalka.png', 1),
(5, 'http://eco.cherkashin.forlabs.ru/icon/IconV.png', 1),
(6, 'http://eco.cherkashin.forlabs.ru/icon/IconDeti.png', 1),
(7, 'http://eco.cherkashin.forlabs.ru/icon/IconVtorSiryo.png', 1),
(8, 'http://eco.cherkashin.forlabs.ru/icon/IconVtorSiryo2.png', 1),
(9, 'http://eco.cherkashin.forlabs.ru/icon/IconsTualet.png', 1),
(10, 'http://eco.cherkashin.forlabs.ru/icon/Iconsurprise3.png', 1),
(11, 'http://eco.cherkashin.forlabs.ru/icon/Iconsurprise2.png', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `POI`
--

CREATE TABLE IF NOT EXISTS `POI` (
  `id` varchar(255) CHARACTER SET utf8 NOT NULL,
  `footnote` varchar(150) CHARACTER SET utf8 NOT NULL,
  `title` varchar(150) CHARACTER SET utf8 NOT NULL,
  `lat` decimal(18,14) NOT NULL,
  `lon` decimal(18,14) NOT NULL,
  `imageURL` varchar(255) CHARACTER SET utf8 NOT NULL,
  `description` varchar(2000) CHARACTER SET utf8 NOT NULL,
  `showBiwOnClick` tinyint(1) NOT NULL,
  `poiType` enum('geo','vision') NOT NULL DEFAULT 'geo',
  `iconID` int(11) NOT NULL,
  `Checkbox` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `POI`
--

INSERT INTO `POI` (`id`, `footnote`, `title`, `lat`, `lon`, `imageURL`, `description`, `showBiwOnClick`, `poiType`, `iconID`, `Checkbox`) VALUES
('geo_1', 'П Центральный парк культуры и отдыха', 'Центральный парк культуры и отдыха', 52.27599755889595, 104.29814343384350, '', '', 1, 'geo', 2, 2),
('geo_10', 'Урна', 'Урна', 52.25163800000000, 104.26705800000000, '', '', 1, 'geo', 1, 1),
('geo_11', 'Урна', 'Урна', 52.24938900000000, 104.26661000000000, '', '', 1, 'geo', 1, 1),
('geo_12', 'Эко продукт', 'Эко продукт', 52.26848637933392, 104.32474493980408, '', 'Магазин натуральных продуктов. \nМясо, сыры, молочные продукты, яйцо, полуфабрикаты.\n', 1, 'geo', 3, 4),
('geo_13', 'Эко-польза', 'Эко-польза', 52.24970943002511, 104.35835301876068, 'http://eco.cherkashin.forlabs.ru/info/pol.jpg', 'Магазин натуральных продуктов.\nДиетические и соевые продукты, мука, крупы, мясопродукты, орехи, косметика ручной работы.\n', 1, 'geo', 3, 4),
('geo_14', 'Эко-точка', 'Эко-точка', 52.28487775477685, 104.27716078153025, '', 'Магазин экологический товаров.\nКосметика и парфюмерия, бытовая химия, диетические и соевые продукты.\n', 1, 'geo', 3, 4),
('geo_15', 'Эко-базар.рф', 'Эко-базар.рф', 52.27934425915588, 104.30045724202728, 'http://eco.cherkashin.forlabs.ru/info/baz.png', 'Продуктовый магазин.\r\nНатуральное мясо, мясо птицы  и полуфабрикаты, молочные продукты, сыры, хлебобулочные изделия.\r\n', 1, 'geo', 3, 4),
('geo_16', 'ЭКО продукты', 'ЭКО продукты', 52.27944565521500, 104.24939939840000, '', 'Магазин.\r\nБиологически активные добавки(БАД), фитопродукция.\r\n', 1, 'geo', 3, 4),
('geo_17', 'Байкальская Экологическая Волна', 'Байкальская Экологическая Волна', 52.23620963098854, 104.28097665309906, 'http://eco.cherkashin.forlabs.ru/info/baivoln.gif', 'Иркутская региональная общественная организация.', 1, 'geo', 5, 8),
('geo_18', 'ВСЕРОССИЙСКОЕ ОБЩЕСТВО ОХРАНЫ ПРИРОДЫ', 'ВСЕРОССИЙСКОЕ ОБЩЕСТВО ОХРАНЫ ПРИРОДЫ', 52.28655790561020, 104.27909079167875, 'http://eco.cherkashin.forlabs.ru/info/bpoop.png', 'Иркутское областное отделение Общероссийской общественной организации\r\n«ВСЕРОССИЙСКОЕ ОБЩЕСТВО ОХРАНЫ ПРИРОДЫ»', 1, 'geo', 5, 8),
('geo_19', 'Курорт “Ангара”', 'Курорт “Ангара”', 52.29342072563830, 104.24373407353414, 'http://eco.cherkashin.forlabs.ru/info/logo_kurort_angara.png', 'Асфальтированные дорожки, небольшие тропинки, чистый лес, на всей территории расположены беседки, скамейки', 1, 'geo', 2, 2),
('geo_2', 'Власть', 'Правительство Иркутской области', 52.29068427591570, 104.27902775993061, '', 'Губернатор - Ерощенко Сергей Владимирович.', 1, 'geo', 5, 8),
('geo_20', 'П Ботанический сад Иркутского государственного университета', 'Ботанический сад Иркутского государственного университета', 52.26213543933409, 104.24817087550764, 'http://eco.cherkashin.forlabs.ru/info/Botsad.gif', 'Занимает площадь 27 гектаров в пределах Кайской реликтовой рощи города Иркутска. Единственный ботанический сад в Байкальском регионе. Имеет самую крупную в регионе флористическую коллекцию из более 5000 таксонов растений.', 1, 'geo', 2, 2),
('geo_21', 'П Зона отдыха "Бульвар Гагарина"', 'Зона отдыха "Бульвар Гагарина"', 52.27888008107644, 104.27599675618694, '', 'Протяжённость 2,3 км. Проходит вдоль правого берега реки Ангары от улицы Кожова до Глазковского моста, после которого переходит в Цэсовскую набережную.', 1, 'geo', 2, 2),
('geo_22', 'П Зона отдыха "Нижняя набережная"', 'Зона отдыха "Нижняя набережная"', 52.29297306726891, 104.28409337997436, '', 'Протяжённость 0,9 км. Ширина 8—12 м. Двухуровневая: парковочные места и пешеходная благоустроенная зона. Сливается с Цесовской набережной и далее по бульвару Гагарина до острова Юности и Верхней набережной Ангары', 1, 'geo', 2, 2),
('geo_23', 'П Парк развлечений "Остров сокровищ"', 'Парк развлечений "Остров сокровищ"', 52.35217499616100, 104.21754063954722, 'http://eco.cherkashin.forlabs.ru/info/ostrovsok.png', 'Парк развлечений для всей семьи во втором Иркутске. Головокружительные аттракционы для детей и взрослых, веселые карусели и забавные аниматоры работают 7 дней в неделю. Каждую среду – льготный день, каждые выходные – грандиозный праздник для всей семьи.', 1, 'geo', 2, 2),
('geo_24', 'Площадь Декабристов', 'Площадь Декабристов', 52.28225967709842, 104.31319491821341, 'http://eco.cherkashin.forlabs.ru/info/dec.png', '', 1, 'geo', 2, 2),
('geo_25', 'Площадь Конституции', 'Площадь Конституции', 52.28087696742248, 104.31306123733520, '', '', 1, 'geo', 2, 2),
('geo_26', 'П Роща Звездочка', 'Роща Звездочка', 52.27366052497019, 104.26088347361656, '', '', 1, 'geo', 2, 2),
('geo_27', 'П Остров Юность', 'Остров Юность', 52.27130288435576, 104.27609696314903, '', 'Расположен посреди реки Ангара в центральной части Иркутска. Попасть сюда можно перебравшись по мосту, соединяющему центр города с островом. С острова «»Юность»» открывается прекрасный вид на Ангару. Ровный рельеф подходит для катания на роликах.  Летом регулярно проводятся развлекательные мероприятия для детей и взрослых.', 1, 'geo', 2, 2),
('geo_28', 'П Парк имени Парижской коммуны ', 'Парк имени Парижской коммуны ', 52.28782093030350, 104.24996859990642, '', '', 1, 'geo', 2, 2),
('geo_29', 'П Парк Комсомольский ', 'Парк Комсомольский ', 52.35374302760751, 104.21775344591879, '', '', 1, 'geo', 2, 2),
('geo_3', 'П Парк им. Парижской Коммуны', 'Парк им. Парижской Коммуны', 52.28770424377085, 104.24934868744458, '', '', 1, 'geo', 2, 2),
('geo_30', 'П Кайская роща', 'Кайская роща', 52.27645346306818, 104.23565751261776, '', 'Здесь сохранились таежные растения и животные, которых можно увидеть только в дикой природе. Рощу считают реликтовой, благодаря столетним соснам, некогда бывшим частью великой сибирской тайги, сохранившейся зелёным островом посреди Свердловского района ', 1, 'geo', 2, 2),
('geo_31', 'Законодательное собрание Иркутской области.', 'Законодательное собрание Иркутской области.', 52.29012624269830, 104.28052909974212, '', 'Законодательное собрание Иркутской области. Комитет по законодательству о природопользовании, экологии и сельском хозяйстве.', 1, 'geo', 5, 8),
('geo_32', 'Министерство природных ресурсов и экологии Иркутской области.', 'Министерство природных ресурсов и экологии Иркутской области.', 52.27678109420836, 104.28453401302250, '', '', 1, 'geo', 5, 8),
('geo_33', 'Служба по охране и использованию животного мира Иркутской области.  ', 'Служба по охране и использованию животного мира Иркутской области.  ', 52.28288620121288, 104.29793921106466, '', '', 1, 'geo', 5, 8),
('geo_34', 'Служба по охране природы и озера Байкал Иркутской области.', 'Служба по охране природы и озера Байкал Иркутской области.', 52.23068385912989, 104.30308368795522, '', '', 1, 'geo', 5, 8),
('geo_35', 'Иркутский центр по мониторингу загрязнения окружающей среды (Иркутский ЦМС).', 'Иркутский центр по мониторингу загрязнения окружающей среды (Иркутский ЦМС).', 52.27194082254700, 104.30890279410960, '', '', 1, 'geo', 5, 8),
('geo_36', 'ППФС «Тактика» ООО. Переработка пластикового вторсырья', '«Тактика» ООО.', 52.25683204897942, 104.25835415117035, '', 'Переработка пластикового вторсырья', 1, 'geo', 7, 16),
('geo_37', 'ППФС «СибЭкоТранс» ООО. ', '«СибЭкоТранс» ООО. ', 52.25642500171843, 104.32425549035542, '', 'Сбор и транспортировка ТБО, утилизация отходов, вторсырьё.', 1, 'geo', 7, 16),
('geo_38', 'ППФС «Вторма-Байкал» ООО.', '«Вторма-Байкал» ООО.', 52.35406130616767, 104.15744483470917, '', 'Утилизация отходов, переработка макулатуры, производство эковаты. ', 1, 'geo', 7, 16),
('geo_39', 'ППФС «Ломовик». ', '«Ломовик». ', 52.33016259725235, 104.21129822731018, '', 'Приём макулатуры. ', 1, 'geo', 7, 16),
('geo_4', 'Власть', 'Министерство природных ресурсов и экологии Иркутской области.  ', 52.27712344336309, 104.28423915805070, '', 'Министерство природных ресурсов и экологии Иркутской области.  ', 1, 'geo', 5, 8),
('geo_40', 'Квест Эко-сюрприз', 'Эко-сюрприз', 52.27532075578149, 104.28050410826824, '', 'Найди эко-сюрприз, начни игру.', 1, 'geo', 11, 2),
('geo_41', 'ППФС «Вторсырьё».', '«Вторсырьё».', 52.24267649034413, 104.27800015186221, '', 'Приём пластмассовой и ПЭТ тары.', 1, 'geo', 7, 16),
('geo_42', 'Власть', 'Служба по охране и использованию животного мира Иркутской области.', 52.28356947362746, 104.29772940875410, '', 'Служба по охране и использованию животного мира Иркутской области.', 1, 'geo', 5, 8),
('geo_43', 'Власть', 'Служба ветеринарии Иркутской области', 52.28258823335245, 104.31636319755853, '', 'Служба ветеринарии Иркутской области', 1, 'geo', 5, 8),
('geo_44', 'Власть', 'Служба по охране природы и озера Байкал Иркутской области.', 52.23117527000311, 104.30260330438614, '', 'Служба по охране природы и озера Байкал Иркутской области.', 1, 'geo', 5, 8),
('geo_45', 'Власть', 'Агентство лесного хозяйства Иркутской области.', 52.28651729719711, 104.28724148864603, '', 'Агентство лесного хозяйства Иркутской области.', 1, 'geo', 5, 8),
('geo_46', 'Власть', 'Агентство по туризму Иркутской области.', 52.28182790487504, 104.28408074671097, '', 'Агентство по туризму Иркутской области.', 1, 'geo', 5, 8),
('geo_47', 'Власть', 'Уполномоченный по правам человека в Иркутской области.', 52.28656169566809, 104.28735510706247, '', 'Уполномоченный по правам человека в Иркутской области.', 1, 'geo', 5, 8),
('geo_48', 'Власть', 'Западно-Байкальская межрайонная прокуратура (на правах природоохранной)', 52.28788739460009, 104.29289008675368, '', 'Западно-Байкальская межрайонная прокуратура (на правах природоохранной)', 1, 'geo', 5, 8),
('geo_49', 'Власть', 'Управление Росприроднадзора по Иркутской области.', 52.28645071580565, 104.27578279673071, '', 'Управление Росприроднадзора по Иркутской области.', 1, 'geo', 5, 8),
('geo_5', 'Власть', 'Министерство здравоохранения Иркутской области.', 52.28533634048218, 104.28756241502015, '', 'Министерство здравоохранения Иркутской области.', 1, 'geo', 5, 8),
('geo_50', 'Власть', 'Управление Роспотребнадзора по Иркутской области.', 52.27709785874747, 104.27924378514944, '', 'Управление Роспотребнадзора по Иркутской области.', 1, 'geo', 5, 8),
('geo_6', 'Урна', 'Урна', 52.25097700000000, 104.26706500000000, '', '', 1, 'geo', 1, 1),
('geo_7', 'Урна', 'Урна', 52.25073967961016, 104.26761451876450, '', '', 1, 'geo', 1, 1),
('geo_8', 'Урна', 'Урна', 52.25075600000000, 104.26890100000000, '', '', 1, 'geo', 1, 1),
('geo_9', 'Урна', 'Урна', 52.25038100000000, 104.26833500000000, '', '', 1, 'geo', 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `POIAction`
--

CREATE TABLE IF NOT EXISTS `POIAction` (
  `poiID` varchar(255) NOT NULL,
  `label` varchar(30) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `autoTriggerRange` int(10) DEFAULT NULL,
  `autoTriggerOnly` tinyint(1) DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contentType` varchar(255) DEFAULT 'application/vnd.layar.internal',
  `method` enum('GET','POST') DEFAULT 'GET',
  `activityType` int(2) DEFAULT NULL,
  `params` varchar(255) DEFAULT NULL,
  `closeBiw` tinyint(1) DEFAULT '0',
  `showActivity` tinyint(1) DEFAULT '1',
  `activityMessage` varchar(255) DEFAULT NULL,
  `autoTrigger` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `poiID` (`poiID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=86 ;

--
-- Дамп данных таблицы `POIAction`
--

INSERT INTO `POIAction` (`poiID`, `label`, `uri`, `autoTriggerRange`, `autoTriggerOnly`, `id`, `contentType`, `method`, `activityType`, `params`, `closeBiw`, `showActivity`, `activityMessage`, `autoTrigger`) VALUES
('geo_21', 'Подробнее', 'http://primer', NULL, NULL, 1, 'Text/html', 'GET', 1, 'lat,lon', 0, 1, NULL, 0),
('geo_21', 'Телефон', 'tel:1234567890', NULL, NULL, 2, 'application/vnd.layar.internal', 'GET', 4, 'alt,lang', 0, 1, NULL, 0),
('geo_21', 'Почта', 'mailto:info@layar.com', NULL, NULL, 3, 'application/vnd.layar.internal', 'GET', 5, 'countrycode,localCountryCode', 0, 1, NULL, 0),
('geo_21', 'Аудио', 'http://maomao.fixedpoint.nl/temp/layar_images/music.mp3', NULL, NULL, 4, 'audio/mpeg', 'GET', 2, 'version', 0, 1, NULL, 0),
('geo_21', 'Видео', 'http://demo.jsource.nl/g1p.mp4', NULL, NULL, 5, 'video/mp4', 'GET', 3, NULL, 0, 1, NULL, 0),
('geo_12', 'Телефон', 'tel:244136', NULL, NULL, 6, 'application/vnd.layar.internal', 'GET', 4, 'alt,lang', 0, 1, NULL, 0),
('geo_12', 'Почта', 'mailto:eko-produkt723435@yandex.ru', NULL, NULL, 7, 'application/vnd.layar.internal', 'GET', 5, 'countrycode,localCountryCode', 0, 1, NULL, 0),
('geo_13', 'Телефон', 'tel:931010', NULL, NULL, 8, 'application/vnd.layar.internal', 'GET', 4, 'alt,lang', 0, 1, NULL, 0),
('geo_13', 'Сайт', 'http://www.organic-studio.ru/', NULL, NULL, 9, 'Text/html', 'GET', 1, 'lat,lon', 0, 1, NULL, 0),
('geo_14', 'Телефон', 'tel:332231', NULL, NULL, 10, 'application/vnd.layar.internal', 'GET', 4, 'alt,lang', 0, 1, NULL, 0),
('geo_15', 'Почта', 'mailto:eco-bazar@yandex.ru', NULL, NULL, 11, 'application/vnd.layar.internal', 'GET', 5, 'countrycode,localCountryCode', 0, 1, NULL, 0),
('geo_15', 'Телефон', 'tel:650765', NULL, NULL, 12, 'application/vnd.layar.internal', 'GET', 4, 'alt,lang', 0, 1, NULL, 0),
('geo_15', 'Сайт', 'http://эко-базар.рф/', NULL, NULL, 13, 'Text/html', 'GET', 1, 'lat,lon', 0, 1, NULL, 0),
('geo_16', 'Телефон', 'tel:663852', NULL, NULL, 14, 'application/vnd.layar.internal', 'GET', 4, 'alt,lang', 0, 1, NULL, 0),
('geo_13', 'Почта', 'mailto:ecopolza@gmail.com ', NULL, NULL, 16, 'application/vnd.layar.internal', 'GET', 5, 'countrycode,localCountryCode', 0, 1, NULL, 0),
('geo_17\r\n', 'Телефон', 'tel:525870 ', NULL, NULL, 17, 'application/vnd.layar.internal', 'GET', 4, 'alt,lang', 0, 1, NULL, 0),
('geo_17\r\n', 'Почта', 'mailto:baikalwave2010@gmail.com ', NULL, NULL, 18, 'application/vnd.layar.internal', 'GET', 5, 'countrycode,localCountryCode', 0, 1, NULL, 0),
('geo_18\r\n', 'Телефон', 'tel:342328', NULL, NULL, 19, 'application/vnd.layar.internal', 'GET', 4, 'alt,lang', 0, 1, NULL, 0),
('geo_18\r\n', 'Почта', 'mailto:voopbeis@mail.ru ', NULL, NULL, 20, 'application/vnd.layar.internal', 'GET', 5, 'countrycode,localCountryCode', 0, 1, NULL, 0),
('geo_18\r\n', 'Сайт', 'http://voopirk.ru/', NULL, NULL, 21, 'Text/html', 'GET', 1, 'lat,lon', 0, 1, NULL, 0),
('geo_20', 'Телефон', 'tel:413476', NULL, NULL, 22, 'application/vnd.layar.internal', 'GET', 4, 'alt,lang', 0, 1, NULL, 0),
('geo_20', 'Сайт', 'http://bg.isu.ru/ru/index.html', NULL, NULL, 23, 'Text/html', 'GET', 1, 'lat,lon', 0, 1, NULL, 0),
('geo_19', 'Телефон', 'tel:395020', NULL, NULL, 24, 'application/vnd.layar.internal', 'GET', 4, 'alt,lang', 0, 1, NULL, 0),
('geo_19', 'Сайт', 'http://www.kurortangara.ru/?view=featured', NULL, NULL, 25, 'Text/html', 'GET', 1, 'lat,lon', 0, 1, NULL, 0),
('geo_23', 'Телефон', 'tel:616400', NULL, NULL, 26, 'application/vnd.layar.internal', 'GET', 4, 'alt,lang', 0, 1, NULL, 0),
('geo_23', 'Сайт', 'http://chipola.ru/ostrov/', NULL, NULL, 27, 'Text/html', 'GET', 1, 'lat,lon', 0, 1, NULL, 0),
('geo_31', 'Телефон', 'tel:241741 ', NULL, NULL, 28, 'application/vnd.layar.internal', 'GET', 4, 'alt,lang', 0, 1, NULL, 0),
('geo_31', 'Почта', 'mailto:aldarov@duma.irkutsk.ru  ', NULL, NULL, 29, 'application/vnd.layar.internal', 'GET', 5, 'countrycode,localCountryCode', 0, 1, NULL, 0),
('geo_32', 'Телефон', 'tel:200563', NULL, NULL, 30, 'application/vnd.layar.internal', 'GET', 4, 'alt,lang', 0, 1, NULL, 0),
('geo_32', 'Почта', 'mailto:eco_exam@govirk.ru ', NULL, NULL, 31, 'application/vnd.layar.internal', 'GET', 5, 'countrycode,localCountryCode', 0, 1, NULL, 0),
('geo_32', 'Сайт', 'http://ecology.irkobl.ru ', NULL, NULL, 32, 'Text/html', 'GET', 1, 'lat,lon', 0, 1, NULL, 0),
('geo_33', 'Телефон', 'tel:20-90-89', NULL, NULL, 33, 'application/vnd.layar.internal', 'GET', 4, 'alt,lang', 0, 1, NULL, 0),
('geo_33', 'Сайт', 'http://faunaworld.irkobl.ru ', NULL, NULL, 34, 'Text/html', 'GET', 1, 'lat,lon', 0, 1, NULL, 0),
('geo_34', 'Телефон', 'tel:42-05-89', NULL, NULL, 35, 'application/vnd.layar.internal', 'GET', 4, 'alt,lang', 0, 1, NULL, 0),
('geo_34', 'Почта', 'mailto:i.galtseva@govirk.ru  ', NULL, NULL, 36, 'application/vnd.layar.internal', 'GET', 5, 'countrycode,localCountryCode', 0, 1, NULL, 0),
('geo_35', 'Телефон', 'tel:206875', NULL, NULL, 37, 'application/vnd.layar.internal', 'GET', 4, 'alt,lang', 0, 1, NULL, 0),
('geo_35', 'Почта', 'mailto:gmc@irmeteo.ru  ', NULL, NULL, 38, 'application/vnd.layar.internal', 'GET', 5, 'countrycode,localCountryCode', 0, 1, NULL, 0),
('geo_35', 'Сайт', 'http://www.irmeteo.ru  ', NULL, NULL, 39, 'Text/html', 'GET', 1, 'lat,lon', 0, 1, NULL, 0),
('geo_34', 'Сайт', 'http://baikal.irkobl.ru ', NULL, NULL, 40, 'Text/html', 'GET', 1, 'lat,lon', 0, 1, NULL, 0),
('geo_36', 'Телефон', 'tel:333055', NULL, NULL, 41, 'application/vnd.layar.internal', 'GET', 4, 'alt,lang', 0, 1, NULL, 0),
('geo_36', 'Почта', 'mailto:g25i@mail.ru ', NULL, NULL, 42, 'application/vnd.layar.internal', 'GET', 5, 'countrycode,localCountryCode', 0, 1, NULL, 0),
('geo_36', 'Сайт', 'http://www.taktika-irk.ru ', NULL, NULL, 43, 'Text/html', 'GET', 1, 'lat,lon', 0, 1, NULL, 0),
('geo_37', 'Телефон', 'tel:406604', NULL, NULL, 44, 'application/vnd.layar.internal', 'GET', 4, 'alt,lang', 0, 1, NULL, 0),
('geo_37', 'Почта', 'mailto:sibekotrans@mail.ru  ', NULL, NULL, 45, 'application/vnd.layar.internal', 'GET', 5, 'countrycode,localCountryCode', 0, 1, NULL, 0),
('geo_38', 'Телефон', 'tel:475638', NULL, NULL, 46, 'application/vnd.layar.internal', 'GET', 4, 'alt,lang', 0, 1, NULL, 0),
('geo_38', 'Почта', 'mailto:vm-baikal@mail.ru  ', NULL, NULL, 47, 'application/vnd.layar.internal', 'GET', 5, 'countrycode,localCountryCode', 0, 1, NULL, 0),
('geo_38', 'Сайт', 'http://www.vtorma-baikal.ru  ', NULL, NULL, 48, 'Text/html', 'GET', 1, 'lat,lon', 0, 1, NULL, 0),
('geo_39', 'Телефон', 'tel:89149372070', NULL, NULL, 49, 'application/vnd.layar.internal', 'GET', 4, 'alt,lang', 0, 1, NULL, 0),
('geo_41', 'Телефон', 'tel:8395275654', NULL, NULL, 50, 'application/vnd.layar.internal', 'GET', 4, 'alt,lang', 0, 1, NULL, 0),
('geo_2', 'Телефон', 'tel:88001000038', NULL, NULL, 51, 'application/vnd.layar.internal', 'GET', 4, 'alt,lang', 0, 1, NULL, 0),
('geo_2', 'Сайт', 'http://irkobl.ru/', NULL, NULL, 52, 'Text/html', 'GET', 1, 'lat,lon', 0, 1, NULL, 0),
('geo_4', 'Телефон', 'tel:83952200563', NULL, NULL, 53, 'application/vnd.layar.internal', 'GET', 4, 'alt,lang', 0, 1, NULL, 0),
('geo_4', 'Сайт', 'http://ecology.irkobl.ru', NULL, NULL, 54, 'Text/html', 'GET', 1, 'lat,lon', 0, 1, NULL, 0),
('geo_5', 'Телефон', 'tel:240586', NULL, NULL, 55, 'application/vnd.layar.internal', 'GET', 4, 'alt,lang', 0, 1, NULL, 0),
('geo_5', 'Сайт', 'http://www.minzdrav-irkutsk.ru', NULL, NULL, 56, 'Text/html', 'GET', 1, 'lat,lon', 0, 1, NULL, 0),
('geo_5', 'Почта', 'mailto:guzio@guzio.ru', NULL, NULL, 57, 'application/vnd.layar.internal', 'GET', 5, 'countrycode,localCountryCode', 0, 1, NULL, 0),
('geo_42', 'Телефон', 'tel:83952209089', NULL, NULL, 58, 'application/vnd.layar.internal', 'GET', 4, 'alt,lang', 0, 1, NULL, 0),
('geo_42', 'Сайт', 'http://faunaworld.irkobl.ru', NULL, NULL, 59, 'Text/html', 'GET', 1, 'lat,lon', 0, 1, NULL, 0),
('geo_4', 'Почта', 'mailto:eco_exam@govirk.ru  ', NULL, NULL, 60, 'application/vnd.layar.internal', 'GET', 5, 'countrycode,localCountryCode', 0, 1, NULL, 0),
('geo_43', 'Телефон', 'tel:8(3952) 252-369', NULL, NULL, 61, 'application/vnd.layar.internal', 'GET', 4, 'alt,lang', 0, 1, NULL, 0),
('geo_43', 'Почта', 'mailto:vet@govirk.ru', NULL, NULL, 62, 'application/vnd.layar.internal', 'GET', 5, 'countrycode,localCountryCode', 0, 1, NULL, 0),
('geo_43', 'Сайт', 'http://www.irkobl.ru/sites/vet', NULL, NULL, 63, 'Text/html', 'GET', 1, 'lat,lon', 0, 1, NULL, 0),
('geo_44', 'Телефон', 'tel:83952420589', NULL, NULL, 64, 'application/vnd.layar.internal', 'GET', 4, 'alt,lang', 0, 1, NULL, 0),
('geo_44', 'Почта', 'mailto:i.galtseva@govirk.ru', NULL, NULL, 65, 'application/vnd.layar.internal', 'GET', 5, 'countrycode,localCountryCode', 0, 1, NULL, 0),
('geo_44', 'Сайт', 'http://baikal.irkobl.ru', NULL, NULL, 66, 'Text/html', 'GET', 1, 'lat,lon', 0, 1, NULL, 0),
('geo_45', 'Телефон', 'tel:83952335981', NULL, NULL, 67, 'application/vnd.layar.internal', 'GET', 4, 'alt,lang', 0, 1, NULL, 0),
('geo_45', 'Почта', 'mailto:baikal@lesirk.ru', NULL, NULL, 68, 'application/vnd.layar.internal', 'GET', 5, 'countrycode,localCountryCode', 0, 1, NULL, 0),
('geo_45', 'Сайт', 'http://irkobl.ru/sites/alh', NULL, NULL, 69, 'Text/html', 'GET', 1, 'lat,lon', 0, 1, NULL, 0),
('geo_46', 'Телефон', 'tel:83952217283', NULL, NULL, 70, 'application/vnd.layar.internal', 'GET', 4, 'alt,lang', 0, 1, NULL, 0),
('geo_46', 'Сайт', 'http://tour.irkobl.ru', NULL, NULL, 71, 'Text/html', 'GET', 1, 'lat,lon', 0, 1, NULL, 0),
('geo_46', 'Почта', 'mailto:tour@govirk.ru', NULL, NULL, 72, 'application/vnd.layar.internal', 'GET', 5, 'countrycode,localCountryCode', 0, 1, NULL, 0),
('geo_47', 'Сайт', 'http://ombudsman.r38.ru', NULL, NULL, 73, 'Text/html', 'GET', 1, 'lat,lon', 0, 1, NULL, 0),
('geo_47', 'Телефон', 'tel:83952241615', NULL, NULL, 74, 'application/vnd.layar.internal', 'GET', 4, 'alt,lang', 0, 1, NULL, 0),
('geo_47', 'Почта', 'mailto:upch@govirk.ru', NULL, NULL, 75, 'application/vnd.layar.internal', 'GET', 5, 'countrycode,localCountryCode', 0, 1, NULL, 0),
('geo_48', 'Телефон', 'tel:83952253012', NULL, NULL, 76, 'application/vnd.layar.internal', 'GET', 4, 'alt,lang', 0, 1, NULL, 0),
('geo_48', 'Почта', 'mailto:procuror@pr.irkutsk.ru', NULL, NULL, 77, 'application/vnd.layar.internal', 'GET', 5, 'countrycode,localCountryCode', 0, 1, NULL, 0),
('geo_48', 'Сайт', 'http://www.irkproc.ru', NULL, NULL, 78, 'Text/html', 'GET', 1, 'lat,lon', 0, 1, NULL, 0),
('geo_49', 'Сайт', 'http://www.rpnirk.ru', NULL, NULL, 79, 'Text/html', 'GET', 1, 'lat,lon', 0, 1, NULL, 0),
('geo_49', 'Почта', 'mailto:kanc@rpnirk.ru', NULL, NULL, 80, 'application/vnd.layar.internal', 'GET', 5, 'countrycode,localCountryCode', 0, 1, NULL, 0),
('geo_49', 'Телефон', 'tel:83952201687', NULL, NULL, 81, 'application/vnd.layar.internal', 'GET', 4, 'alt,lang', 0, 1, NULL, 0),
('geo_50', 'Телефон', 'tel:83952243367', NULL, NULL, 82, 'application/vnd.layar.internal', 'GET', 4, 'alt,lang', 0, 1, NULL, 0),
('geo_50', 'Почта', 'mailto:mail@38.rospotrebnadzor.ru ', NULL, NULL, 83, 'application/vnd.layar.internal', 'GET', 5, 'countrycode,localCountryCode', 0, 1, NULL, 0),
('geo_50', 'Сайт', 'http://38.rospotrebnadzor.ru', NULL, NULL, 84, 'Text/html', 'GET', 1, 'lat,lon', 0, 1, NULL, 0),
('geo_50', '', '', NULL, 0, 85, 'application/vnd.layar.internal', 'GET', NULL, NULL, 0, 1, NULL, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
