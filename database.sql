-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-06-2015 a las 22:43:03
-- Versión del servidor: 5.5.39
-- Versión de PHP: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `system`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accounting_entry`
--

CREATE TABLE IF NOT EXISTS `accounting_entry` (
`id` bigint(20) unsigned NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_deleted` datetime DEFAULT NULL,
  `id_business` bigint(20) unsigned NOT NULL DEFAULT '1',
  `id_account_type` bigint(20) unsigned NOT NULL,
  `id_client` bigint(20) unsigned DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `payment_due_date` datetime DEFAULT NULL,
  `description` text,
  `debit` double unsigned NOT NULL DEFAULT '0',
  `credit` double unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=48 ;

--
-- Disparadores `accounting_entry`
--
DELIMITER //
CREATE TRIGGER `accounting_entry_date_created` BEFORE INSERT ON `accounting_entry`
 FOR EACH ROW set new.`date_created` = now()
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `account_type`
--

CREATE TABLE IF NOT EXISTS `account_type` (
`id` bigint(20) unsigned NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_deleted` datetime DEFAULT NULL,
  `name` varchar(35) NOT NULL,
  `description` text
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `account_type`
--

INSERT INTO `account_type` (`id`, `date_created`, `date_deleted`, `name`, `description`) VALUES
(1, '2015-03-15 07:32:12', NULL, 'caja', '');

--
-- Disparadores `account_type`
--
DELIMITER //
CREATE TRIGGER `account_type_date_created` BEFORE INSERT ON `account_type`
 FOR EACH ROW set new.`date_created` = now()
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrator`
--

CREATE TABLE IF NOT EXISTS `administrator` (
`id` bigint(20) unsigned NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_deleted` datetime DEFAULT NULL,
  `first_name` varchar(35) NOT NULL,
  `last_name` varchar(35) NOT NULL,
  `sex` char(1) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `address` varchar(40) DEFAULT NULL,
  `description` text,
  `id_country` int(10) unsigned DEFAULT NULL,
  `id_state` int(10) unsigned DEFAULT NULL,
  `id_city` int(10) unsigned DEFAULT NULL,
  `zip_code` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Disparadores `administrator`
--
DELIMITER //
CREATE TRIGGER `administrator_date_created` BEFORE INSERT ON `administrator`
 FOR EACH ROW set new.`date_created` = now()
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `business`
--

CREATE TABLE IF NOT EXISTS `business` (
`id` bigint(20) unsigned NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_deleted` datetime DEFAULT NULL,
  `name` varchar(35) NOT NULL,
  `description` text
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `business`
--

INSERT INTO `business` (`id`, `date_created`, `date_deleted`, `name`, `description`) VALUES
(1, '2015-03-15 07:53:33', NULL, 'Ascensoft', NULL);

--
-- Disparadores `business`
--
DELIMITER //
CREATE TRIGGER `business_date_created` BEFORE INSERT ON `business`
 FOR EACH ROW set new.`date_created` = now()
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `city`
--

CREATE TABLE IF NOT EXISTS `city` (
`id` int(11) unsigned NOT NULL,
  `id_state` int(11) unsigned NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2383 ;

--
-- Volcado de datos para la tabla `city`
--

INSERT INTO `city` (`id`, `id_state`, `name`) VALUES
(1, 1, '25 de Mayo'),
(2, 1, '3 de febrero'),
(3, 1, 'A. Alsina'),
(4, 1, 'A. Gonzáles Cháves'),
(5, 1, 'Aguas Verdes'),
(6, 1, 'Alberti'),
(7, 1, 'Arrecifes'),
(8, 1, 'Ayacucho'),
(9, 1, 'Azul'),
(10, 1, 'Bahía Blanca'),
(11, 1, 'Balcarce'),
(12, 1, 'Baradero'),
(13, 1, 'Benito Juárez'),
(14, 1, 'Berisso'),
(15, 1, 'Bolívar'),
(16, 1, 'Bragado'),
(17, 1, 'Brandsen'),
(18, 1, 'Campana'),
(19, 1, 'Cañuelas'),
(20, 1, 'Capilla del Señor'),
(21, 1, 'Capitán Sarmiento'),
(22, 1, 'Carapachay'),
(23, 1, 'Carhue'),
(24, 1, 'Cariló'),
(25, 1, 'Carlos Casares'),
(26, 1, 'Carlos Tejedor'),
(27, 1, 'Carmen de Areco'),
(28, 1, 'Carmen de Patagones'),
(29, 1, 'Castelli'),
(30, 1, 'Chacabuco'),
(31, 1, 'Chascomús'),
(32, 1, 'Chivilcoy'),
(33, 1, 'Colón'),
(34, 1, 'Coronel Dorrego'),
(35, 1, 'Coronel Pringles'),
(36, 1, 'Coronel Rosales'),
(37, 1, 'Coronel Suarez'),
(38, 1, 'Costa Azul'),
(39, 1, 'Costa Chica'),
(40, 1, 'Costa del Este'),
(41, 1, 'Costa Esmeralda'),
(42, 1, 'Daireaux'),
(43, 1, 'Darregueira'),
(44, 1, 'Del Viso'),
(45, 1, 'Dolores'),
(46, 1, 'Don Torcuato'),
(47, 1, 'Ensenada'),
(48, 1, 'Escobar'),
(49, 1, 'Exaltación de la Cruz'),
(50, 1, 'Florentino Ameghino'),
(51, 1, 'Garín'),
(52, 1, 'Gral. Alvarado'),
(53, 1, 'Gral. Alvear'),
(54, 1, 'Gral. Arenales'),
(55, 1, 'Gral. Belgrano'),
(56, 1, 'Gral. Guido'),
(57, 1, 'Gral. Lamadrid'),
(58, 1, 'Gral. Las Heras'),
(59, 1, 'Gral. Lavalle'),
(60, 1, 'Gral. Madariaga'),
(61, 1, 'Gral. Pacheco'),
(62, 1, 'Gral. Paz'),
(63, 1, 'Gral. Pinto'),
(64, 1, 'Gral. Pueyrredón'),
(65, 1, 'Gral. Rodríguez'),
(66, 1, 'Gral. Viamonte'),
(67, 1, 'Gral. Villegas'),
(68, 1, 'Guaminí'),
(69, 1, 'Guernica'),
(70, 1, 'Hipólito Yrigoyen'),
(71, 1, 'Ing. Maschwitz'),
(72, 1, 'Junín'),
(73, 1, 'La Plata'),
(74, 1, 'Laprida'),
(75, 1, 'Las Flores'),
(76, 1, 'Las Toninas'),
(77, 1, 'Leandro N. Alem'),
(78, 1, 'Lincoln'),
(79, 1, 'Loberia'),
(80, 1, 'Lobos'),
(81, 1, 'Los Cardales'),
(82, 1, 'Los Toldos'),
(83, 1, 'Lucila del Mar'),
(84, 1, 'Luján'),
(85, 1, 'Magdalena'),
(86, 1, 'Maipú'),
(87, 1, 'Mar Chiquita'),
(88, 1, 'Mar de Ajó'),
(89, 1, 'Mar de las Pampas'),
(90, 1, 'Mar del Plata'),
(91, 1, 'Mar del Tuyú'),
(92, 1, 'Marcos Paz'),
(93, 1, 'Mercedes'),
(94, 1, 'Miramar'),
(95, 1, 'Monte'),
(96, 1, 'Monte Hermoso'),
(97, 1, 'Munro'),
(98, 1, 'Navarro'),
(99, 1, 'Necochea'),
(100, 1, 'Olavarría'),
(101, 1, 'Partido de la Costa'),
(102, 1, 'Pehuajó'),
(103, 1, 'Pellegrini'),
(104, 1, 'Pergamino'),
(105, 1, 'Pigüé'),
(106, 1, 'Pila'),
(107, 1, 'Pilar'),
(108, 1, 'Pinamar'),
(109, 1, 'Pinar del Sol'),
(110, 1, 'Polvorines'),
(111, 1, 'Pte. Perón'),
(112, 1, 'Puán'),
(113, 1, 'Punta Indio'),
(114, 1, 'Ramallo'),
(115, 1, 'Rauch'),
(116, 1, 'Rivadavia'),
(117, 1, 'Rojas'),
(118, 1, 'Roque Pérez'),
(119, 1, 'Saavedra'),
(120, 1, 'Saladillo'),
(121, 1, 'Salliqueló'),
(122, 1, 'Salto'),
(123, 1, 'San Andrés de Giles'),
(124, 1, 'San Antonio de Areco'),
(125, 1, 'San Antonio de Padua'),
(126, 1, 'San Bernardo'),
(127, 1, 'San Cayetano'),
(128, 1, 'San Clemente del Tuyú'),
(129, 1, 'San Nicolás'),
(130, 1, 'San Pedro'),
(131, 1, 'San Vicente'),
(132, 1, 'Santa Teresita'),
(133, 1, 'Suipacha'),
(134, 1, 'Tandil'),
(135, 1, 'Tapalqué'),
(136, 1, 'Tordillo'),
(137, 1, 'Tornquist'),
(138, 1, 'Trenque Lauquen'),
(139, 1, 'Tres Lomas'),
(140, 1, 'Villa Gesell'),
(141, 1, 'Villarino'),
(142, 1, 'Zárate'),
(143, 2, '11 de Septiembre'),
(144, 2, '20 de Junio'),
(145, 2, '25 de Mayo'),
(146, 2, 'Acassuso'),
(147, 2, 'Adrogué'),
(148, 2, 'Aldo Bonzi'),
(149, 2, 'Área Reserva Cinturón Ecológico'),
(150, 2, 'Avellaneda'),
(151, 2, 'Banfield'),
(152, 2, 'Barrio Parque'),
(153, 2, 'Barrio Santa Teresita'),
(154, 2, 'Beccar'),
(155, 2, 'Bella Vista'),
(156, 2, 'Berazategui'),
(157, 2, 'Bernal Este'),
(158, 2, 'Bernal Oeste'),
(159, 2, 'Billinghurst'),
(160, 2, 'Boulogne'),
(161, 2, 'Burzaco'),
(162, 2, 'Carapachay'),
(163, 2, 'Caseros'),
(164, 2, 'Castelar'),
(165, 2, 'Churruca'),
(166, 2, 'Ciudad Evita'),
(167, 2, 'Ciudad Madero'),
(168, 2, 'Ciudadela'),
(169, 2, 'Claypole'),
(170, 2, 'Crucecita'),
(171, 2, 'Dock Sud'),
(172, 2, 'Don Bosco'),
(173, 2, 'Don Orione'),
(174, 2, 'El Jagüel'),
(175, 2, 'El Libertador'),
(176, 2, 'El Palomar'),
(177, 2, 'El Tala'),
(178, 2, 'El Trébol'),
(179, 2, 'Ezeiza'),
(180, 2, 'Ezpeleta'),
(181, 2, 'Florencio Varela'),
(182, 2, 'Florida'),
(183, 2, 'Francisco Álvarez'),
(184, 2, 'Gerli'),
(185, 2, 'Glew'),
(186, 2, 'González Catán'),
(187, 2, 'Gral. Lamadrid'),
(188, 2, 'Grand Bourg'),
(189, 2, 'Gregorio de Laferrere'),
(190, 2, 'Guillermo Enrique Hudson'),
(191, 2, 'Haedo'),
(192, 2, 'Hurlingham'),
(193, 2, 'Ing. Sourdeaux'),
(194, 2, 'Isidro Casanova'),
(195, 2, 'Ituzaingó'),
(196, 2, 'José C. Paz'),
(197, 2, 'José Ingenieros'),
(198, 2, 'José Marmol'),
(199, 2, 'La Lucila'),
(200, 2, 'La Reja'),
(201, 2, 'La Tablada'),
(202, 2, 'Lanús'),
(203, 2, 'Llavallol'),
(204, 2, 'Loma Hermosa'),
(205, 2, 'Lomas de Zamora'),
(206, 2, 'Lomas del Millón'),
(207, 2, 'Lomas del Mirador'),
(208, 2, 'Longchamps'),
(209, 2, 'Los Polvorines'),
(210, 2, 'Luis Guillón'),
(211, 2, 'Malvinas Argentinas'),
(212, 2, 'Martín Coronado'),
(213, 2, 'Martínez'),
(214, 2, 'Merlo'),
(215, 2, 'Ministro Rivadavia'),
(216, 2, 'Monte Chingolo'),
(217, 2, 'Monte Grande'),
(218, 2, 'Moreno'),
(219, 2, 'Morón'),
(220, 2, 'Muñiz'),
(221, 2, 'Olivos'),
(222, 2, 'Pablo Nogués'),
(223, 2, 'Pablo Podestá'),
(224, 2, 'Paso del Rey'),
(225, 2, 'Pereyra'),
(226, 2, 'Piñeiro'),
(227, 2, 'Plátanos'),
(228, 2, 'Pontevedra'),
(229, 2, 'Quilmes'),
(230, 2, 'Rafael Calzada'),
(231, 2, 'Rafael Castillo'),
(232, 2, 'Ramos Mejía'),
(233, 2, 'Ranelagh'),
(234, 2, 'Remedios de Escalada'),
(235, 2, 'Sáenz Peña'),
(236, 2, 'San Antonio de Padua'),
(237, 2, 'San Fernando'),
(238, 2, 'San Francisco Solano'),
(239, 2, 'San Isidro'),
(240, 2, 'San José'),
(241, 2, 'San Justo'),
(242, 2, 'San Martín'),
(243, 2, 'San Miguel'),
(244, 2, 'Santos Lugares'),
(245, 2, 'Sarandí'),
(246, 2, 'Sourigues'),
(247, 2, 'Tapiales'),
(248, 2, 'Temperley'),
(249, 2, 'Tigre'),
(250, 2, 'Tortuguitas'),
(251, 2, 'Tristán Suárez'),
(252, 2, 'Trujui'),
(253, 2, 'Turdera'),
(254, 2, 'Valentín Alsina'),
(255, 2, 'Vicente López'),
(256, 2, 'Villa Adelina'),
(257, 2, 'Villa Ballester'),
(258, 2, 'Villa Bosch'),
(259, 2, 'Villa Caraza'),
(260, 2, 'Villa Celina'),
(261, 2, 'Villa Centenario'),
(262, 2, 'Villa de Mayo'),
(263, 2, 'Villa Diamante'),
(264, 2, 'Villa Domínico'),
(265, 2, 'Villa España'),
(266, 2, 'Villa Fiorito'),
(267, 2, 'Villa Guillermina'),
(268, 2, 'Villa Insuperable'),
(269, 2, 'Villa José León Suárez'),
(270, 2, 'Villa La Florida'),
(271, 2, 'Villa Luzuriaga'),
(272, 2, 'Villa Martelli'),
(273, 2, 'Villa Obrera'),
(274, 2, 'Villa Progreso'),
(275, 2, 'Villa Raffo'),
(276, 2, 'Villa Sarmiento'),
(277, 2, 'Villa Tesei'),
(278, 2, 'Villa Udaondo'),
(279, 2, 'Virrey del Pino'),
(280, 2, 'Wilde'),
(281, 2, 'William Morris'),
(282, 3, 'Agronomía'),
(283, 3, 'Almagro'),
(284, 3, 'Balvanera'),
(285, 3, 'Barracas'),
(286, 3, 'Belgrano'),
(287, 3, 'Boca'),
(288, 3, 'Boedo'),
(289, 3, 'Caballito'),
(290, 3, 'Chacarita'),
(291, 3, 'Coghlan'),
(292, 3, 'Colegiales'),
(293, 3, 'Constitución'),
(294, 3, 'Flores'),
(295, 3, 'Floresta'),
(296, 3, 'La Paternal'),
(297, 3, 'Liniers'),
(298, 3, 'Mataderos'),
(299, 3, 'Monserrat'),
(300, 3, 'Monte Castro'),
(301, 3, 'Nueva Pompeya'),
(302, 3, 'Núñez'),
(303, 3, 'Palermo'),
(304, 3, 'Parque Avellaneda'),
(305, 3, 'Parque Chacabuco'),
(306, 3, 'Parque Chas'),
(307, 3, 'Parque Patricios'),
(308, 3, 'Puerto Madero'),
(309, 3, 'Recoleta'),
(310, 3, 'Retiro'),
(311, 3, 'Saavedra'),
(312, 3, 'San Cristóbal'),
(313, 3, 'San Nicolás'),
(314, 3, 'San Telmo'),
(315, 3, 'Vélez Sársfield'),
(316, 3, 'Versalles'),
(317, 3, 'Villa Crespo'),
(318, 3, 'Villa del Parque'),
(319, 3, 'Villa Devoto'),
(320, 3, 'Villa Gral. Mitre'),
(321, 3, 'Villa Lugano'),
(322, 3, 'Villa Luro'),
(323, 3, 'Villa Ortúzar'),
(324, 3, 'Villa Pueyrredón'),
(325, 3, 'Villa Real'),
(326, 3, 'Villa Riachuelo'),
(327, 3, 'Villa Santa Rita'),
(328, 3, 'Villa Soldati'),
(329, 3, 'Villa Urquiza'),
(330, 4, 'Aconquija'),
(331, 4, 'Ancasti'),
(332, 4, 'Andalgalá'),
(333, 4, 'Antofagasta'),
(334, 4, 'Belén'),
(335, 4, 'Capayán'),
(336, 4, 'Capital'),
(337, 4, '4'),
(338, 4, 'Corral Quemado'),
(339, 4, 'El Alto'),
(340, 4, 'El Rodeo'),
(341, 4, 'F.Mamerto Esquiú'),
(342, 4, 'Fiambalá'),
(343, 4, 'Hualfín'),
(344, 4, 'Huillapima'),
(345, 4, 'Icaño'),
(346, 4, 'La Puerta'),
(347, 4, 'Las Juntas'),
(348, 4, 'Londres'),
(349, 4, 'Los Altos'),
(350, 4, 'Los Varela'),
(351, 4, 'Mutquín'),
(352, 4, 'Paclín'),
(353, 4, 'Poman'),
(354, 4, 'Pozo de La Piedra'),
(355, 4, 'Puerta de Corral'),
(356, 4, 'Puerta San José'),
(357, 4, 'Recreo'),
(358, 4, 'S.F.V de 4'),
(359, 4, 'San Fernando'),
(360, 4, 'San Fernando del Valle'),
(361, 4, 'San José'),
(362, 4, 'Santa María'),
(363, 4, 'Santa Rosa'),
(364, 4, 'Saujil'),
(365, 4, 'Tapso'),
(366, 4, 'Tinogasta'),
(367, 4, 'Valle Viejo'),
(368, 4, 'Villa Vil'),
(369, 5, 'Aviá Teraí'),
(370, 5, 'Barranqueras'),
(371, 5, 'Basail'),
(372, 5, 'Campo Largo'),
(373, 5, 'Capital'),
(374, 5, 'Capitán Solari'),
(375, 5, 'Charadai'),
(376, 5, 'Charata'),
(377, 5, 'Chorotis'),
(378, 5, 'Ciervo Petiso'),
(379, 5, 'Cnel. Du Graty'),
(380, 5, 'Col. Benítez'),
(381, 5, 'Col. Elisa'),
(382, 5, 'Col. Popular'),
(383, 5, 'Colonias Unidas'),
(384, 5, 'Concepción'),
(385, 5, 'Corzuela'),
(386, 5, 'Cote Lai'),
(387, 5, 'El Sauzalito'),
(388, 5, 'Enrique Urien'),
(389, 5, 'Fontana'),
(390, 5, 'Fte. Esperanza'),
(391, 5, 'Gancedo'),
(392, 5, 'Gral. Capdevila'),
(393, 5, 'Gral. Pinero'),
(394, 5, 'Gral. San Martín'),
(395, 5, 'Gral. Vedia'),
(396, 5, 'Hermoso Campo'),
(397, 5, 'I. del Cerrito'),
(398, 5, 'J.J. Castelli'),
(399, 5, 'La Clotilde'),
(400, 5, 'La Eduvigis'),
(401, 5, 'La Escondida'),
(402, 5, 'La Leonesa'),
(403, 5, 'La Tigra'),
(404, 5, 'La Verde'),
(405, 5, 'Laguna Blanca'),
(406, 5, 'Laguna Limpia'),
(407, 5, 'Lapachito'),
(408, 5, 'Las Breñas'),
(409, 5, 'Las Garcitas'),
(410, 5, 'Las Palmas'),
(411, 5, 'Los Frentones'),
(412, 5, 'Machagai'),
(413, 5, 'Makallé'),
(414, 5, 'Margarita Belén'),
(415, 5, 'Miraflores'),
(416, 5, 'Misión N. Pompeya'),
(417, 5, 'Napenay'),
(418, 5, 'Pampa Almirón'),
(419, 5, 'Pampa del Indio'),
(420, 5, 'Pampa del Infierno'),
(421, 5, 'Pdcia. de La Plaza'),
(422, 5, 'Pdcia. Roca'),
(423, 5, 'Pdcia. Roque Sáenz Peña'),
(424, 5, 'Pto. Bermejo'),
(425, 5, 'Pto. Eva Perón'),
(426, 5, 'Puero Tirol'),
(427, 5, 'Puerto Vilelas'),
(428, 5, 'Quitilipi'),
(429, 5, 'Resistencia'),
(430, 5, 'Sáenz Peña'),
(431, 5, 'Samuhú'),
(432, 5, 'San Bernardo'),
(433, 5, 'Santa Sylvina'),
(434, 5, 'Taco Pozo'),
(435, 5, 'Tres Isletas'),
(436, 5, 'Villa Ángela'),
(437, 5, 'Villa Berthet'),
(438, 5, 'Villa R. Bermejito'),
(439, 6, 'Aldea Apeleg'),
(440, 6, 'Aldea Beleiro'),
(441, 6, 'Aldea Epulef'),
(442, 6, 'Alto Río Sengerr'),
(443, 6, 'Buen Pasto'),
(444, 6, 'Camarones'),
(445, 6, 'Carrenleufú'),
(446, 6, 'Cholila'),
(447, 6, 'Co. Centinela'),
(448, 6, 'Colan Conhué'),
(449, 6, 'Comodoro Rivadavia'),
(450, 6, 'Corcovado'),
(451, 6, 'Cushamen'),
(452, 6, 'Dique F. Ameghino'),
(453, 6, 'Dolavón'),
(454, 6, 'Dr. R. Rojas'),
(455, 6, 'El Hoyo'),
(456, 6, 'El Maitén'),
(457, 6, 'Epuyén'),
(458, 6, 'Esquel'),
(459, 6, 'Facundo'),
(460, 6, 'Gaimán'),
(461, 6, 'Gan Gan'),
(462, 6, 'Gastre'),
(463, 6, 'Gdor. Costa'),
(464, 6, 'Gualjaina'),
(465, 6, 'J. de San Martín'),
(466, 6, 'Lago Blanco'),
(467, 6, 'Lago Puelo'),
(468, 6, 'Lagunita Salada'),
(469, 6, 'Las Plumas'),
(470, 6, 'Los Altares'),
(471, 6, 'Paso de los Indios'),
(472, 6, 'Paso del Sapo'),
(473, 6, 'Pto. Madryn'),
(474, 6, 'Pto. Pirámides'),
(475, 6, 'Rada Tilly'),
(476, 6, 'Rawson'),
(477, 6, 'Río Mayo'),
(478, 6, 'Río Pico'),
(479, 6, 'Sarmiento'),
(480, 6, 'Tecka'),
(481, 6, 'Telsen'),
(482, 6, 'Trelew'),
(483, 6, 'Trevelin'),
(484, 6, 'Veintiocho de Julio'),
(485, 7, 'Achiras'),
(486, 7, 'Adelia Maria'),
(487, 7, 'Agua de Oro'),
(488, 7, 'Alcira Gigena'),
(489, 7, 'Aldea Santa Maria'),
(490, 7, 'Alejandro Roca'),
(491, 7, 'Alejo Ledesma'),
(492, 7, 'Alicia'),
(493, 7, 'Almafuerte'),
(494, 7, 'Alpa Corral'),
(495, 7, 'Alta Gracia'),
(496, 7, 'Alto Alegre'),
(497, 7, 'Alto de Los Quebrachos'),
(498, 7, 'Altos de Chipion'),
(499, 7, 'Amboy'),
(500, 7, 'Ambul'),
(501, 7, 'Ana Zumaran'),
(502, 7, 'Anisacate'),
(503, 7, 'Arguello'),
(504, 7, 'Arias'),
(505, 7, 'Arroyito'),
(506, 7, 'Arroyo Algodon'),
(507, 7, 'Arroyo Cabral'),
(508, 7, 'Arroyo Los Patos'),
(509, 7, 'Assunta'),
(510, 7, 'Atahona'),
(511, 7, 'Ausonia'),
(512, 7, 'Avellaneda'),
(513, 7, 'Ballesteros'),
(514, 7, 'Ballesteros Sud'),
(515, 7, 'Balnearia'),
(516, 7, 'Bañado de Soto'),
(517, 7, 'Bell Ville'),
(518, 7, 'Bengolea'),
(519, 7, 'Benjamin Gould'),
(520, 7, 'Berrotaran'),
(521, 7, 'Bialet Masse'),
(522, 7, 'Bouwer'),
(523, 7, 'Brinkmann'),
(524, 7, 'Buchardo'),
(525, 7, 'Bulnes'),
(526, 7, 'Cabalango'),
(527, 7, 'Calamuchita'),
(528, 7, 'Calchin'),
(529, 7, 'Calchin Oeste'),
(530, 7, 'Calmayo'),
(531, 7, 'Camilo Aldao'),
(532, 7, 'Caminiaga'),
(533, 7, 'Cañada de Luque'),
(534, 7, 'Cañada de Machado'),
(535, 7, 'Cañada de Rio Pinto'),
(536, 7, 'Cañada del Sauce'),
(537, 7, 'Canals'),
(538, 7, 'Candelaria Sud'),
(539, 7, 'Capilla de Remedios'),
(540, 7, 'Capilla de Siton'),
(541, 7, 'Capilla del Carmen'),
(542, 7, 'Capilla del Monte'),
(543, 7, 'Capital'),
(544, 7, 'Capitan Gral B. O´Higgins'),
(545, 7, 'Carnerillo'),
(546, 7, 'Carrilobo'),
(547, 7, 'Casa Grande'),
(548, 7, 'Cavanagh'),
(549, 7, 'Cerro Colorado'),
(550, 7, 'Chaján'),
(551, 7, 'Chalacea'),
(552, 7, 'Chañar Viejo'),
(553, 7, 'Chancaní'),
(554, 7, 'Charbonier'),
(555, 7, 'Charras'),
(556, 7, 'Chazón'),
(557, 7, 'Chilibroste'),
(558, 7, 'Chucul'),
(559, 7, 'Chuña'),
(560, 7, 'Chuña Huasi'),
(561, 7, 'Churqui Cañada'),
(562, 7, 'Cienaga Del Coro'),
(563, 7, 'Cintra'),
(564, 7, 'Col. Almada'),
(565, 7, 'Col. Anita'),
(566, 7, 'Col. Barge'),
(567, 7, 'Col. Bismark'),
(568, 7, 'Col. Bremen'),
(569, 7, 'Col. Caroya'),
(570, 7, 'Col. Italiana'),
(571, 7, 'Col. Iturraspe'),
(572, 7, 'Col. Las Cuatro Esquinas'),
(573, 7, 'Col. Las Pichanas'),
(574, 7, 'Col. Marina'),
(575, 7, 'Col. Prosperidad'),
(576, 7, 'Col. San Bartolome'),
(577, 7, 'Col. San Pedro'),
(578, 7, 'Col. Tirolesa'),
(579, 7, 'Col. Vicente Aguero'),
(580, 7, 'Col. Videla'),
(581, 7, 'Col. Vignaud'),
(582, 7, 'Col. Waltelina'),
(583, 7, 'Colazo'),
(584, 7, 'Comechingones'),
(585, 7, 'Conlara'),
(586, 7, 'Copacabana'),
(587, 7, '7'),
(588, 7, 'Coronel Baigorria'),
(589, 7, 'Coronel Moldes'),
(590, 7, 'Corral de Bustos'),
(591, 7, 'Corralito'),
(592, 7, 'Cosquín'),
(593, 7, 'Costa Sacate'),
(594, 7, 'Cruz Alta'),
(595, 7, 'Cruz de Caña'),
(596, 7, 'Cruz del Eje'),
(597, 7, 'Cuesta Blanca'),
(598, 7, 'Dean Funes'),
(599, 7, 'Del Campillo'),
(600, 7, 'Despeñaderos'),
(601, 7, 'Devoto'),
(602, 7, 'Diego de Rojas'),
(603, 7, 'Dique Chico'),
(604, 7, 'El Arañado'),
(605, 7, 'El Brete'),
(606, 7, 'El Chacho'),
(607, 7, 'El Crispín'),
(608, 7, 'El Fortín'),
(609, 7, 'El Manzano'),
(610, 7, 'El Rastreador'),
(611, 7, 'El Rodeo'),
(612, 7, 'El Tío'),
(613, 7, 'Elena'),
(614, 7, 'Embalse'),
(615, 7, 'Esquina'),
(616, 7, 'Estación Gral. Paz'),
(617, 7, 'Estación Juárez Celman'),
(618, 7, 'Estancia de Guadalupe'),
(619, 7, 'Estancia Vieja'),
(620, 7, 'Etruria'),
(621, 7, 'Eufrasio Loza'),
(622, 7, 'Falda del Carmen'),
(623, 7, 'Freyre'),
(624, 7, 'Gral. Baldissera'),
(625, 7, 'Gral. Cabrera'),
(626, 7, 'Gral. Deheza'),
(627, 7, 'Gral. Fotheringham'),
(628, 7, 'Gral. Levalle'),
(629, 7, 'Gral. Roca'),
(630, 7, 'Guanaco Muerto'),
(631, 7, 'Guasapampa'),
(632, 7, 'Guatimozin'),
(633, 7, 'Gutenberg'),
(634, 7, 'Hernando'),
(635, 7, 'Huanchillas'),
(636, 7, 'Huerta Grande'),
(637, 7, 'Huinca Renanco'),
(638, 7, 'Idiazabal'),
(639, 7, 'Impira'),
(640, 7, 'Inriville'),
(641, 7, 'Isla Verde'),
(642, 7, 'Italó'),
(643, 7, 'James Craik'),
(644, 7, 'Jesús María'),
(645, 7, 'Jovita'),
(646, 7, 'Justiniano Posse'),
(647, 7, 'Km 658'),
(648, 7, 'L. V. Mansilla'),
(649, 7, 'La Batea'),
(650, 7, 'La Calera'),
(651, 7, 'La Carlota'),
(652, 7, 'La Carolina'),
(653, 7, 'La Cautiva'),
(654, 7, 'La Cesira'),
(655, 7, 'La Cruz'),
(656, 7, 'La Cumbre'),
(657, 7, 'La Cumbrecita'),
(658, 7, 'La Falda'),
(659, 7, 'La Francia'),
(660, 7, 'La Granja'),
(661, 7, 'La Higuera'),
(662, 7, 'La Laguna'),
(663, 7, 'La Paisanita'),
(664, 7, 'La Palestina'),
(665, 7, '12'),
(666, 7, 'La Paquita'),
(667, 7, 'La Para'),
(668, 7, 'La Paz'),
(669, 7, 'La Playa'),
(670, 7, 'La Playosa'),
(671, 7, 'La Población'),
(672, 7, 'La Posta'),
(673, 7, 'La Puerta'),
(674, 7, 'La Quinta'),
(675, 7, 'La Rancherita'),
(676, 7, 'La Rinconada'),
(677, 7, 'La Serranita'),
(678, 7, 'La Tordilla'),
(679, 7, 'Laborde'),
(680, 7, 'Laboulaye'),
(681, 7, 'Laguna Larga'),
(682, 7, 'Las Acequias'),
(683, 7, 'Las Albahacas'),
(684, 7, 'Las Arrias'),
(685, 7, 'Las Bajadas'),
(686, 7, 'Las Caleras'),
(687, 7, 'Las Calles'),
(688, 7, 'Las Cañadas'),
(689, 7, 'Las Gramillas'),
(690, 7, 'Las Higueras'),
(691, 7, 'Las Isletillas'),
(692, 7, 'Las Junturas'),
(693, 7, 'Las Palmas'),
(694, 7, 'Las Peñas'),
(695, 7, 'Las Peñas Sud'),
(696, 7, 'Las Perdices'),
(697, 7, 'Las Playas'),
(698, 7, 'Las Rabonas'),
(699, 7, 'Las Saladas'),
(700, 7, 'Las Tapias'),
(701, 7, 'Las Varas'),
(702, 7, 'Las Varillas'),
(703, 7, 'Las Vertientes'),
(704, 7, 'Leguizamón'),
(705, 7, 'Leones'),
(706, 7, 'Los Cedros'),
(707, 7, 'Los Cerrillos'),
(708, 7, 'Los Chañaritos (C.E)'),
(709, 7, 'Los Chanaritos (R.S)'),
(710, 7, 'Los Cisnes'),
(711, 7, 'Los Cocos'),
(712, 7, 'Los Cóndores'),
(713, 7, 'Los Hornillos'),
(714, 7, 'Los Hoyos'),
(715, 7, 'Los Mistoles'),
(716, 7, 'Los Molinos'),
(717, 7, 'Los Pozos'),
(718, 7, 'Los Reartes'),
(719, 7, 'Los Surgentes'),
(720, 7, 'Los Talares'),
(721, 7, 'Los Zorros'),
(722, 7, 'Lozada'),
(723, 7, 'Luca'),
(724, 7, 'Luque'),
(725, 7, 'Luyaba'),
(726, 7, 'Malagueño'),
(727, 7, 'Malena'),
(728, 7, 'Malvinas Argentinas'),
(729, 7, 'Manfredi'),
(730, 7, 'Maquinista Gallini'),
(731, 7, 'Marcos Juárez'),
(732, 7, 'Marull'),
(733, 7, 'Matorrales'),
(734, 7, 'Mattaldi'),
(735, 7, 'Mayu Sumaj'),
(736, 7, 'Media Naranja'),
(737, 7, 'Melo'),
(738, 7, 'Mendiolaza'),
(739, 7, 'Mi Granja'),
(740, 7, 'Mina Clavero'),
(741, 7, 'Miramar'),
(742, 7, 'Morrison'),
(743, 7, 'Morteros'),
(744, 7, 'Mte. Buey'),
(745, 7, 'Mte. Cristo'),
(746, 7, 'Mte. De Los Gauchos'),
(747, 7, 'Mte. Leña'),
(748, 7, 'Mte. Maíz'),
(749, 7, 'Mte. Ralo'),
(750, 7, 'Nicolás Bruzone'),
(751, 7, 'Noetinger'),
(752, 7, 'Nono'),
(753, 7, 'Nueva 7'),
(754, 7, 'Obispo Trejo'),
(755, 7, 'Olaeta'),
(756, 7, 'Oliva'),
(757, 7, 'Olivares San Nicolás'),
(758, 7, 'Onagolty'),
(759, 7, 'Oncativo'),
(760, 7, 'Ordoñez'),
(761, 7, 'Pacheco De Melo'),
(762, 7, 'Pampayasta N.'),
(763, 7, 'Pampayasta S.'),
(764, 7, 'Panaholma'),
(765, 7, 'Pascanas'),
(766, 7, 'Pasco'),
(767, 7, 'Paso del Durazno'),
(768, 7, 'Paso Viejo'),
(769, 7, 'Pilar'),
(770, 7, 'Pincén'),
(771, 7, 'Piquillín'),
(772, 7, 'Plaza de Mercedes'),
(773, 7, 'Plaza Luxardo'),
(774, 7, 'Porteña'),
(775, 7, 'Potrero de Garay'),
(776, 7, 'Pozo del Molle'),
(777, 7, 'Pozo Nuevo'),
(778, 7, 'Pueblo Italiano'),
(779, 7, 'Puesto de Castro'),
(780, 7, 'Punta del Agua'),
(781, 7, 'Quebracho Herrado'),
(782, 7, 'Quilino'),
(783, 7, 'Rafael García'),
(784, 7, 'Ranqueles'),
(785, 7, 'Rayo Cortado'),
(786, 7, 'Reducción'),
(787, 7, 'Rincón'),
(788, 7, 'Río Bamba'),
(789, 7, 'Río Ceballos'),
(790, 7, 'Río Cuarto'),
(791, 7, 'Río de Los Sauces'),
(792, 7, 'Río Primero'),
(793, 7, 'Río Segundo'),
(794, 7, 'Río Tercero'),
(795, 7, 'Rosales'),
(796, 7, 'Rosario del Saladillo'),
(797, 7, 'Sacanta'),
(798, 7, 'Sagrada Familia'),
(799, 7, 'Saira'),
(800, 7, 'Saladillo'),
(801, 7, 'Saldán'),
(802, 7, 'Salsacate'),
(803, 7, 'Salsipuedes'),
(804, 7, 'Sampacho'),
(805, 7, 'San Agustín'),
(806, 7, 'San Antonio de Arredondo'),
(807, 7, 'San Antonio de Litín'),
(808, 7, 'San Basilio'),
(809, 7, 'San Carlos Minas'),
(810, 7, 'San Clemente'),
(811, 7, 'San Esteban'),
(812, 7, 'San Francisco'),
(813, 7, 'San Ignacio'),
(814, 7, 'San Javier'),
(815, 7, 'San Jerónimo'),
(816, 7, 'San Joaquín'),
(817, 7, 'San José de La Dormida'),
(818, 7, 'San José de Las Salinas'),
(819, 7, 'San Lorenzo'),
(820, 7, 'San Marcos Sierras'),
(821, 7, 'San Marcos Sud'),
(822, 7, 'San Pedro'),
(823, 7, 'San Pedro N.'),
(824, 7, 'San Roque'),
(825, 7, 'San Vicente'),
(826, 7, 'Santa Catalina'),
(827, 7, 'Santa Elena'),
(828, 7, 'Santa Eufemia'),
(829, 7, 'Santa Maria'),
(830, 7, 'Sarmiento'),
(831, 7, 'Saturnino M.Laspiur'),
(832, 7, 'Sauce Arriba'),
(833, 7, 'Sebastián Elcano'),
(834, 7, 'Seeber'),
(835, 7, 'Segunda Usina'),
(836, 7, 'Serrano'),
(837, 7, 'Serrezuela'),
(838, 7, 'Sgo. Temple'),
(839, 7, 'Silvio Pellico'),
(840, 7, 'Simbolar'),
(841, 7, 'Sinsacate'),
(842, 7, 'Sta. Rosa de Calamuchita'),
(843, 7, 'Sta. Rosa de Río Primero'),
(844, 7, 'Suco'),
(845, 7, 'Tala Cañada'),
(846, 7, 'Tala Huasi'),
(847, 7, 'Talaini'),
(848, 7, 'Tancacha'),
(849, 7, 'Tanti'),
(850, 7, 'Ticino'),
(851, 7, 'Tinoco'),
(852, 7, 'Tío Pujio'),
(853, 7, 'Toledo'),
(854, 7, 'Toro Pujio'),
(855, 7, 'Tosno'),
(856, 7, 'Tosquita'),
(857, 7, 'Tránsito'),
(858, 7, 'Tuclame'),
(859, 7, 'Tutti'),
(860, 7, 'Ucacha'),
(861, 7, 'Unquillo'),
(862, 7, 'Valle de Anisacate'),
(863, 7, 'Valle Hermoso'),
(864, 7, 'Vélez Sarfield'),
(865, 7, 'Viamonte'),
(866, 7, 'Vicuña Mackenna'),
(867, 7, 'Villa Allende'),
(868, 7, 'Villa Amancay'),
(869, 7, 'Villa Ascasubi'),
(870, 7, 'Villa Candelaria N.'),
(871, 7, 'Villa Carlos Paz'),
(872, 7, 'Villa Cerro Azul'),
(873, 7, 'Villa Ciudad de América'),
(874, 7, 'Villa Ciudad Pque Los Reartes'),
(875, 7, 'Villa Concepción del Tío'),
(876, 7, 'Villa Cura Brochero'),
(877, 7, 'Villa de Las Rosas'),
(878, 7, 'Villa de María'),
(879, 7, 'Villa de Pocho'),
(880, 7, 'Villa de Soto'),
(881, 7, 'Villa del Dique'),
(882, 7, 'Villa del Prado'),
(883, 7, 'Villa del Rosario'),
(884, 7, 'Villa del Totoral'),
(885, 7, 'Villa Dolores'),
(886, 7, 'Villa El Chancay'),
(887, 7, 'Villa Elisa'),
(888, 7, 'Villa Flor Serrana'),
(889, 7, 'Villa Fontana'),
(890, 7, 'Villa Giardino'),
(891, 7, 'Villa Gral. Belgrano'),
(892, 7, 'Villa Gutierrez'),
(893, 7, 'Villa Huidobro'),
(894, 7, 'Villa La Bolsa'),
(895, 7, 'Villa Los Aromos'),
(896, 7, 'Villa Los Patos'),
(897, 7, 'Villa María'),
(898, 7, 'Villa Nueva'),
(899, 7, 'Villa Pque. Santa Ana'),
(900, 7, 'Villa Pque. Siquiman'),
(901, 7, 'Villa Quillinzo'),
(902, 7, 'Villa Rossi'),
(903, 7, 'Villa Rumipal'),
(904, 7, 'Villa San Esteban'),
(905, 7, 'Villa San Isidro'),
(906, 7, 'Villa 21'),
(907, 7, 'Villa Sarmiento (G.R)'),
(908, 7, 'Villa Sarmiento (S.A)'),
(909, 7, 'Villa Tulumba'),
(910, 7, 'Villa Valeria'),
(911, 7, 'Villa Yacanto'),
(912, 7, 'Washington'),
(913, 7, 'Wenceslao Escalante'),
(914, 7, 'Ycho Cruz Sierras'),
(915, 8, 'Alvear'),
(916, 8, 'Bella Vista'),
(917, 8, 'Berón de Astrada'),
(918, 8, 'Bonpland'),
(919, 8, 'Caá Cati'),
(920, 8, 'Capital'),
(921, 8, 'Chavarría'),
(922, 8, 'Col. C. Pellegrini'),
(923, 8, 'Col. Libertad'),
(924, 8, 'Col. Liebig'),
(925, 8, 'Col. Sta Rosa'),
(926, 8, 'Concepción'),
(927, 8, 'Cruz de Los Milagros'),
(928, 8, 'Curuzú-Cuatiá'),
(929, 8, 'Empedrado'),
(930, 8, 'Esquina'),
(931, 8, 'Estación Torrent'),
(932, 8, 'Felipe Yofré'),
(933, 8, 'Garruchos'),
(934, 8, 'Gdor. Agrónomo'),
(935, 8, 'Gdor. Martínez'),
(936, 8, 'Goya'),
(937, 8, 'Guaviravi'),
(938, 8, 'Herlitzka'),
(939, 8, 'Ita-Ibate'),
(940, 8, 'Itatí'),
(941, 8, 'Ituzaingó'),
(942, 8, 'José Rafael Gómez'),
(943, 8, 'Juan Pujol'),
(944, 8, 'La Cruz'),
(945, 8, 'Lavalle'),
(946, 8, 'Lomas de Vallejos'),
(947, 8, 'Loreto'),
(948, 8, 'Mariano I. Loza'),
(949, 8, 'Mburucuyá'),
(950, 8, 'Mercedes'),
(951, 8, 'Mocoretá'),
(952, 8, 'Mte. Caseros'),
(953, 8, 'Nueve de Julio'),
(954, 8, 'Palmar Grande'),
(955, 8, 'Parada Pucheta'),
(956, 8, 'Paso de La Patria'),
(957, 8, 'Paso de Los Libres'),
(958, 8, 'Pedro R. Fernandez'),
(959, 8, 'Perugorría'),
(960, 8, 'Pueblo Libertador'),
(961, 8, 'Ramada Paso'),
(962, 8, 'Riachuelo'),
(963, 8, 'Saladas'),
(964, 8, 'San Antonio'),
(965, 8, 'San Carlos'),
(966, 8, 'San Cosme'),
(967, 8, 'San Lorenzo'),
(968, 8, '20 del Palmar'),
(969, 8, 'San Miguel'),
(970, 8, 'San Roque'),
(971, 8, 'Santa Ana'),
(972, 8, 'Santa Lucía'),
(973, 8, 'Santo Tomé'),
(974, 8, 'Sauce'),
(975, 8, 'Tabay'),
(976, 8, 'Tapebicuá'),
(977, 8, 'Tatacua'),
(978, 8, 'Virasoro'),
(979, 8, 'Yapeyú'),
(980, 8, 'Yataití Calle'),
(981, 9, 'Alarcón'),
(982, 9, 'Alcaraz'),
(983, 9, 'Alcaraz N.'),
(984, 9, 'Alcaraz S.'),
(985, 9, 'Aldea Asunción'),
(986, 9, 'Aldea Brasilera'),
(987, 9, 'Aldea Elgenfeld'),
(988, 9, 'Aldea Grapschental'),
(989, 9, 'Aldea Ma. Luisa'),
(990, 9, 'Aldea Protestante'),
(991, 9, 'Aldea Salto'),
(992, 9, 'Aldea San Antonio (G)'),
(993, 9, 'Aldea San Antonio (P)'),
(994, 9, 'Aldea 19'),
(995, 9, 'Aldea San Miguel'),
(996, 9, 'Aldea San Rafael'),
(997, 9, 'Aldea Spatzenkutter'),
(998, 9, 'Aldea Sta. María'),
(999, 9, 'Aldea Sta. Rosa'),
(1000, 9, 'Aldea Valle María'),
(1001, 9, 'Altamirano Sur'),
(1002, 9, 'Antelo'),
(1003, 9, 'Antonio Tomás'),
(1004, 9, 'Aranguren'),
(1005, 9, 'Arroyo Barú'),
(1006, 9, 'Arroyo Burgos'),
(1007, 9, 'Arroyo Clé'),
(1008, 9, 'Arroyo Corralito'),
(1009, 9, 'Arroyo del Medio'),
(1010, 9, 'Arroyo Maturrango'),
(1011, 9, 'Arroyo Palo Seco'),
(1012, 9, 'Banderas'),
(1013, 9, 'Basavilbaso'),
(1014, 9, 'Betbeder'),
(1015, 9, 'Bovril'),
(1016, 9, 'Caseros'),
(1017, 9, 'Ceibas'),
(1018, 9, 'Cerrito'),
(1019, 9, 'Chajarí'),
(1020, 9, 'Chilcas'),
(1021, 9, 'Clodomiro Ledesma'),
(1022, 9, 'Col. Alemana'),
(1023, 9, 'Col. Avellaneda'),
(1024, 9, 'Col. Avigdor'),
(1025, 9, 'Col. Ayuí'),
(1026, 9, 'Col. Baylina'),
(1027, 9, 'Col. Carrasco'),
(1028, 9, 'Col. Celina'),
(1029, 9, 'Col. Cerrito'),
(1030, 9, 'Col. Crespo'),
(1031, 9, 'Col. Elia'),
(1032, 9, 'Col. Ensayo'),
(1033, 9, 'Col. Gral. Roca'),
(1034, 9, 'Col. La Argentina'),
(1035, 9, 'Col. Merou'),
(1036, 9, 'Col. Oficial Nª3'),
(1037, 9, 'Col. Oficial Nº13'),
(1038, 9, 'Col. Oficial Nº14'),
(1039, 9, 'Col. Oficial Nº5'),
(1040, 9, 'Col. Reffino'),
(1041, 9, 'Col. Tunas'),
(1042, 9, 'Col. Viraró'),
(1043, 9, 'Colón'),
(1044, 9, 'Concepción del Uruguay'),
(1045, 9, 'Concordia'),
(1046, 9, 'Conscripto Bernardi'),
(1047, 9, 'Costa Grande'),
(1048, 9, 'Costa San Antonio'),
(1049, 9, 'Costa Uruguay N.'),
(1050, 9, 'Costa Uruguay S.'),
(1051, 9, 'Crespo'),
(1052, 9, 'Crucecitas 3ª'),
(1053, 9, 'Crucecitas 7ª'),
(1054, 9, 'Crucecitas 8ª'),
(1055, 9, 'Cuchilla Redonda'),
(1056, 9, 'Curtiembre'),
(1057, 9, 'Diamante'),
(1058, 9, 'Distrito 6º'),
(1059, 9, 'Distrito Chañar'),
(1060, 9, 'Distrito Chiqueros'),
(1061, 9, 'Distrito Cuarto'),
(1062, 9, 'Distrito Diego López'),
(1063, 9, 'Distrito Pajonal'),
(1064, 9, 'Distrito Sauce'),
(1065, 9, 'Distrito Tala'),
(1066, 9, 'Distrito Talitas'),
(1067, 9, 'Don Cristóbal 1ª Sección'),
(1068, 9, 'Don Cristóbal 2ª Sección'),
(1069, 9, 'Durazno'),
(1070, 9, 'El Cimarrón'),
(1071, 9, 'El Gramillal'),
(1072, 9, 'El Palenque'),
(1073, 9, 'El Pingo'),
(1074, 9, 'El Quebracho'),
(1075, 9, 'El Redomón'),
(1076, 9, 'El Solar'),
(1077, 9, 'Enrique Carbo'),
(1078, 9, '9'),
(1079, 9, 'Espinillo N.'),
(1080, 9, 'Estación Campos'),
(1081, 9, 'Estación Escriña'),
(1082, 9, 'Estación Lazo'),
(1083, 9, 'Estación Raíces'),
(1084, 9, 'Estación Yerúa'),
(1085, 9, 'Estancia Grande'),
(1086, 9, 'Estancia Líbaros'),
(1087, 9, 'Estancia Racedo'),
(1088, 9, 'Estancia Solá'),
(1089, 9, 'Estancia Yuquerí'),
(1090, 9, 'Estaquitas'),
(1091, 9, 'Faustino M. Parera'),
(1092, 9, 'Febre'),
(1093, 9, 'Federación'),
(1094, 9, 'Federal'),
(1095, 9, 'Gdor. Echagüe'),
(1096, 9, 'Gdor. Mansilla'),
(1097, 9, 'Gilbert'),
(1098, 9, 'González Calderón'),
(1099, 9, 'Gral. Almada'),
(1100, 9, 'Gral. Alvear'),
(1101, 9, 'Gral. Campos'),
(1102, 9, 'Gral. Galarza'),
(1103, 9, 'Gral. Ramírez'),
(1104, 9, 'Gualeguay'),
(1105, 9, 'Gualeguaychú'),
(1106, 9, 'Gualeguaycito'),
(1107, 9, 'Guardamonte'),
(1108, 9, 'Hambis'),
(1109, 9, 'Hasenkamp'),
(1110, 9, 'Hernandarias'),
(1111, 9, 'Hernández'),
(1112, 9, 'Herrera'),
(1113, 9, 'Hinojal'),
(1114, 9, 'Hocker'),
(1115, 9, 'Ing. Sajaroff'),
(1116, 9, 'Irazusta'),
(1117, 9, 'Isletas'),
(1118, 9, 'J.J De Urquiza'),
(1119, 9, 'Jubileo'),
(1120, 9, 'La Clarita'),
(1121, 9, 'La Criolla'),
(1122, 9, 'La Esmeralda'),
(1123, 9, 'La Florida'),
(1124, 9, 'La Fraternidad'),
(1125, 9, 'La Hierra'),
(1126, 9, 'La Ollita'),
(1127, 9, 'La Paz'),
(1128, 9, 'La Picada'),
(1129, 9, 'La Providencia'),
(1130, 9, 'La Verbena'),
(1131, 9, 'Laguna Benítez'),
(1132, 9, 'Larroque'),
(1133, 9, 'Las Cuevas'),
(1134, 9, 'Las Garzas'),
(1135, 9, 'Las Guachas'),
(1136, 9, 'Las Mercedes'),
(1137, 9, 'Las Moscas'),
(1138, 9, 'Las Mulitas'),
(1139, 9, 'Las Toscas'),
(1140, 9, 'Laurencena'),
(1141, 9, 'Libertador San Martín'),
(1142, 9, 'Loma Limpia'),
(1143, 9, 'Los Ceibos'),
(1144, 9, 'Los Charruas'),
(1145, 9, 'Los Conquistadores'),
(1146, 9, 'Lucas González'),
(1147, 9, 'Lucas N.'),
(1148, 9, 'Lucas S. 1ª'),
(1149, 9, 'Lucas S. 2ª'),
(1150, 9, 'Maciá'),
(1151, 9, 'María Grande'),
(1152, 9, 'María Grande 2ª'),
(1153, 9, 'Médanos'),
(1154, 9, 'Mojones N.'),
(1155, 9, 'Mojones S.'),
(1156, 9, 'Molino Doll'),
(1157, 9, 'Monte Redondo'),
(1158, 9, 'Montoya'),
(1159, 9, 'Mulas Grandes'),
(1160, 9, 'Ñancay'),
(1161, 9, 'Nogoyá'),
(1162, 9, 'Nueva Escocia'),
(1163, 9, 'Nueva Vizcaya'),
(1164, 9, 'Ombú'),
(1165, 9, 'Oro Verde'),
(1166, 9, 'Paraná'),
(1167, 9, 'Pasaje Guayaquil'),
(1168, 9, 'Pasaje Las Tunas'),
(1169, 9, 'Paso de La Arena'),
(1170, 9, 'Paso de La Laguna'),
(1171, 9, 'Paso de Las Piedras'),
(1172, 9, 'Paso Duarte'),
(1173, 9, 'Pastor Britos'),
(1174, 9, 'Pedernal'),
(1175, 9, 'Perdices'),
(1176, 9, 'Picada Berón'),
(1177, 9, 'Piedras Blancas'),
(1178, 9, 'Primer Distrito Cuchilla'),
(1179, 9, 'Primero de Mayo'),
(1180, 9, 'Pronunciamiento'),
(1181, 9, 'Pto. Algarrobo'),
(1182, 9, 'Pto. Ibicuy'),
(1183, 9, 'Pueblo Brugo'),
(1184, 9, 'Pueblo Cazes'),
(1185, 9, 'Pueblo Gral. Belgrano'),
(1186, 9, 'Pueblo Liebig'),
(1187, 9, 'Puerto Yeruá'),
(1188, 9, 'Punta del Monte'),
(1189, 9, 'Quebracho'),
(1190, 9, 'Quinto Distrito'),
(1191, 9, 'Raices Oeste'),
(1192, 9, 'Rincón de Nogoyá'),
(1193, 9, 'Rincón del Cinto'),
(1194, 9, 'Rincón del Doll'),
(1195, 9, 'Rincón del Gato'),
(1196, 9, 'Rocamora'),
(1197, 9, 'Rosario del Tala'),
(1198, 9, 'San Benito'),
(1199, 9, 'San Cipriano'),
(1200, 9, 'San Ernesto'),
(1201, 9, 'San Gustavo'),
(1202, 9, 'San Jaime'),
(1203, 9, 'San José'),
(1204, 9, 'San José de Feliciano'),
(1205, 9, 'San Justo'),
(1206, 9, 'San Marcial'),
(1207, 9, 'San Pedro'),
(1208, 9, 'San Ramírez'),
(1209, 9, 'San Ramón'),
(1210, 9, 'San Roque'),
(1211, 9, 'San Salvador'),
(1212, 9, 'San Víctor'),
(1213, 9, 'Santa Ana'),
(1214, 9, 'Santa Anita'),
(1215, 9, 'Santa Elena'),
(1216, 9, 'Santa Lucía'),
(1217, 9, 'Santa Luisa'),
(1218, 9, 'Sauce de Luna'),
(1219, 9, 'Sauce Montrull'),
(1220, 9, 'Sauce Pinto'),
(1221, 9, 'Sauce Sur'),
(1222, 9, 'Seguí'),
(1223, 9, 'Sir Leonard'),
(1224, 9, 'Sosa'),
(1225, 9, 'Tabossi'),
(1226, 9, 'Tezanos Pinto'),
(1227, 9, 'Ubajay'),
(1228, 9, 'Urdinarrain'),
(1229, 9, 'Veinte de Septiembre'),
(1230, 9, 'Viale'),
(1231, 9, 'Victoria'),
(1232, 9, 'Villa Clara'),
(1233, 9, 'Villa del Rosario'),
(1234, 9, 'Villa Domínguez'),
(1235, 9, 'Villa Elisa'),
(1236, 9, 'Villa Fontana'),
(1237, 9, 'Villa Gdor. Etchevehere'),
(1238, 9, 'Villa Mantero'),
(1239, 9, 'Villa Paranacito'),
(1240, 9, 'Villa Urquiza'),
(1241, 9, 'Villaguay'),
(1242, 9, 'Walter Moss'),
(1243, 9, 'Yacaré'),
(1244, 9, 'Yeso Oeste'),
(1245, 10, 'Buena Vista'),
(1246, 10, 'Clorinda'),
(1247, 10, 'Col. Pastoril'),
(1248, 10, 'Cte. Fontana'),
(1249, 10, 'El Colorado'),
(1250, 10, 'El Espinillo'),
(1251, 10, 'Estanislao Del Campo'),
(1252, 10, '10'),
(1253, 10, 'Fortín Lugones'),
(1254, 10, 'Gral. Lucio V. Mansilla'),
(1255, 10, 'Gral. Manuel Belgrano'),
(1256, 10, 'Gral. Mosconi'),
(1257, 10, 'Gran Guardia'),
(1258, 10, 'Herradura'),
(1259, 10, 'Ibarreta'),
(1260, 10, 'Ing. Juárez'),
(1261, 10, 'Laguna Blanca'),
(1262, 10, 'Laguna Naick Neck'),
(1263, 10, 'Laguna Yema'),
(1264, 10, 'Las Lomitas'),
(1265, 10, 'Los Chiriguanos'),
(1266, 10, 'Mayor V. Villafañe'),
(1267, 10, 'Misión San Fco.'),
(1268, 10, 'Palo Santo'),
(1269, 10, 'Pirané'),
(1270, 10, 'Pozo del Maza'),
(1271, 10, 'Riacho He-He'),
(1272, 10, 'San Hilario'),
(1273, 10, 'San Martín II'),
(1274, 10, 'Siete Palmas'),
(1275, 10, 'Subteniente Perín'),
(1276, 10, 'Tres Lagunas'),
(1277, 10, 'Villa Dos Trece'),
(1278, 10, 'Villa Escolar'),
(1279, 10, 'Villa Gral. Güemes'),
(1280, 11, 'Abdon Castro Tolay'),
(1281, 11, 'Abra Pampa'),
(1282, 11, 'Abralaite'),
(1283, 11, 'Aguas Calientes'),
(1284, 11, 'Arrayanal'),
(1285, 11, 'Barrios'),
(1286, 11, 'Caimancito'),
(1287, 11, 'Calilegua'),
(1288, 11, 'Cangrejillos'),
(1289, 11, 'Caspala'),
(1290, 11, 'Catuá'),
(1291, 11, 'Cieneguillas'),
(1292, 11, 'Coranzulli'),
(1293, 11, 'Cusi-Cusi'),
(1294, 11, 'El Aguilar'),
(1295, 11, 'El Carmen'),
(1296, 11, 'El Cóndor'),
(1297, 11, 'El Fuerte'),
(1298, 11, 'El Piquete'),
(1299, 11, 'El Talar'),
(1300, 11, 'Fraile Pintado'),
(1301, 11, 'Hipólito Yrigoyen'),
(1302, 11, 'Huacalera'),
(1303, 11, 'Humahuaca'),
(1304, 11, 'La Esperanza'),
(1305, 11, 'La Mendieta'),
(1306, 11, 'La Quiaca'),
(1307, 11, 'Ledesma'),
(1308, 11, 'Libertador Gral. San Martin'),
(1309, 11, 'Maimara'),
(1310, 11, 'Mina Pirquitas'),
(1311, 11, 'Monterrico'),
(1312, 11, 'Palma Sola'),
(1313, 11, 'Palpalá'),
(1314, 11, 'Pampa Blanca'),
(1315, 11, 'Pampichuela'),
(1316, 11, 'Perico'),
(1317, 11, 'Puesto del Marqués'),
(1318, 11, 'Puesto Viejo'),
(1319, 11, 'Pumahuasi'),
(1320, 11, 'Purmamarca'),
(1321, 11, 'Rinconada'),
(1322, 11, 'Rodeitos'),
(1323, 11, 'Rosario de Río Grande'),
(1324, 11, 'San Antonio'),
(1325, 11, 'San Francisco'),
(1326, 11, 'San Pedro'),
(1327, 11, 'San Rafael'),
(1328, 11, 'San Salvador'),
(1329, 11, 'Santa Ana'),
(1330, 11, 'Santa Catalina'),
(1331, 11, 'Santa Clara'),
(1332, 11, 'Susques'),
(1333, 11, 'Tilcara'),
(1334, 11, 'Tres Cruces'),
(1335, 11, 'Tumbaya'),
(1336, 11, 'Valle Grande'),
(1337, 11, 'Vinalito'),
(1338, 11, 'Volcán'),
(1339, 11, 'Yala'),
(1340, 11, 'Yaví'),
(1341, 11, 'Yuto'),
(1342, 12, 'Abramo'),
(1343, 12, 'Adolfo Van Praet'),
(1344, 12, 'Agustoni'),
(1345, 12, 'Algarrobo del Aguila'),
(1346, 12, 'Alpachiri'),
(1347, 12, 'Alta Italia'),
(1348, 12, 'Anguil'),
(1349, 12, 'Arata'),
(1350, 12, 'Ataliva Roca'),
(1351, 12, 'Bernardo Larroude'),
(1352, 12, 'Bernasconi'),
(1353, 12, 'Caleufú'),
(1354, 12, 'Carro Quemado'),
(1355, 12, 'Catriló'),
(1356, 12, 'Ceballos'),
(1357, 12, 'Chacharramendi'),
(1358, 12, 'Col. Barón'),
(1359, 12, 'Col. Santa María'),
(1360, 12, 'Conhelo'),
(1361, 12, 'Coronel Hilario Lagos'),
(1362, 12, 'Cuchillo-Có'),
(1363, 12, 'Doblas'),
(1364, 12, 'Dorila'),
(1365, 12, 'Eduardo Castex'),
(1366, 12, 'Embajador Martini'),
(1367, 12, 'Falucho'),
(1368, 12, 'Gral. Acha'),
(1369, 12, 'Gral. Manuel Campos'),
(1370, 12, 'Gral. Pico'),
(1371, 12, 'Guatraché'),
(1372, 12, 'Ing. Luiggi'),
(1373, 12, 'Intendente Alvear'),
(1374, 12, 'Jacinto Arauz'),
(1375, 12, 'La Adela'),
(1376, 12, 'La Humada'),
(1377, 12, 'La Maruja'),
(1378, 12, '12'),
(1379, 12, 'La Reforma'),
(1380, 12, 'Limay Mahuida'),
(1381, 12, 'Lonquimay'),
(1382, 12, 'Loventuel'),
(1383, 12, 'Luan Toro'),
(1384, 12, 'Macachín'),
(1385, 12, 'Maisonnave'),
(1386, 12, 'Mauricio Mayer'),
(1387, 12, 'Metileo'),
(1388, 12, 'Miguel Cané'),
(1389, 12, 'Miguel Riglos'),
(1390, 12, 'Monte Nievas'),
(1391, 12, 'Parera'),
(1392, 12, 'Perú'),
(1393, 12, 'Pichi-Huinca'),
(1394, 12, 'Puelches'),
(1395, 12, 'Puelén'),
(1396, 12, 'Quehue'),
(1397, 12, 'Quemú Quemú'),
(1398, 12, 'Quetrequén'),
(1399, 12, 'Rancul'),
(1400, 12, 'Realicó'),
(1401, 12, 'Relmo'),
(1402, 12, 'Rolón'),
(1403, 12, 'Rucanelo'),
(1404, 12, 'Sarah'),
(1405, 12, 'Speluzzi'),
(1406, 12, 'Sta. Isabel'),
(1407, 12, 'Sta. Rosa'),
(1408, 12, 'Sta. Teresa'),
(1409, 12, 'Telén'),
(1410, 12, 'Toay'),
(1411, 12, 'Tomas M. de Anchorena'),
(1412, 12, 'Trenel'),
(1413, 12, 'Unanue'),
(1414, 12, 'Uriburu'),
(1415, 12, 'Veinticinco de Mayo'),
(1416, 12, 'Vertiz'),
(1417, 12, 'Victorica'),
(1418, 12, 'Villa Mirasol'),
(1419, 12, 'Winifreda'),
(1420, 13, 'Arauco'),
(1421, 13, 'Capital'),
(1422, 13, 'Castro Barros'),
(1423, 13, 'Chamical'),
(1424, 13, 'Chilecito'),
(1425, 13, 'Coronel F. Varela'),
(1426, 13, 'Famatina'),
(1427, 13, 'Gral. A.V.Peñaloza'),
(1428, 13, 'Gral. Belgrano'),
(1429, 13, 'Gral. J.F. Quiroga'),
(1430, 13, 'Gral. Lamadrid'),
(1431, 13, 'Gral. Ocampo'),
(1432, 13, 'Gral. San Martín'),
(1433, 13, 'Independencia'),
(1434, 13, 'Rosario Penaloza'),
(1435, 13, 'San Blas de Los Sauces'),
(1436, 13, 'Sanagasta'),
(1437, 13, 'Vinchina'),
(1438, 14, 'Capital'),
(1439, 14, 'Chacras de Coria'),
(1440, 14, 'Dorrego'),
(1441, 14, 'Gllen'),
(1442, 14, 'Godoy Cruz'),
(1443, 14, 'Gral. Alvear'),
(1444, 14, 'Guaymallén'),
(1445, 14, 'Junín'),
(1446, 14, 'La Paz'),
(1447, 14, 'Las Heras'),
(1448, 14, 'Lavalle'),
(1449, 14, 'Luján'),
(1450, 14, 'Luján De Cuyo'),
(1451, 14, 'Maipú'),
(1452, 14, 'Malargüe'),
(1453, 14, 'Rivadavia'),
(1454, 14, 'San Carlos'),
(1455, 14, 'San Martín'),
(1456, 14, 'San Rafael'),
(1457, 14, 'Sta. Rosa'),
(1458, 14, 'Tunuyán'),
(1459, 14, 'Tupungato'),
(1460, 14, 'Villa Nueva'),
(1461, 15, 'Alba Posse'),
(1462, 15, 'Almafuerte'),
(1463, 15, 'Apóstoles'),
(1464, 15, 'Aristóbulo Del Valle'),
(1465, 15, 'Arroyo Del Medio'),
(1466, 15, 'Azara'),
(1467, 15, 'Bdo. De Irigoyen'),
(1468, 15, 'Bonpland'),
(1469, 15, 'Caá Yari'),
(1470, 15, 'Campo Grande'),
(1471, 15, 'Campo Ramón'),
(1472, 15, 'Campo Viera'),
(1473, 15, 'Candelaria'),
(1474, 15, 'Capioví'),
(1475, 15, 'Caraguatay'),
(1476, 15, 'Cdte. Guacurarí'),
(1477, 15, 'Cerro Azul'),
(1478, 15, 'Cerro Corá'),
(1479, 15, 'Col. Alberdi'),
(1480, 15, 'Col. Aurora'),
(1481, 15, 'Col. Delicia'),
(1482, 15, 'Col. Polana'),
(1483, 15, 'Col. Victoria'),
(1484, 15, 'Col. Wanda'),
(1485, 15, 'Concepción De La Sierra'),
(1486, 15, 'Corpus'),
(1487, 15, 'Dos Arroyos'),
(1488, 15, 'Dos de Mayo'),
(1489, 15, 'El Alcázar'),
(1490, 15, 'El Dorado'),
(1491, 15, 'El Soberbio'),
(1492, 15, 'Esperanza'),
(1493, 15, 'F. Ameghino'),
(1494, 15, 'Fachinal'),
(1495, 15, 'Garuhapé'),
(1496, 15, 'Garupá'),
(1497, 15, 'Gdor. López'),
(1498, 15, 'Gdor. Roca'),
(1499, 15, 'Gral. Alvear'),
(1500, 15, 'Gral. Urquiza'),
(1501, 15, 'Guaraní'),
(1502, 15, 'H. Yrigoyen'),
(1503, 15, 'Iguazú'),
(1504, 15, 'Itacaruaré'),
(1505, 15, 'Jardín América'),
(1506, 15, 'Leandro N. Alem'),
(1507, 15, 'Libertad'),
(1508, 15, 'Loreto'),
(1509, 15, 'Los Helechos'),
(1510, 15, 'Mártires'),
(1511, 15, '15'),
(1512, 15, 'Mojón Grande'),
(1513, 15, 'Montecarlo'),
(1514, 15, 'Nueve de Julio'),
(1515, 15, 'Oberá'),
(1516, 15, 'Olegario V. Andrade'),
(1517, 15, 'Panambí'),
(1518, 15, 'Posadas'),
(1519, 15, 'Profundidad'),
(1520, 15, 'Pto. Iguazú'),
(1521, 15, 'Pto. Leoni'),
(1522, 15, 'Pto. Piray'),
(1523, 15, 'Pto. Rico'),
(1524, 15, 'Ruiz de Montoya'),
(1525, 15, 'San Antonio'),
(1526, 15, 'San Ignacio'),
(1527, 15, 'San Javier'),
(1528, 15, 'San José'),
(1529, 15, 'San Martín'),
(1530, 15, 'San Pedro'),
(1531, 15, 'San Vicente'),
(1532, 15, 'Santiago De Liniers'),
(1533, 15, 'Santo Pipo'),
(1534, 15, 'Sta. Ana'),
(1535, 15, 'Sta. María'),
(1536, 15, 'Tres Capones'),
(1537, 15, 'Veinticinco de Mayo'),
(1538, 15, 'Wanda'),
(1539, 16, 'Aguada San Roque'),
(1540, 16, 'Aluminé'),
(1541, 16, 'Andacollo'),
(1542, 16, 'Añelo'),
(1543, 16, 'Bajada del Agrio'),
(1544, 16, 'Barrancas'),
(1545, 16, 'Buta Ranquil'),
(1546, 16, 'Capital'),
(1547, 16, 'Caviahué'),
(1548, 16, 'Centenario'),
(1549, 16, 'Chorriaca'),
(1550, 16, 'Chos Malal'),
(1551, 16, 'Cipolletti'),
(1552, 16, 'Covunco Abajo'),
(1553, 16, 'Coyuco Cochico'),
(1554, 16, 'Cutral Có'),
(1555, 16, 'El Cholar'),
(1556, 16, 'El Huecú'),
(1557, 16, 'El Sauce'),
(1558, 16, 'Guañacos'),
(1559, 16, 'Huinganco'),
(1560, 16, 'Las Coloradas'),
(1561, 16, 'Las Lajas'),
(1562, 16, 'Las Ovejas'),
(1563, 16, 'Loncopué'),
(1564, 16, 'Los Catutos'),
(1565, 16, 'Los Chihuidos'),
(1566, 16, 'Los Miches'),
(1567, 16, 'Manzano Amargo'),
(1568, 16, '16'),
(1569, 16, 'Octavio Pico'),
(1570, 16, 'Paso Aguerre'),
(1571, 16, 'Picún Leufú'),
(1572, 16, 'Piedra del Aguila'),
(1573, 16, 'Pilo Lil'),
(1574, 16, 'Plaza Huincul'),
(1575, 16, 'Plottier'),
(1576, 16, 'Quili Malal'),
(1577, 16, 'Ramón Castro'),
(1578, 16, 'Rincón de Los Sauces'),
(1579, 16, 'San Martín de Los Andes'),
(1580, 16, 'San Patricio del Chañar'),
(1581, 16, 'Santo Tomás'),
(1582, 16, 'Sauzal Bonito'),
(1583, 16, 'Senillosa'),
(1584, 16, 'Taquimilán'),
(1585, 16, 'Tricao Malal'),
(1586, 16, 'Varvarco'),
(1587, 16, 'Villa Curí Leuvu'),
(1588, 16, 'Villa del Nahueve'),
(1589, 16, 'Villa del Puente Picún Leuvú'),
(1590, 16, 'Villa El Chocón'),
(1591, 16, 'Villa La Angostura'),
(1592, 16, 'Villa Pehuenia'),
(1593, 16, 'Villa Traful'),
(1594, 16, 'Vista Alegre'),
(1595, 16, 'Zapala'),
(1596, 17, 'Aguada Cecilio'),
(1597, 17, 'Aguada de Guerra'),
(1598, 17, 'Allén'),
(1599, 17, 'Arroyo de La Ventana'),
(1600, 17, 'Arroyo Los Berros'),
(1601, 17, 'Bariloche'),
(1602, 17, 'Calte. Cordero'),
(1603, 17, 'Campo Grande'),
(1604, 17, 'Catriel'),
(1605, 17, 'Cerro Policía'),
(1606, 17, 'Cervantes'),
(1607, 17, 'Chelforo'),
(1608, 17, 'Chimpay'),
(1609, 17, 'Chinchinales'),
(1610, 17, 'Chipauquil'),
(1611, 17, 'Choele Choel'),
(1612, 17, 'Cinco Saltos'),
(1613, 17, 'Cipolletti'),
(1614, 17, 'Clemente Onelli'),
(1615, 17, 'Colán Conhue'),
(1616, 17, 'Comallo'),
(1617, 17, 'Comicó'),
(1618, 17, 'Cona Niyeu'),
(1619, 17, 'Coronel Belisle'),
(1620, 17, 'Cubanea'),
(1621, 17, 'Darwin'),
(1622, 17, 'Dina Huapi'),
(1623, 17, 'El Bolsón'),
(1624, 17, 'El Caín'),
(1625, 17, 'El Manso'),
(1626, 17, 'Gral. Conesa'),
(1627, 17, 'Gral. Enrique Godoy'),
(1628, 17, 'Gral. Fernandez Oro'),
(1629, 17, 'Gral. Roca'),
(1630, 17, 'Guardia Mitre'),
(1631, 17, 'Ing. Huergo'),
(1632, 17, 'Ing. Jacobacci'),
(1633, 17, 'Laguna Blanca'),
(1634, 17, 'Lamarque'),
(1635, 17, 'Las Grutas'),
(1636, 17, 'Los Menucos'),
(1637, 17, 'Luis Beltrán'),
(1638, 17, 'Mainqué'),
(1639, 17, 'Mamuel Choique'),
(1640, 17, 'Maquinchao'),
(1641, 17, 'Mencué'),
(1642, 17, 'Mtro. Ramos Mexia'),
(1643, 17, 'Nahuel Niyeu'),
(1644, 17, 'Naupa Huen'),
(1645, 17, 'Ñorquinco'),
(1646, 17, 'Ojos de Agua'),
(1647, 17, 'Paso de Agua'),
(1648, 17, 'Paso Flores'),
(1649, 17, 'Peñas Blancas'),
(1650, 17, 'Pichi Mahuida'),
(1651, 17, 'Pilcaniyeu'),
(1652, 17, 'Pomona'),
(1653, 17, 'Prahuaniyeu'),
(1654, 17, 'Rincón Treneta'),
(1655, 17, 'Río Chico'),
(1656, 17, 'Río Colorado'),
(1657, 17, 'Roca'),
(1658, 17, 'San Antonio Oeste'),
(1659, 17, 'San Javier'),
(1660, 17, 'Sierra Colorada'),
(1661, 17, 'Sierra Grande'),
(1662, 17, 'Sierra Pailemán'),
(1663, 17, 'Valcheta'),
(1664, 17, 'Valle Azul'),
(1665, 17, 'Viedma'),
(1666, 17, 'Villa Llanquín'),
(1667, 17, 'Villa Mascardi'),
(1668, 17, 'Villa Regina'),
(1669, 17, 'Yaminué'),
(1670, 18, 'A. Saravia'),
(1671, 18, 'Aguaray'),
(1672, 18, 'Angastaco'),
(1673, 18, 'Animaná'),
(1674, 18, 'Cachi'),
(1675, 18, 'Cafayate'),
(1676, 18, 'Campo Quijano'),
(1677, 18, 'Campo Santo'),
(1678, 18, 'Capital'),
(1679, 18, 'Cerrillos'),
(1680, 18, 'Chicoana'),
(1681, 18, 'Col. Sta. Rosa'),
(1682, 18, 'Coronel Moldes'),
(1683, 18, 'El Bordo'),
(1684, 18, 'El Carril'),
(1685, 18, 'El Galpón'),
(1686, 18, 'El Jardín'),
(1687, 18, 'El Potrero'),
(1688, 18, 'El Quebrachal'),
(1689, 18, 'El Tala'),
(1690, 18, 'Embarcación'),
(1691, 18, 'Gral. Ballivian'),
(1692, 18, 'Gral. Güemes'),
(1693, 18, 'Gral. Mosconi'),
(1694, 18, 'Gral. Pizarro'),
(1695, 18, 'Guachipas'),
(1696, 18, 'Hipólito Yrigoyen'),
(1697, 18, 'Iruyá'),
(1698, 18, 'Isla De Cañas'),
(1699, 18, 'J. V. Gonzalez'),
(1700, 18, 'La Caldera'),
(1701, 18, 'La Candelaria'),
(1702, 18, 'La Merced'),
(1703, 18, 'La Poma'),
(1704, 18, 'La Viña'),
(1705, 18, 'Las Lajitas'),
(1706, 18, 'Los Toldos'),
(1707, 18, 'Metán'),
(1708, 18, 'Molinos'),
(1709, 18, 'Nazareno'),
(1710, 18, 'Orán'),
(1711, 18, 'Payogasta'),
(1712, 18, 'Pichanal'),
(1713, 18, 'Prof. S. Mazza'),
(1714, 18, 'Río Piedras'),
(1715, 18, 'Rivadavia Banda Norte'),
(1716, 18, 'Rivadavia Banda Sur'),
(1717, 18, 'Rosario de La Frontera'),
(1718, 18, 'Rosario de Lerma'),
(1719, 18, 'Saclantás'),
(1720, 18, '18'),
(1721, 18, 'San Antonio'),
(1722, 18, 'San Carlos'),
(1723, 18, 'San José De Metán'),
(1724, 18, 'San Ramón'),
(1725, 18, 'Santa Victoria E.'),
(1726, 18, 'Santa Victoria O.'),
(1727, 18, 'Tartagal'),
(1728, 18, 'Tolar Grande'),
(1729, 18, 'Urundel'),
(1730, 18, 'Vaqueros'),
(1731, 18, 'Villa San Lorenzo'),
(1732, 19, 'Albardón'),
(1733, 19, 'Angaco'),
(1734, 19, 'Calingasta'),
(1735, 19, 'Capital'),
(1736, 19, 'Caucete'),
(1737, 19, 'Chimbas'),
(1738, 19, 'Iglesia'),
(1739, 19, 'Jachal'),
(1740, 19, 'Nueve de Julio'),
(1741, 19, 'Pocito'),
(1742, 19, 'Rawson'),
(1743, 19, 'Rivadavia'),
(1744, 19, '19'),
(1745, 19, 'San Martín'),
(1746, 19, 'Santa Lucía'),
(1747, 19, 'Sarmiento'),
(1748, 19, 'Ullum'),
(1749, 19, 'Valle Fértil'),
(1750, 19, 'Veinticinco de Mayo'),
(1751, 19, 'Zonda'),
(1752, 20, 'Alto Pelado'),
(1753, 20, 'Alto Pencoso'),
(1754, 20, 'Anchorena'),
(1755, 20, 'Arizona'),
(1756, 20, 'Bagual'),
(1757, 20, 'Balde'),
(1758, 20, 'Batavia'),
(1759, 20, 'Beazley'),
(1760, 20, 'Buena Esperanza'),
(1761, 20, 'Candelaria'),
(1762, 20, 'Capital'),
(1763, 20, 'Carolina'),
(1764, 20, 'Carpintería'),
(1765, 20, 'Concarán'),
(1766, 20, 'Cortaderas'),
(1767, 20, 'El Morro'),
(1768, 20, 'El Trapiche'),
(1769, 20, 'El Volcán'),
(1770, 20, 'Fortín El Patria'),
(1771, 20, 'Fortuna'),
(1772, 20, 'Fraga'),
(1773, 20, 'Juan Jorba'),
(1774, 20, 'Juan Llerena'),
(1775, 20, 'Juana Koslay'),
(1776, 20, 'Justo Daract'),
(1777, 20, 'La Calera'),
(1778, 20, 'La Florida'),
(1779, 20, 'La Punilla'),
(1780, 20, 'La Toma'),
(1781, 20, 'Lafinur'),
(1782, 20, 'Las Aguadas'),
(1783, 20, 'Las Chacras'),
(1784, 20, 'Las Lagunas'),
(1785, 20, 'Las Vertientes'),
(1786, 20, 'Lavaisse'),
(1787, 20, 'Leandro N. Alem'),
(1788, 20, 'Los Molles'),
(1789, 20, 'Luján'),
(1790, 20, 'Mercedes'),
(1791, 20, 'Merlo'),
(1792, 20, 'Naschel'),
(1793, 20, 'Navia'),
(1794, 20, 'Nogolí'),
(1795, 20, 'Nueva Galia'),
(1796, 20, 'Papagayos'),
(1797, 20, 'Paso Grande'),
(1798, 20, 'Potrero de Los Funes'),
(1799, 20, 'Quines'),
(1800, 20, 'Renca'),
(1801, 20, 'Saladillo'),
(1802, 20, 'San Francisco'),
(1803, 20, 'San Gerónimo'),
(1804, 20, 'San Martín'),
(1805, 20, 'San Pablo'),
(1806, 20, 'Santa Rosa de Conlara'),
(1807, 20, 'Talita'),
(1808, 20, 'Tilisarao'),
(1809, 20, 'Unión'),
(1810, 20, 'Villa de La Quebrada'),
(1811, 20, 'Villa de Praga'),
(1812, 20, 'Villa del Carmen'),
(1813, 20, 'Villa Gral. Roca'),
(1814, 20, 'Villa Larca'),
(1815, 20, 'Villa Mercedes'),
(1816, 20, 'Zanjitas'),
(1817, 21, 'Calafate'),
(1818, 21, 'Caleta Olivia'),
(1819, 21, 'Cañadón Seco'),
(1820, 21, 'Comandante Piedrabuena'),
(1821, 21, 'El Calafate'),
(1822, 21, 'El Chaltén'),
(1823, 21, 'Gdor. Gregores'),
(1824, 21, 'Hipólito Yrigoyen'),
(1825, 21, 'Jaramillo'),
(1826, 21, 'Koluel Kaike'),
(1827, 21, 'Las Heras'),
(1828, 21, 'Los Antiguos'),
(1829, 21, 'Perito Moreno'),
(1830, 21, 'Pico Truncado'),
(1831, 21, 'Pto. Deseado'),
(1832, 21, 'Pto. San Julián'),
(1833, 21, 'Pto. 21'),
(1834, 21, 'Río Cuarto'),
(1835, 21, 'Río Gallegos'),
(1836, 21, 'Río Turbio'),
(1837, 21, 'Tres Lagos'),
(1838, 21, 'Veintiocho De Noviembre'),
(1839, 22, 'Aarón Castellanos'),
(1840, 22, 'Acebal'),
(1841, 22, 'Aguará Grande'),
(1842, 22, 'Albarellos'),
(1843, 22, 'Alcorta'),
(1844, 22, 'Aldao'),
(1845, 22, 'Alejandra'),
(1846, 22, 'Álvarez'),
(1847, 22, 'Ambrosetti'),
(1848, 22, 'Amenábar'),
(1849, 22, 'Angélica'),
(1850, 22, 'Angeloni'),
(1851, 22, 'Arequito'),
(1852, 22, 'Arminda'),
(1853, 22, 'Armstrong'),
(1854, 22, 'Arocena'),
(1855, 22, 'Arroyo Aguiar'),
(1856, 22, 'Arroyo Ceibal'),
(1857, 22, 'Arroyo Leyes'),
(1858, 22, 'Arroyo Seco'),
(1859, 22, 'Arrufó'),
(1860, 22, 'Arteaga'),
(1861, 22, 'Ataliva'),
(1862, 22, 'Aurelia'),
(1863, 22, 'Avellaneda'),
(1864, 22, 'Barrancas'),
(1865, 22, 'Bauer Y Sigel'),
(1866, 22, 'Bella Italia'),
(1867, 22, 'Berabevú'),
(1868, 22, 'Berna'),
(1869, 22, 'Bernardo de Irigoyen'),
(1870, 22, 'Bigand'),
(1871, 22, 'Bombal'),
(1872, 22, 'Bouquet'),
(1873, 22, 'Bustinza'),
(1874, 22, 'Cabal'),
(1875, 22, 'Cacique Ariacaiquin'),
(1876, 22, 'Cafferata'),
(1877, 22, 'Calchaquí'),
(1878, 22, 'Campo Andino'),
(1879, 22, 'Campo Piaggio'),
(1880, 22, 'Cañada de Gómez'),
(1881, 22, 'Cañada del Ucle'),
(1882, 22, 'Cañada Rica'),
(1883, 22, 'Cañada Rosquín'),
(1884, 22, 'Candioti'),
(1885, 22, 'Capital'),
(1886, 22, 'Capitán Bermúdez'),
(1887, 22, 'Capivara'),
(1888, 22, 'Carcarañá'),
(1889, 22, 'Carlos Pellegrini'),
(1890, 22, 'Carmen'),
(1891, 22, 'Carmen Del Sauce'),
(1892, 22, 'Carreras'),
(1893, 22, 'Carrizales'),
(1894, 22, 'Casalegno'),
(1895, 22, 'Casas'),
(1896, 22, 'Casilda'),
(1897, 22, 'Castelar'),
(1898, 22, 'Castellanos'),
(1899, 22, 'Cayastá'),
(1900, 22, 'Cayastacito'),
(1901, 22, 'Centeno'),
(1902, 22, 'Cepeda'),
(1903, 22, 'Ceres'),
(1904, 22, 'Chabás'),
(1905, 22, 'Chañar Ladeado'),
(1906, 22, 'Chapuy'),
(1907, 22, 'Chovet'),
(1908, 22, 'Christophersen'),
(1909, 22, 'Classon'),
(1910, 22, 'Cnel. Arnold'),
(1911, 22, 'Cnel. Bogado'),
(1912, 22, 'Cnel. Dominguez'),
(1913, 22, 'Cnel. Fraga'),
(1914, 22, 'Col. Aldao'),
(1915, 22, 'Col. Ana'),
(1916, 22, 'Col. Belgrano'),
(1917, 22, 'Col. Bicha'),
(1918, 22, 'Col. Bigand'),
(1919, 22, 'Col. Bossi'),
(1920, 22, 'Col. Cavour'),
(1921, 22, 'Col. Cello'),
(1922, 22, 'Col. Dolores'),
(1923, 22, 'Col. Dos Rosas'),
(1924, 22, 'Col. Durán'),
(1925, 22, 'Col. Iturraspe'),
(1926, 22, 'Col. Margarita'),
(1927, 22, 'Col. Mascias'),
(1928, 22, 'Col. Raquel'),
(1929, 22, 'Col. Rosa'),
(1930, 22, 'Col. San José'),
(1931, 22, 'Constanza'),
(1932, 22, 'Coronda'),
(1933, 22, 'Correa'),
(1934, 22, 'Crispi'),
(1935, 22, 'Cululú'),
(1936, 22, 'Curupayti'),
(1937, 22, 'Desvio Arijón'),
(1938, 22, 'Diaz'),
(1939, 22, 'Diego de Alvear'),
(1940, 22, 'Egusquiza'),
(1941, 22, 'El Arazá'),
(1942, 22, 'El Rabón'),
(1943, 22, 'El Sombrerito'),
(1944, 22, 'El Trébol'),
(1945, 22, 'Elisa'),
(1946, 22, 'Elortondo'),
(1947, 22, 'Emilia'),
(1948, 22, 'Empalme San Carlos'),
(1949, 22, 'Empalme Villa Constitucion'),
(1950, 22, 'Esmeralda'),
(1951, 22, 'Esperanza'),
(1952, 22, 'Estación Alvear'),
(1953, 22, 'Estacion Clucellas'),
(1954, 22, 'Esteban Rams'),
(1955, 22, 'Esther'),
(1956, 22, 'Esustolia'),
(1957, 22, 'Eusebia'),
(1958, 22, 'Felicia'),
(1959, 22, 'Fidela'),
(1960, 22, 'Fighiera'),
(1961, 22, 'Firmat'),
(1962, 22, 'Florencia'),
(1963, 22, 'Fortín Olmos'),
(1964, 22, 'Franck'),
(1965, 22, 'Fray Luis Beltrán'),
(1966, 22, 'Frontera'),
(1967, 22, 'Fuentes'),
(1968, 22, 'Funes'),
(1969, 22, 'Gaboto'),
(1970, 22, 'Galisteo'),
(1971, 22, 'Gálvez'),
(1972, 22, 'Garabalto'),
(1973, 22, 'Garibaldi'),
(1974, 22, 'Gato Colorado'),
(1975, 22, 'Gdor. Crespo'),
(1976, 22, 'Gessler'),
(1977, 22, 'Godoy'),
(1978, 22, 'Golondrina'),
(1979, 22, 'Gral. Gelly'),
(1980, 22, 'Gral. Lagos'),
(1981, 22, 'Granadero Baigorria'),
(1982, 22, 'Gregoria Perez De Denis'),
(1983, 22, 'Grutly'),
(1984, 22, 'Guadalupe N.'),
(1985, 22, 'Gödeken'),
(1986, 22, 'Helvecia'),
(1987, 22, 'Hersilia'),
(1988, 22, 'Hipatía'),
(1989, 22, 'Huanqueros'),
(1990, 22, 'Hugentobler'),
(1991, 22, 'Hughes'),
(1992, 22, 'Humberto 1º'),
(1993, 22, 'Humboldt'),
(1994, 22, 'Ibarlucea'),
(1995, 22, 'Ing. Chanourdie'),
(1996, 22, 'Intiyaco'),
(1997, 22, 'Ituzaingó'),
(1998, 22, 'Jacinto L. Aráuz'),
(1999, 22, 'Josefina'),
(2000, 22, 'Juan B. Molina'),
(2001, 22, 'Juan de Garay'),
(2002, 22, 'Juncal'),
(2003, 22, 'La Brava'),
(2004, 22, 'La Cabral'),
(2005, 22, 'La Camila'),
(2006, 22, 'La Chispa'),
(2007, 22, 'La Clara'),
(2008, 22, 'La Criolla'),
(2009, 22, 'La Gallareta'),
(2010, 22, 'La Lucila'),
(2011, 22, 'La Pelada'),
(2012, 22, 'La Penca'),
(2013, 22, 'La Rubia'),
(2014, 22, 'La Sarita'),
(2015, 22, 'La Vanguardia'),
(2016, 22, 'Labordeboy'),
(2017, 22, 'Laguna Paiva'),
(2018, 22, 'Landeta'),
(2019, 22, 'Lanteri'),
(2020, 22, 'Larrechea'),
(2021, 22, 'Las Avispas'),
(2022, 22, 'Las Bandurrias'),
(2023, 22, 'Las Garzas'),
(2024, 22, 'Las Palmeras'),
(2025, 22, 'Las Parejas'),
(2026, 22, 'Las Petacas'),
(2027, 22, 'Las Rosas'),
(2028, 22, 'Las Toscas'),
(2029, 22, 'Las Tunas'),
(2030, 22, 'Lazzarino'),
(2031, 22, 'Lehmann'),
(2032, 22, 'Llambi Campbell'),
(2033, 22, 'Logroño'),
(2034, 22, 'Loma Alta'),
(2035, 22, 'López'),
(2036, 22, 'Los Amores'),
(2037, 22, 'Los Cardos'),
(2038, 22, 'Los Laureles'),
(2039, 22, 'Los Molinos'),
(2040, 22, 'Los Quirquinchos'),
(2041, 22, 'Lucio V. Lopez'),
(2042, 22, 'Luis Palacios'),
(2043, 22, 'Ma. Juana'),
(2044, 22, 'Ma. Luisa'),
(2045, 22, 'Ma. Susana'),
(2046, 22, 'Ma. Teresa'),
(2047, 22, 'Maciel'),
(2048, 22, 'Maggiolo'),
(2049, 22, 'Malabrigo'),
(2050, 22, 'Marcelino Escalada'),
(2051, 22, 'Margarita'),
(2052, 22, 'Matilde'),
(2053, 22, 'Mauá'),
(2054, 22, 'Máximo Paz'),
(2055, 22, 'Melincué'),
(2056, 22, 'Miguel Torres'),
(2057, 22, 'Moisés Ville'),
(2058, 22, 'Monigotes'),
(2059, 22, 'Monje'),
(2060, 22, 'Monte Obscuridad'),
(2061, 22, 'Monte Vera'),
(2062, 22, 'Montefiore'),
(2063, 22, 'Montes de Oca'),
(2064, 22, 'Murphy'),
(2065, 22, 'Ñanducita'),
(2066, 22, 'Naré'),
(2067, 22, 'Nelson'),
(2068, 22, 'Nicanor E. Molinas'),
(2069, 22, 'Nuevo Torino'),
(2070, 22, 'Oliveros'),
(2071, 22, 'Palacios'),
(2072, 22, 'Pavón'),
(2073, 22, 'Pavón Arriba'),
(2074, 22, 'Pedro Gómez Cello');
INSERT INTO `city` (`id`, `id_state`, `name`) VALUES
(2075, 22, 'Pérez'),
(2076, 22, 'Peyrano'),
(2077, 22, 'Piamonte'),
(2078, 22, 'Pilar'),
(2079, 22, 'Piñero'),
(2080, 22, 'Plaza Clucellas'),
(2081, 22, 'Portugalete'),
(2082, 22, 'Pozo Borrado'),
(2083, 22, 'Progreso'),
(2084, 22, 'Providencia'),
(2085, 22, 'Pte. Roca'),
(2086, 22, 'Pueblo Andino'),
(2087, 22, 'Pueblo Esther'),
(2088, 22, 'Pueblo Gral. San Martín'),
(2089, 22, 'Pueblo Irigoyen'),
(2090, 22, 'Pueblo Marini'),
(2091, 22, 'Pueblo Muñoz'),
(2092, 22, 'Pueblo Uranga'),
(2093, 22, 'Pujato'),
(2094, 22, 'Pujato N.'),
(2095, 22, 'Rafaela'),
(2096, 22, 'Ramayón'),
(2097, 22, 'Ramona'),
(2098, 22, 'Reconquista'),
(2099, 22, 'Recreo'),
(2100, 22, 'Ricardone'),
(2101, 22, 'Rivadavia'),
(2102, 22, 'Roldán'),
(2103, 22, 'Romang'),
(2104, 22, 'Rosario'),
(2105, 22, 'Rueda'),
(2106, 22, 'Rufino'),
(2107, 22, 'Sa Pereira'),
(2108, 22, 'Saguier'),
(2109, 22, 'Saladero M. Cabal'),
(2110, 22, 'Salto Grande'),
(2111, 22, 'San Agustín'),
(2112, 22, 'San Antonio de Obligado'),
(2113, 22, 'San Bernardo (N.J.)'),
(2114, 22, 'San Bernardo (S.J.)'),
(2115, 22, 'San Carlos Centro'),
(2116, 22, 'San Carlos N.'),
(2117, 22, 'San Carlos S.'),
(2118, 22, 'San Cristóbal'),
(2119, 22, 'San Eduardo'),
(2120, 22, 'San Eugenio'),
(2121, 22, 'San Fabián'),
(2122, 22, 'San Fco. de Santa Fé'),
(2123, 22, 'San Genaro'),
(2124, 22, 'San Genaro N.'),
(2125, 22, 'San Gregorio'),
(2126, 22, 'San Guillermo'),
(2127, 22, 'San Javier'),
(2128, 22, 'San Jerónimo del Sauce'),
(2129, 22, 'San Jerónimo N.'),
(2130, 22, 'San Jerónimo S.'),
(2131, 22, 'San Jorge'),
(2132, 22, 'San José de La Esquina'),
(2133, 22, 'San José del Rincón'),
(2134, 22, 'San Justo'),
(2135, 22, 'San Lorenzo'),
(2136, 22, 'San Mariano'),
(2137, 22, 'San Martín de Las Escobas'),
(2138, 22, 'San Martín N.'),
(2139, 22, 'San Vicente'),
(2140, 22, 'Sancti Spititu'),
(2141, 22, 'Sanford'),
(2142, 22, 'Santo Domingo'),
(2143, 22, 'Santo Tomé'),
(2144, 22, 'Santurce'),
(2145, 22, 'Sargento Cabral'),
(2146, 22, 'Sarmiento'),
(2147, 22, 'Sastre'),
(2148, 22, 'Sauce Viejo'),
(2149, 22, 'Serodino'),
(2150, 22, 'Silva'),
(2151, 22, 'Soldini'),
(2152, 22, 'Soledad'),
(2153, 22, 'Soutomayor'),
(2154, 22, 'Sta. Clara de Buena Vista'),
(2155, 22, 'Sta. Clara de Saguier'),
(2156, 22, 'Sta. Isabel'),
(2157, 22, 'Sta. Margarita'),
(2158, 22, 'Sta. Maria Centro'),
(2159, 22, 'Sta. María N.'),
(2160, 22, 'Sta. Rosa'),
(2161, 22, 'Sta. Teresa'),
(2162, 22, 'Suardi'),
(2163, 22, 'Sunchales'),
(2164, 22, 'Susana'),
(2165, 22, 'Tacuarendí'),
(2166, 22, 'Tacural'),
(2167, 22, 'Tartagal'),
(2168, 22, 'Teodelina'),
(2169, 22, 'Theobald'),
(2170, 22, 'Timbúes'),
(2171, 22, 'Toba'),
(2172, 22, 'Tortugas'),
(2173, 22, 'Tostado'),
(2174, 22, 'Totoras'),
(2175, 22, 'Traill'),
(2176, 22, 'Venado Tuerto'),
(2177, 22, 'Vera'),
(2178, 22, 'Vera y Pintado'),
(2179, 22, 'Videla'),
(2180, 22, 'Vila'),
(2181, 22, 'Villa Amelia'),
(2182, 22, 'Villa Ana'),
(2183, 22, 'Villa Cañas'),
(2184, 22, 'Villa Constitución'),
(2185, 22, 'Villa Eloísa'),
(2186, 22, 'Villa Gdor. Gálvez'),
(2187, 22, 'Villa Guillermina'),
(2188, 22, 'Villa Minetti'),
(2189, 22, 'Villa Mugueta'),
(2190, 22, 'Villa Ocampo'),
(2191, 22, 'Villa San José'),
(2192, 22, 'Villa Saralegui'),
(2193, 22, 'Villa Trinidad'),
(2194, 22, 'Villada'),
(2195, 22, 'Virginia'),
(2196, 22, 'Wheelwright'),
(2197, 22, 'Zavalla'),
(2198, 22, 'Zenón Pereira'),
(2199, 23, 'Añatuya'),
(2200, 23, 'Árraga'),
(2201, 23, 'Bandera'),
(2202, 23, 'Bandera Bajada'),
(2203, 23, 'Beltrán'),
(2204, 23, 'Brea Pozo'),
(2205, 23, 'Campo Gallo'),
(2206, 23, 'Capital'),
(2207, 23, 'Chilca Juliana'),
(2208, 23, 'Choya'),
(2209, 23, 'Clodomira'),
(2210, 23, 'Col. Alpina'),
(2211, 23, 'Col. Dora'),
(2212, 23, 'Col. El Simbolar Robles'),
(2213, 23, 'El Bobadal'),
(2214, 23, 'El Charco'),
(2215, 23, 'El Mojón'),
(2216, 23, 'Estación Atamisqui'),
(2217, 23, 'Estación Simbolar'),
(2218, 23, 'Fernández'),
(2219, 23, 'Fortín Inca'),
(2220, 23, 'Frías'),
(2221, 23, 'Garza'),
(2222, 23, 'Gramilla'),
(2223, 23, 'Guardia Escolta'),
(2224, 23, 'Herrera'),
(2225, 23, 'Icaño'),
(2226, 23, 'Ing. Forres'),
(2227, 23, 'La Banda'),
(2228, 23, 'La Cañada'),
(2229, 23, 'Laprida'),
(2230, 23, 'Lavalle'),
(2231, 23, 'Loreto'),
(2232, 23, 'Los Juríes'),
(2233, 23, 'Los Núñez'),
(2234, 23, 'Los Pirpintos'),
(2235, 23, 'Los Quiroga'),
(2236, 23, 'Los Telares'),
(2237, 23, 'Lugones'),
(2238, 23, 'Malbrán'),
(2239, 23, 'Matara'),
(2240, 23, 'Medellín'),
(2241, 23, 'Monte Quemado'),
(2242, 23, 'Nueva Esperanza'),
(2243, 23, 'Nueva Francia'),
(2244, 23, 'Palo Negro'),
(2245, 23, 'Pampa de Los Guanacos'),
(2246, 23, 'Pinto'),
(2247, 23, 'Pozo Hondo'),
(2248, 23, 'Quimilí'),
(2249, 23, 'Real Sayana'),
(2250, 23, 'Sachayoj'),
(2251, 23, 'San Pedro de Guasayán'),
(2252, 23, 'Selva'),
(2253, 23, 'Sol de Julio'),
(2254, 23, 'Sumampa'),
(2255, 23, 'Suncho Corral'),
(2256, 23, 'Taboada'),
(2257, 23, 'Tapso'),
(2258, 23, 'Termas de Rio Hondo'),
(2259, 23, 'Tintina'),
(2260, 23, 'Tomas Young'),
(2261, 23, 'Vilelas'),
(2262, 23, 'Villa Atamisqui'),
(2263, 23, 'Villa La Punta'),
(2264, 23, 'Villa Ojo de Agua'),
(2265, 23, 'Villa Río Hondo'),
(2266, 23, 'Villa Salavina'),
(2267, 23, 'Villa Unión'),
(2268, 23, 'Vilmer'),
(2269, 23, 'Weisburd'),
(2270, 24, 'Río Grande'),
(2271, 24, 'Tolhuin'),
(2272, 24, 'Ushuaia'),
(2273, 25, 'Acheral'),
(2274, 25, 'Agua Dulce'),
(2275, 25, 'Aguilares'),
(2276, 25, 'Alderetes'),
(2277, 25, 'Alpachiri'),
(2278, 25, 'Alto Verde'),
(2279, 25, 'Amaicha del Valle'),
(2280, 25, 'Amberes'),
(2281, 25, 'Ancajuli'),
(2282, 25, 'Arcadia'),
(2283, 25, 'Atahona'),
(2284, 25, 'Banda del Río Sali'),
(2285, 25, 'Bella Vista'),
(2286, 25, 'Buena Vista'),
(2287, 25, 'Burruyacú'),
(2288, 25, 'Capitán Cáceres'),
(2289, 25, 'Cevil Redondo'),
(2290, 25, 'Choromoro'),
(2291, 25, 'Ciudacita'),
(2292, 25, 'Colalao del Valle'),
(2293, 25, 'Colombres'),
(2294, 25, 'Concepción'),
(2295, 25, 'Delfín Gallo'),
(2296, 25, 'El Bracho'),
(2297, 25, 'El Cadillal'),
(2298, 25, 'El Cercado'),
(2299, 25, 'El Chañar'),
(2300, 25, 'El Manantial'),
(2301, 25, 'El Mojón'),
(2302, 25, 'El Mollar'),
(2303, 25, 'El Naranjito'),
(2304, 25, 'El Naranjo'),
(2305, 25, 'El Polear'),
(2306, 25, 'El Puestito'),
(2307, 25, 'El Sacrificio'),
(2308, 25, 'El Timbó'),
(2309, 25, 'Escaba'),
(2310, 25, 'Esquina'),
(2311, 25, 'Estación Aráoz'),
(2312, 25, 'Famaillá'),
(2313, 25, 'Gastone'),
(2314, 25, 'Gdor. Garmendia'),
(2315, 25, 'Gdor. Piedrabuena'),
(2316, 25, 'Graneros'),
(2317, 25, 'Huasa Pampa'),
(2318, 25, 'J. B. Alberdi'),
(2319, 25, 'La Cocha'),
(2320, 25, 'La Esperanza'),
(2321, 25, 'La Florida'),
(2322, 25, 'La Ramada'),
(2323, 25, 'La Trinidad'),
(2324, 25, 'Lamadrid'),
(2325, 25, 'Las Cejas'),
(2326, 25, 'Las Talas'),
(2327, 25, 'Las Talitas'),
(2328, 25, 'Los Bulacio'),
(2329, 25, 'Los Gómez'),
(2330, 25, 'Los Nogales'),
(2331, 25, 'Los Pereyra'),
(2332, 25, 'Los Pérez'),
(2333, 25, 'Los Puestos'),
(2334, 25, 'Los Ralos'),
(2335, 25, 'Los Sarmientos'),
(2336, 25, 'Los Sosa'),
(2337, 25, 'Lules'),
(2338, 25, 'M. García Fernández'),
(2339, 25, 'Manuela Pedraza'),
(2340, 25, 'Medinas'),
(2341, 25, 'Monte Bello'),
(2342, 25, 'Monteagudo'),
(2343, 25, 'Monteros'),
(2344, 25, 'Padre Monti'),
(2345, 25, 'Pampa Mayo'),
(2346, 25, 'Quilmes'),
(2347, 25, 'Raco'),
(2348, 25, 'Ranchillos'),
(2349, 25, 'Río Chico'),
(2350, 25, 'Río Colorado'),
(2351, 25, 'Río Seco'),
(2352, 25, 'Rumi Punco'),
(2353, 25, 'San Andrés'),
(2354, 25, 'San Felipe'),
(2355, 25, 'San Ignacio'),
(2356, 25, 'San Javier'),
(2357, 25, 'San José'),
(2358, 25, 'San Miguel de 25'),
(2359, 25, 'San Pedro'),
(2360, 25, 'San Pedro de Colalao'),
(2361, 25, 'Santa Rosa de Leales'),
(2362, 25, 'Sgto. Moya'),
(2363, 25, 'Siete de Abril'),
(2364, 25, 'Simoca'),
(2365, 25, 'Soldado Maldonado'),
(2366, 25, 'Sta. Ana'),
(2367, 25, 'Sta. Cruz'),
(2368, 25, 'Sta. Lucía'),
(2369, 25, 'Taco Ralo'),
(2370, 25, 'Tafí del Valle'),
(2371, 25, 'Tafí Viejo'),
(2372, 25, 'Tapia'),
(2373, 25, 'Teniente Berdina'),
(2374, 25, 'Trancas'),
(2375, 25, 'Villa Belgrano'),
(2376, 25, 'Villa Benjamín Araoz'),
(2377, 25, 'Villa Chiligasta'),
(2378, 25, 'Villa de Leales'),
(2379, 25, 'Villa Quinteros'),
(2380, 25, 'Yánima'),
(2381, 25, 'Yerba Buena'),
(2382, 25, 'Yerba Buena (S)');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client`
--

CREATE TABLE IF NOT EXISTS `client` (
`id` bigint(20) unsigned NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_deleted` datetime DEFAULT NULL,
  `name` varchar(35) NOT NULL,
  `description` text,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(40) DEFAULT NULL,
  `id_client_type` int(10) unsigned DEFAULT NULL,
  `id_country` int(10) unsigned DEFAULT NULL,
  `id_state` int(10) unsigned DEFAULT NULL,
  `id_city` int(10) unsigned DEFAULT NULL,
  `zip_code` varchar(10) DEFAULT NULL,
  `latitude` decimal(18,14) DEFAULT NULL,
  `longitude` decimal(18,14) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- Disparadores `client`
--
DELIMITER //
CREATE TRIGGER `client_date_created` BEFORE INSERT ON `client`
 FOR EACH ROW set new.`date_created` = now()
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client_administrator`
--

CREATE TABLE IF NOT EXISTS `client_administrator` (
`id` bigint(20) unsigned NOT NULL,
  `id_client` bigint(20) unsigned NOT NULL,
  `id_administrator` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client_engineer`
--

CREATE TABLE IF NOT EXISTS `client_engineer` (
`id` bigint(20) unsigned NOT NULL,
  `id_client` bigint(20) unsigned NOT NULL,
  `id_engineer` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client_file`
--

CREATE TABLE IF NOT EXISTS `client_file` (
`id` bigint(20) unsigned NOT NULL,
  `id_client` bigint(20) unsigned NOT NULL,
  `category` bigint(20) unsigned DEFAULT NULL,
  `url` varchar(1000) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client_type`
--

CREATE TABLE IF NOT EXISTS `client_type` (
`id` bigint(20) unsigned NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_deleted` datetime DEFAULT NULL,
  `name` varchar(35) NOT NULL,
  `description` text
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `client_type`
--

INSERT INTO `client_type` (`id`, `date_created`, `date_deleted`, `name`, `description`) VALUES
(1, '2015-03-15 00:21:15', NULL, 'Potencial', ''),
(2, '2015-03-15 00:21:21', NULL, 'Activo', ''),
(3, '2015-03-15 00:22:54', NULL, 'Otros', '');

--
-- Disparadores `client_type`
--
DELIMITER //
CREATE TRIGGER `client_type_date_created` BEFORE INSERT ON `client_type`
 FOR EACH ROW set new.`date_created` = now()
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `country`
--

CREATE TABLE IF NOT EXISTS `country` (
`id` int(11) unsigned NOT NULL,
  `code` varchar(2) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=243 ;

--
-- Volcado de datos para la tabla `country`
--

INSERT INTO `country` (`id`, `code`, `name`) VALUES
(1, 'US', 'United States'),
(2, 'CA', 'Canada'),
(3, 'AF', 'Afghanistan'),
(4, 'AL', 'Albania'),
(5, 'DZ', 'Algeria'),
(6, 'DS', 'American Samoa'),
(7, 'AD', 'Andorra'),
(8, 'AO', 'Angola'),
(9, 'AI', 'Anguilla'),
(10, 'AQ', 'Antarctica'),
(11, 'AG', 'Antigua and/or Barbuda'),
(12, 'AR', 'Argentina'),
(13, 'AM', 'Armenia'),
(14, 'AW', 'Aruba'),
(15, 'AU', 'Australia'),
(16, 'AT', 'Austria'),
(17, 'AZ', 'Azerbaijan'),
(18, 'BS', 'Bahamas'),
(19, 'BH', 'Bahrain'),
(20, 'BD', 'Bangladesh'),
(21, 'BB', 'Barbados'),
(22, 'BY', 'Belarus'),
(23, 'BE', 'Belgium'),
(24, 'BZ', 'Belize'),
(25, 'BJ', 'Benin'),
(26, 'BM', 'Bermuda'),
(27, 'BT', 'Bhutan'),
(28, 'BO', 'Bolivia'),
(29, 'BA', 'Bosnia and Herzegovina'),
(30, 'BW', 'Botswana'),
(31, 'BV', 'Bouvet Island'),
(32, 'BR', 'Brazil'),
(33, 'IO', 'British lndian Ocean Territory'),
(34, 'BN', 'Brunei Darussalam'),
(35, 'BG', 'Bulgaria'),
(36, 'BF', 'Burkina Faso'),
(37, 'BI', 'Burundi'),
(38, 'KH', 'Cambodia'),
(39, 'CM', 'Cameroon'),
(40, 'CV', 'Cape Verde'),
(41, 'KY', 'Cayman Islands'),
(42, 'CF', 'Central African Republic'),
(43, 'TD', 'Chad'),
(44, 'CL', 'Chile'),
(45, 'CN', 'China'),
(46, 'CX', 'Christmas Island'),
(47, 'CC', 'Cocos (Keeling) Islands'),
(48, 'CO', 'Colombia'),
(49, 'KM', 'Comoros'),
(50, 'CG', 'Congo'),
(51, 'CK', 'Cook Islands'),
(52, 'CR', 'Costa Rica'),
(53, 'HR', 'Croatia (Hrvatska)'),
(54, 'CU', 'Cuba'),
(55, 'CY', 'Cyprus'),
(56, 'CZ', 'Czech Republic'),
(57, 'DK', 'Denmark'),
(58, 'DJ', 'Djibouti'),
(59, 'DM', 'Dominica'),
(60, 'DO', 'Dominican Republic'),
(61, 'TP', 'East Timor'),
(62, 'EC', 'Ecuador'),
(63, 'EG', 'Egypt'),
(64, 'SV', 'El Salvador'),
(65, 'GQ', 'Equatorial Guinea'),
(66, 'ER', 'Eritrea'),
(67, 'EE', 'Estonia'),
(68, 'ET', 'Ethiopia'),
(69, 'FK', 'Falkland Islands (Malvinas)'),
(70, 'FO', 'Faroe Islands'),
(71, 'FJ', 'Fiji'),
(72, 'FI', 'Finland'),
(73, 'FR', 'France'),
(74, 'FX', 'France, Metropolitan'),
(75, 'GF', 'French Guiana'),
(76, 'PF', 'French Polynesia'),
(77, 'TF', 'French Southern Territories'),
(78, 'GA', 'Gabon'),
(79, 'GM', 'Gambia'),
(80, 'GE', 'Georgia'),
(81, 'DE', 'Germany'),
(82, 'GH', 'Ghana'),
(83, 'GI', 'Gibraltar'),
(84, 'GR', 'Greece'),
(85, 'GL', 'Greenland'),
(86, 'GD', 'Grenada'),
(87, 'GP', 'Guadeloupe'),
(88, 'GU', 'Guam'),
(89, 'GT', 'Guatemala'),
(90, 'GN', 'Guinea'),
(91, 'GW', 'Guinea-Bissau'),
(92, 'GY', 'Guyana'),
(93, 'HT', 'Haiti'),
(94, 'HM', 'Heard and Mc Donald Islands'),
(95, 'HN', 'Honduras'),
(96, 'HK', 'Hong Kong'),
(97, 'HU', 'Hungary'),
(98, 'IS', 'Iceland'),
(99, 'IN', 'India'),
(100, 'ID', 'Indonesia'),
(101, 'IR', 'Iran (Islamic Republic of)'),
(102, 'IQ', 'Iraq'),
(103, 'IE', 'Ireland'),
(104, 'IL', 'Israel'),
(105, 'IT', 'Italy'),
(106, 'CI', 'Ivory Coast'),
(107, 'JM', 'Jamaica'),
(108, 'JP', 'Japan'),
(109, 'JO', 'Jordan'),
(110, 'KZ', 'Kazakhstan'),
(111, 'KE', 'Kenya'),
(112, 'KI', 'Kiribati'),
(113, 'KP', 'Korea, Democratic People''s Republic of'),
(114, 'KR', 'Korea, Republic of'),
(115, 'XK', 'Kosovo'),
(116, 'KW', 'Kuwait'),
(117, 'KG', 'Kyrgyzstan'),
(118, 'LA', 'Lao People''s Democratic Republic'),
(119, 'LV', 'Latvia'),
(120, 'LB', 'Lebanon'),
(121, 'LS', 'Lesotho'),
(122, 'LR', 'Liberia'),
(123, 'LY', 'Libyan Arab Jamahiriya'),
(124, 'LI', 'Liechtenstein'),
(125, 'LT', 'Lithuania'),
(126, 'LU', 'Luxembourg'),
(127, 'MO', 'Macau'),
(128, 'MK', 'Macedonia'),
(129, 'MG', 'Madagascar'),
(130, 'MW', 'Malawi'),
(131, 'MY', 'Malaysia'),
(132, 'MV', 'Maldives'),
(133, 'ML', 'Mali'),
(134, 'MT', 'Malta'),
(135, 'MH', 'Marshall Islands'),
(136, 'MQ', 'Martinique'),
(137, 'MR', 'Mauritania'),
(138, 'MU', 'Mauritius'),
(139, 'TY', 'Mayotte'),
(140, 'MX', 'Mexico'),
(141, 'FM', 'Micronesia, Federated States of'),
(142, 'MD', 'Moldova, Republic of'),
(143, 'MC', 'Monaco'),
(144, 'MN', 'Mongolia'),
(145, 'ME', 'Montenegro'),
(146, 'MS', 'Montserrat'),
(147, 'MA', 'Morocco'),
(148, 'MZ', 'Mozambique'),
(149, 'MM', 'Myanmar'),
(150, 'NA', 'Namibia'),
(151, 'NR', 'Nauru'),
(152, 'NP', 'Nepal'),
(153, 'NL', 'Netherlands'),
(154, 'AN', 'Netherlands Antilles'),
(155, 'NC', 'New Caledonia'),
(156, 'NZ', 'New Zealand'),
(157, 'NI', 'Nicaragua'),
(158, 'NE', 'Niger'),
(159, 'NG', 'Nigeria'),
(160, 'NU', 'Niue'),
(161, 'NF', 'Norfork Island'),
(162, 'MP', 'Northern Mariana Islands'),
(163, 'NO', 'Norway'),
(164, 'OM', 'Oman'),
(165, 'PK', 'Pakistan'),
(166, 'PW', 'Palau'),
(167, 'PA', 'Panama'),
(168, 'PG', 'Papua New Guinea'),
(169, 'PY', 'Paraguay'),
(170, 'PE', 'Peru'),
(171, 'PH', 'Philippines'),
(172, 'PN', 'Pitcairn'),
(173, 'PL', 'Poland'),
(174, 'PT', 'Portugal'),
(175, 'PR', 'Puerto Rico'),
(176, 'QA', 'Qatar'),
(177, 'RE', 'Reunion'),
(178, 'RO', 'Romania'),
(179, 'RU', 'Russian Federation'),
(180, 'RW', 'Rwanda'),
(181, 'KN', 'Saint Kitts and Nevis'),
(182, 'LC', 'Saint Lucia'),
(183, 'VC', 'Saint Vincent and the Grenadines'),
(184, 'WS', 'Samoa'),
(185, 'SM', 'San Marino'),
(186, 'ST', 'Sao Tome and Principe'),
(187, 'SA', 'Saudi Arabia'),
(188, 'SN', 'Senegal'),
(189, 'RS', 'Serbia'),
(190, 'SC', 'Seychelles'),
(191, 'SL', 'Sierra Leone'),
(192, 'SG', 'Singapore'),
(193, 'SK', 'Slovakia'),
(194, 'SI', 'Slovenia'),
(195, 'SB', 'Solomon Islands'),
(196, 'SO', 'Somalia'),
(197, 'ZA', 'South Africa'),
(198, 'GS', 'South Georgia South Sandwich Islands'),
(199, 'ES', 'Spain'),
(200, 'LK', 'Sri Lanka'),
(201, 'SH', 'St. Helena'),
(202, 'PM', 'St. Pierre and Miquelon'),
(203, 'SD', 'Sudan'),
(204, 'SR', 'Suriname'),
(205, 'SJ', 'Svalbarn and Jan Mayen Islands'),
(206, 'SZ', 'Swaziland'),
(207, 'SE', 'Sweden'),
(208, 'CH', 'Switzerland'),
(209, 'SY', 'Syrian Arab Republic'),
(210, 'TW', 'Taiwan'),
(211, 'TJ', 'Tajikistan'),
(212, 'TZ', 'Tanzania, United Republic of'),
(213, 'TH', 'Thailand'),
(214, 'TG', 'Togo'),
(215, 'TK', 'Tokelau'),
(216, 'TO', 'Tonga'),
(217, 'TT', 'Trinidad and Tobago'),
(218, 'TN', 'Tunisia'),
(219, 'TR', 'Turkey'),
(220, 'TM', 'Turkmenistan'),
(221, 'TC', 'Turks and Caicos Islands'),
(222, 'TV', 'Tuvalu'),
(223, 'UG', 'Uganda'),
(224, 'UA', 'Ukraine'),
(225, 'AE', 'United Arab Emirates'),
(226, 'GB', 'United Kingdom'),
(227, 'UM', 'United States minor outlying islands'),
(228, 'UY', 'Uruguay'),
(229, 'UZ', 'Uzbekistan'),
(230, 'VU', 'Vanuatu'),
(231, 'VA', 'Vatican City State'),
(232, 'VE', 'Venezuela'),
(233, 'VN', 'Vietnam'),
(234, 'VG', 'Virgin Islands (British)'),
(235, 'VI', 'Virgin Islands (U.S.)'),
(236, 'WF', 'Wallis and Futuna Islands'),
(237, 'EH', 'Western Sahara'),
(238, 'YE', 'Yemen'),
(239, 'YU', 'Yugoslavia'),
(240, 'ZR', 'Zaire'),
(241, 'ZM', 'Zambia'),
(242, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elevator`
--

CREATE TABLE IF NOT EXISTS `elevator` (
`id` bigint(20) unsigned NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_deleted` datetime DEFAULT NULL,
  `name` varchar(35) NOT NULL,
  `id_client` bigint(20) unsigned NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Disparadores `elevator`
--
DELIMITER //
CREATE TRIGGER `elevator_date_created` BEFORE INSERT ON `elevator`
 FOR EACH ROW set new.`date_created` = now()
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `engineer`
--

CREATE TABLE IF NOT EXISTS `engineer` (
`id` bigint(20) unsigned NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_deleted` datetime DEFAULT NULL,
  `first_name` varchar(35) NOT NULL,
  `last_name` varchar(35) NOT NULL,
  `sex` char(1) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `address` varchar(40) DEFAULT NULL,
  `description` text,
  `id_country` int(10) unsigned DEFAULT NULL,
  `id_state` int(10) unsigned DEFAULT NULL,
  `id_city` int(10) unsigned DEFAULT NULL,
  `zip_code` varchar(10) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Disparadores `engineer`
--
DELIMITER //
CREATE TRIGGER `engineer_date_created` BEFORE INSERT ON `engineer`
 FOR EACH ROW set new.`date_created` = now()
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log`
--

CREATE TABLE IF NOT EXISTS `log` (
`id` bigint(20) unsigned NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `id_user` bigint(20) unsigned DEFAULT NULL,
  `tablename` varchar(64) DEFAULT NULL,
  `id_row` bigint(20) unsigned DEFAULT NULL,
  `type` char(1) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Disparadores `log`
--
DELIMITER //
CREATE TRIGGER `log_date_created` BEFORE INSERT ON `log`
 FOR EACH ROW set new.`date_created` = now()
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notification`
--

CREATE TABLE IF NOT EXISTS `notification` (
`id` bigint(20) unsigned NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_deleted` datetime DEFAULT NULL,
  `date` datetime NOT NULL,
  `priority` tinyint(3) unsigned NOT NULL,
  `id_role` bigint(20) unsigned DEFAULT NULL,
  `id_user` bigint(20) unsigned DEFAULT NULL,
  `description` text,
  `link` varchar(2083) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- Disparadores `notification`
--
DELIMITER //
CREATE TRIGGER `notification_date_created` BEFORE INSERT ON `notification`
 FOR EACH ROW set new.`date_created` = now()
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permission`
--

CREATE TABLE IF NOT EXISTS `permission` (
`id` bigint(20) unsigned NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_deleted` datetime DEFAULT NULL,
  `name` varchar(35) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Disparadores `permission`
--
DELIMITER //
CREATE TRIGGER `permission_date_created` BEFORE INSERT ON `permission`
 FOR EACH ROW set new.`date_created` = now()
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permission_assigned`
--

CREATE TABLE IF NOT EXISTS `permission_assigned` (
`id` bigint(20) unsigned NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_deleted` datetime DEFAULT NULL,
  `id_permission` bigint(20) unsigned NOT NULL,
  `id_user` bigint(20) unsigned DEFAULT NULL,
  `id_role` bigint(20) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Disparadores `permission_assigned`
--
DELIMITER //
CREATE TRIGGER `permission_assigned_date_created` BEFORE INSERT ON `permission_assigned`
 FOR EACH ROW set new.`date_created` = now()
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profile`
--

CREATE TABLE IF NOT EXISTS `profile` (
`id` bigint(20) unsigned NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_deleted` datetime DEFAULT NULL,
  `first_name` varchar(35) NOT NULL,
  `last_name` varchar(35) NOT NULL,
  `sex` char(1) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `address` varchar(40) DEFAULT NULL,
  `description` text,
  `id_country` int(10) unsigned DEFAULT NULL,
  `id_state` int(10) unsigned DEFAULT NULL,
  `id_city` int(10) unsigned DEFAULT NULL,
  `zip_code` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Disparadores `profile`
--
DELIMITER //
CREATE TRIGGER `profile_date_created` BEFORE INSERT ON `profile`
 FOR EACH ROW set new.`date_created` = now()
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role`
--

CREATE TABLE IF NOT EXISTS `role` (
`id` bigint(20) unsigned NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_deleted` datetime DEFAULT NULL,
  `name` varchar(35) NOT NULL,
  `description` text
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=42 ;

--
-- Volcado de datos para la tabla `role`
--

INSERT INTO `role` (`id`, `date_created`, `date_deleted`, `name`, `description`) VALUES
(1, '2015-03-10 14:21:17', NULL, 'Administrador', '1');

--
-- Disparadores `role`
--
DELIMITER //
CREATE TRIGGER `role_date_created` BEFORE INSERT ON `role`
 FOR EACH ROW set new.`date_created` = now()
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `state`
--

CREATE TABLE IF NOT EXISTS `state` (
`id` int(11) unsigned NOT NULL,
  `id_country` int(11) unsigned NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Volcado de datos para la tabla `state`
--

INSERT INTO `state` (`id`, `id_country`, `name`) VALUES
(1, 12, 'Buenos Aires'),
(2, 12, 'Buenos Aires-GBA'),
(3, 12, 'Capital Federal'),
(4, 12, 'Catamarca'),
(5, 12, 'Chaco'),
(6, 12, 'Chubut'),
(7, 12, 'Córdoba'),
(8, 12, 'Corrientes'),
(9, 12, 'Entre Ríos'),
(10, 12, 'Formosa'),
(11, 12, 'Jujuy'),
(12, 12, 'La Pampa'),
(13, 12, 'La Rioja'),
(14, 12, 'Mendoza'),
(15, 12, 'Misiones'),
(16, 12, 'Neuquén'),
(17, 12, 'Río Negro'),
(18, 12, 'Salta'),
(19, 12, 'San Juan'),
(20, 12, 'San Luis'),
(21, 12, 'Santa Cruz'),
(22, 12, 'Santa Fe'),
(23, 12, 'Santiago del Estero'),
(24, 12, 'Tierra del Fuego'),
(25, 12, 'Tucumán');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `technician`
--

CREATE TABLE IF NOT EXISTS `technician` (
`id` bigint(20) unsigned NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_deleted` datetime DEFAULT NULL,
  `first_name` varchar(35) NOT NULL,
  `last_name` varchar(35) NOT NULL,
  `sex` char(1) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `address` varchar(40) DEFAULT NULL,
  `description` text,
  `id_country` int(10) unsigned DEFAULT NULL,
  `id_state` int(10) unsigned DEFAULT NULL,
  `id_city` int(10) unsigned DEFAULT NULL,
  `zip_code` varchar(10) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Disparadores `technician`
--
DELIMITER //
CREATE TRIGGER `technician_date_created` BEFORE INSERT ON `technician`
 FOR EACH ROW set new.`date_created` = now()
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ticket`
--

CREATE TABLE IF NOT EXISTS `ticket` (
`id` bigint(20) unsigned NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_deleted` datetime DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `id_engineer` bigint(20) unsigned DEFAULT NULL,
  `id_technician` bigint(20) unsigned DEFAULT NULL,
  `id_client` bigint(20) unsigned NOT NULL,
  `id_elevator` bigint(20) unsigned NOT NULL,
  `id_ticket_option` bigint(20) unsigned DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Disparadores `ticket`
--
DELIMITER //
CREATE TRIGGER `ticket_date_created` BEFORE INSERT ON `ticket`
 FOR EACH ROW set new.`date_created` = now()
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ticket_option`
--

CREATE TABLE IF NOT EXISTS `ticket_option` (
`id` bigint(20) unsigned NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_deleted` datetime DEFAULT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Volcado de datos para la tabla `ticket_option`
--

INSERT INTO `ticket_option` (`id`, `date_created`, `date_deleted`, `name`) VALUES
(8, '2015-03-15 05:45:26', NULL, 'No se encontró al encargado.'),
(9, '2015-03-15 05:45:26', NULL, 'Suministro eléctrico interrumpido.'),
(10, '2015-03-15 05:45:26', NULL, 'El/los ascensores se encontraban funcionando.'),
(11, '2015-03-15 05:45:26', NULL, 'El ascensor queda detenido por reparaciones.'),
(12, '2015-03-15 05:45:26', NULL, 'No se accedió a los libros de inspección.'),
(13, '2015-03-15 05:45:26', NULL, 'No se pudo acceder al edificio/dependencias.'),
(14, '2015-03-15 05:45:26', NULL, 'El ascensor, quedo en funcionamiento.');

--
-- Disparadores `ticket_option`
--
DELIMITER //
CREATE TRIGGER `ticket_option_date_created` BEFORE INSERT ON `ticket_option`
 FOR EACH ROW set new.`date_created` = now()
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`id` bigint(20) unsigned NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_deleted` datetime DEFAULT NULL,
  `id_role` bigint(20) unsigned NOT NULL,
  `password` char(16) DEFAULT NULL,
  `password_question` varchar(200) DEFAULT NULL,
  `password_answer` varchar(100) DEFAULT NULL,
  `first_name` varchar(35) NOT NULL,
  `last_name` varchar(35) NOT NULL,
  `sex` char(1) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `address` varchar(40) DEFAULT NULL,
  `description` text,
  `id_country` int(10) unsigned DEFAULT NULL,
  `id_state` int(10) unsigned DEFAULT NULL,
  `id_city` int(10) unsigned DEFAULT NULL,
  `zip_code` varchar(10) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `date_created`, `date_deleted`, `id_role`, `password`, `password_question`, `password_answer`, `first_name`, `last_name`, `sex`, `email`, `phone`, `birthday`, `address`, `description`, `id_country`, `id_state`, `id_city`, `zip_code`) VALUES
(1, '2015-03-10 14:21:17', NULL, 1, 'system', '', '', 'System', 'System', '', 'info@system.com', '', NULL, '', '', NULL, NULL, NULL, '5152'),
(2, '2015-03-10 14:21:17', NULL, 1, 'test', '', '', 'Administrator', 'Administrator', '', 'admin@system.com', '', '2015-03-02 00:00:00', '', '', NULL, NULL, NULL, '');

--
-- Disparadores `user`
--
DELIMITER //
CREATE TRIGGER `user_date_created` BEFORE INSERT ON `user`
 FOR EACH ROW set new.`date_created` = now()
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_notification`
--

CREATE TABLE IF NOT EXISTS `user_notification` (
`id` bigint(20) unsigned NOT NULL,
  `id_notification` bigint(20) unsigned NOT NULL,
  `id_user` bigint(20) unsigned NOT NULL,
  `checked` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=65 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_session`
--

CREATE TABLE IF NOT EXISTS `user_session` (
`id` bigint(20) unsigned NOT NULL,
  `id_user` bigint(20) unsigned NOT NULL,
  `logon_date` datetime DEFAULT NULL,
  `logoff_date` datetime DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` varchar(413) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accounting_entry`
--
ALTER TABLE `accounting_entry`
 ADD PRIMARY KEY (`id`), ADD KEY `id_business` (`id_business`), ADD KEY `id_client` (`id_client`), ADD KEY `id_account_type` (`id_account_type`);

--
-- Indices de la tabla `account_type`
--
ALTER TABLE `account_type`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `administrator`
--
ALTER TABLE `administrator`
 ADD PRIMARY KEY (`id`), ADD KEY `id_country` (`id_country`), ADD KEY `id_state` (`id_state`), ADD KEY `id_city` (`id_city`);

--
-- Indices de la tabla `business`
--
ALTER TABLE `business`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `city`
--
ALTER TABLE `city`
 ADD PRIMARY KEY (`id`), ADD KEY `id_state` (`id_state`);

--
-- Indices de la tabla `client`
--
ALTER TABLE `client`
 ADD PRIMARY KEY (`id`), ADD KEY `id_country` (`id_country`), ADD KEY `id_state` (`id_state`), ADD KEY `id_city` (`id_city`), ADD KEY `id_client_type` (`id_client_type`);

--
-- Indices de la tabla `client_administrator`
--
ALTER TABLE `client_administrator`
 ADD PRIMARY KEY (`id`), ADD KEY `id_client` (`id_client`), ADD KEY `id_administrator` (`id_administrator`);

--
-- Indices de la tabla `client_engineer`
--
ALTER TABLE `client_engineer`
 ADD PRIMARY KEY (`id`), ADD KEY `id_client` (`id_client`), ADD KEY `id_engineer` (`id_engineer`);

--
-- Indices de la tabla `client_file`
--
ALTER TABLE `client_file`
 ADD PRIMARY KEY (`id`), ADD KEY `id_client` (`id_client`);

--
-- Indices de la tabla `client_type`
--
ALTER TABLE `client_type`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `country`
--
ALTER TABLE `country`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `elevator`
--
ALTER TABLE `elevator`
 ADD PRIMARY KEY (`id`), ADD KEY `id_client` (`id_client`);

--
-- Indices de la tabla `engineer`
--
ALTER TABLE `engineer`
 ADD PRIMARY KEY (`id`), ADD KEY `id_country` (`id_country`), ADD KEY `id_state` (`id_state`), ADD KEY `id_city` (`id_city`);

--
-- Indices de la tabla `log`
--
ALTER TABLE `log`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `notification`
--
ALTER TABLE `notification`
 ADD PRIMARY KEY (`id`), ADD KEY `id_role` (`id_role`), ADD KEY `id_user` (`id_user`);

--
-- Indices de la tabla `permission`
--
ALTER TABLE `permission`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `permission_assigned`
--
ALTER TABLE `permission_assigned`
 ADD PRIMARY KEY (`id`), ADD KEY `id_permission` (`id_permission`), ADD KEY `id_user` (`id_user`), ADD KEY `id_role` (`id_role`);

--
-- Indices de la tabla `profile`
--
ALTER TABLE `profile`
 ADD PRIMARY KEY (`id`), ADD KEY `id_country` (`id_country`), ADD KEY `id_state` (`id_state`), ADD KEY `id_city` (`id_city`);

--
-- Indices de la tabla `role`
--
ALTER TABLE `role`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `state`
--
ALTER TABLE `state`
 ADD PRIMARY KEY (`id`), ADD KEY `id_country` (`id_country`);

--
-- Indices de la tabla `technician`
--
ALTER TABLE `technician`
 ADD PRIMARY KEY (`id`), ADD KEY `id_country` (`id_country`), ADD KEY `id_state` (`id_state`), ADD KEY `id_city` (`id_city`);

--
-- Indices de la tabla `ticket`
--
ALTER TABLE `ticket`
 ADD PRIMARY KEY (`id`), ADD KEY `id_engineer` (`id_engineer`), ADD KEY `id_client` (`id_client`), ADD KEY `id_elevator` (`id_elevator`), ADD KEY `id_ticket_option` (`id_ticket_option`), ADD KEY `id_technician` (`id_technician`);

--
-- Indices de la tabla `ticket_option`
--
ALTER TABLE `ticket_option`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`id`), ADD KEY `id_role` (`id_role`), ADD KEY `id_country` (`id_country`), ADD KEY `id_state` (`id_state`), ADD KEY `id_city` (`id_city`);

--
-- Indices de la tabla `user_notification`
--
ALTER TABLE `user_notification`
 ADD PRIMARY KEY (`id`), ADD KEY `id_notification` (`id_notification`), ADD KEY `id_user` (`id_user`);

--
-- Indices de la tabla `user_session`
--
ALTER TABLE `user_session`
 ADD PRIMARY KEY (`id`), ADD KEY `id_user` (`id_user`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `accounting_entry`
--
ALTER TABLE `accounting_entry`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT de la tabla `account_type`
--
ALTER TABLE `account_type`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `administrator`
--
ALTER TABLE `administrator`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `business`
--
ALTER TABLE `business`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `city`
--
ALTER TABLE `city`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2383;
--
-- AUTO_INCREMENT de la tabla `client`
--
ALTER TABLE `client`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT de la tabla `client_administrator`
--
ALTER TABLE `client_administrator`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `client_engineer`
--
ALTER TABLE `client_engineer`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `client_file`
--
ALTER TABLE `client_file`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT de la tabla `client_type`
--
ALTER TABLE `client_type`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `country`
--
ALTER TABLE `country`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=243;
--
-- AUTO_INCREMENT de la tabla `elevator`
--
ALTER TABLE `elevator`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `engineer`
--
ALTER TABLE `engineer`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `log`
--
ALTER TABLE `log`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `notification`
--
ALTER TABLE `notification`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT de la tabla `permission`
--
ALTER TABLE `permission`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `permission_assigned`
--
ALTER TABLE `permission_assigned`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `profile`
--
ALTER TABLE `profile`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `role`
--
ALTER TABLE `role`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT de la tabla `state`
--
ALTER TABLE `state`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT de la tabla `technician`
--
ALTER TABLE `technician`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `ticket`
--
ALTER TABLE `ticket`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `ticket_option`
--
ALTER TABLE `ticket_option`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `user_notification`
--
ALTER TABLE `user_notification`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=65;
--
-- AUTO_INCREMENT de la tabla `user_session`
--
ALTER TABLE `user_session`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `accounting_entry`
--
ALTER TABLE `accounting_entry`
ADD CONSTRAINT `accounting_entry_ibfk_1` FOREIGN KEY (`id_business`) REFERENCES `business` (`id`) ON UPDATE CASCADE,
ADD CONSTRAINT `accounting_entry_ibfk_2` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`) ON UPDATE CASCADE,
ADD CONSTRAINT `accounting_entry_ibfk_3` FOREIGN KEY (`id_account_type`) REFERENCES `account_type` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `administrator`
--
ALTER TABLE `administrator`
ADD CONSTRAINT `administrator_ibfk_1` FOREIGN KEY (`id_country`) REFERENCES `country` (`id`) ON UPDATE CASCADE,
ADD CONSTRAINT `administrator_ibfk_2` FOREIGN KEY (`id_state`) REFERENCES `state` (`id`) ON UPDATE CASCADE,
ADD CONSTRAINT `administrator_ibfk_3` FOREIGN KEY (`id_city`) REFERENCES `city` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `city`
--
ALTER TABLE `city`
ADD CONSTRAINT `city_ibfk_1` FOREIGN KEY (`id_state`) REFERENCES `state` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `client`
--
ALTER TABLE `client`
ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`id_country`) REFERENCES `country` (`id`) ON UPDATE CASCADE,
ADD CONSTRAINT `client_ibfk_2` FOREIGN KEY (`id_state`) REFERENCES `state` (`id`) ON UPDATE CASCADE,
ADD CONSTRAINT `client_ibfk_3` FOREIGN KEY (`id_city`) REFERENCES `city` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `client_administrator`
--
ALTER TABLE `client_administrator`
ADD CONSTRAINT `client_administrator_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`) ON UPDATE CASCADE,
ADD CONSTRAINT `client_administrator_ibfk_2` FOREIGN KEY (`id_administrator`) REFERENCES `administrator` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `client_engineer`
--
ALTER TABLE `client_engineer`
ADD CONSTRAINT `client_engineer_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`) ON UPDATE CASCADE,
ADD CONSTRAINT `client_engineer_ibfk_2` FOREIGN KEY (`id_engineer`) REFERENCES `engineer` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `client_file`
--
ALTER TABLE `client_file`
ADD CONSTRAINT `client_file_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `elevator`
--
ALTER TABLE `elevator`
ADD CONSTRAINT `elevator_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `engineer`
--
ALTER TABLE `engineer`
ADD CONSTRAINT `engineer_ibfk_1` FOREIGN KEY (`id_country`) REFERENCES `country` (`id`) ON UPDATE CASCADE,
ADD CONSTRAINT `engineer_ibfk_2` FOREIGN KEY (`id_state`) REFERENCES `state` (`id`) ON UPDATE CASCADE,
ADD CONSTRAINT `engineer_ibfk_3` FOREIGN KEY (`id_city`) REFERENCES `city` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `notification`
--
ALTER TABLE `notification`
ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `role` (`id`) ON UPDATE CASCADE,
ADD CONSTRAINT `notification_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `permission_assigned`
--
ALTER TABLE `permission_assigned`
ADD CONSTRAINT `permission_assigned_ibfk_1` FOREIGN KEY (`id_permission`) REFERENCES `permission` (`id`) ON UPDATE CASCADE,
ADD CONSTRAINT `permission_assigned_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
ADD CONSTRAINT `permission_assigned_ibfk_3` FOREIGN KEY (`id_role`) REFERENCES `role` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `profile`
--
ALTER TABLE `profile`
ADD CONSTRAINT `profile_ibfk_1` FOREIGN KEY (`id_country`) REFERENCES `country` (`id`) ON UPDATE CASCADE,
ADD CONSTRAINT `profile_ibfk_2` FOREIGN KEY (`id_state`) REFERENCES `state` (`id`) ON UPDATE CASCADE,
ADD CONSTRAINT `profile_ibfk_3` FOREIGN KEY (`id_city`) REFERENCES `city` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `state`
--
ALTER TABLE `state`
ADD CONSTRAINT `state_ibfk_1` FOREIGN KEY (`id_country`) REFERENCES `country` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `technician`
--
ALTER TABLE `technician`
ADD CONSTRAINT `technician_ibfk_1` FOREIGN KEY (`id_country`) REFERENCES `country` (`id`) ON UPDATE CASCADE,
ADD CONSTRAINT `technician_ibfk_2` FOREIGN KEY (`id_state`) REFERENCES `state` (`id`) ON UPDATE CASCADE,
ADD CONSTRAINT `technician_ibfk_3` FOREIGN KEY (`id_city`) REFERENCES `city` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `ticket`
--
ALTER TABLE `ticket`
ADD CONSTRAINT `technician_ibfk_5` FOREIGN KEY (`id_technician`) REFERENCES `technician` (`id`) ON UPDATE CASCADE,
ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`id_engineer`) REFERENCES `engineer` (`id`) ON UPDATE CASCADE,
ADD CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`) ON UPDATE CASCADE,
ADD CONSTRAINT `ticket_ibfk_3` FOREIGN KEY (`id_elevator`) REFERENCES `elevator` (`id`) ON UPDATE CASCADE,
ADD CONSTRAINT `ticket_ibfk_4` FOREIGN KEY (`id_ticket_option`) REFERENCES `ticket_option` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `role` (`id`) ON UPDATE CASCADE,
ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`id_country`) REFERENCES `country` (`id`) ON UPDATE CASCADE,
ADD CONSTRAINT `user_ibfk_3` FOREIGN KEY (`id_state`) REFERENCES `state` (`id`) ON UPDATE CASCADE,
ADD CONSTRAINT `user_ibfk_4` FOREIGN KEY (`id_city`) REFERENCES `city` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `user_notification`
--
ALTER TABLE `user_notification`
ADD CONSTRAINT `user_notification_ibfk_1` FOREIGN KEY (`id_notification`) REFERENCES `notification` (`id`) ON UPDATE CASCADE,
ADD CONSTRAINT `user_notification_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `user_session`
--
ALTER TABLE `user_session`
ADD CONSTRAINT `user_session_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
