-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-11-2024 a las 05:40:49
-- Versión del servidor: 11.5.2-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `barberia_bd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add servicio', 7, 'add_servicio'),
(26, 'Can change servicio', 7, 'change_servicio'),
(27, 'Can delete servicio', 7, 'delete_servicio'),
(28, 'Can view servicio', 7, 'view_servicio'),
(29, 'Can add barbero', 8, 'add_barbero'),
(30, 'Can change barbero', 8, 'change_barbero'),
(31, 'Can delete barbero', 8, 'delete_barbero'),
(32, 'Can view barbero', 8, 'view_barbero'),
(33, 'Can add reserva', 9, 'add_reserva'),
(34, 'Can change reserva', 9, 'change_reserva'),
(35, 'Can delete reserva', 9, 'delete_reserva'),
(36, 'Can view reserva', 9, 'view_reserva');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$870000$NQRHEkJyT8i7qGtyZLXmSS$CwC0NT4ZwhTQpdDYI0/nJwNov8QP88MVMBtNDdg+qZU=', '2024-11-21 04:22:43.427015', 0, 'sadsa@sahfksa.com', 'sadsa', 'asdsad', 'sadsa@sahfksa.com', 0, 1, '2024-11-21 04:18:55.604589'),
(3, 'pbkdf2_sha256$870000$fb0PJHhjR9g36zPkDhMPLQ$2KlyLNysm/NItZSnA3N5Iwr/3KUI5J69U9Npx+lHcPg=', '2024-11-27 02:03:32.332520', 1, 'admin', '', '', 'barbershop@gmail.com', 1, 1, '2024-11-26 21:21:33.994129'),
(4, 'pbkdf2_sha256$870000$6ClbHTsLZK6dNiU1D4oZwa$JcB4V5dbFWUHtCuOF2RbC/mhk9j/AofIrT+CxubbwQE=', '2024-11-27 01:56:25.012412', 0, 'qwwer@gmail.com', 'qwe', 'qwe', 'qwwer@gmail.com', 0, 1, '2024-11-26 21:52:42.955057'),
(5, 'pbkdf2_sha256$870000$erjePlsP69cyyz6EWF5S1C$qq4/m+UF7vxGm2LXajoVo8KfuKxo+Vg413wvGhwD+78=', NULL, 0, 'jose@gmail.com', '', '', 'jose@gmail.com', 0, 1, '2024-11-26 23:28:39.294519'),
(6, 'pbkdf2_sha256$870000$bB2cLybPGSg88btanX4aIY$vEA+DoMMEKp31XmFfyMuzA/bmP7eVMXniJeGnQaM+A0=', NULL, 0, 'gus@gmail.com', '', '', 'gus@gmail.com', 1, 1, '2024-11-27 01:35:46.079576');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(8, 'paginaWeb', 'barbero'),
(9, 'paginaWeb', 'reserva'),
(7, 'paginaWeb', 'servicio'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-11-21 04:17:56.034211'),
(2, 'auth', '0001_initial', '2024-11-21 04:17:56.237111'),
(3, 'admin', '0001_initial', '2024-11-21 04:17:56.287908'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-11-21 04:17:56.293892'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-11-21 04:17:56.301871'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-11-21 04:17:56.350772'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-11-21 04:17:56.370749'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-11-21 04:17:56.384694'),
(9, 'auth', '0004_alter_user_username_opts', '2024-11-21 04:17:56.392572'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-11-21 04:17:56.418503'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-11-21 04:17:56.421495'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-11-21 04:17:56.428475'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-11-21 04:17:56.446428'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-11-21 04:17:56.468369'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-11-21 04:17:56.489313'),
(16, 'auth', '0011_update_proxy_permissions', '2024-11-21 04:17:56.498131'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-11-21 04:17:56.513059'),
(18, 'paginaWeb', '0001_initial', '2024-11-21 04:17:56.597780'),
(19, 'sessions', '0001_initial', '2024-11-21 04:17:56.613659');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('t3f1kbs3xfkfz8i6d3fh7gf37zkk059y', '.eJxVjMsOwiAQRf-FtSHA8HTp3m8gAwNSNTQp7cr479qkC93ec859sYjb2uI2yhInYmcm2el3S5gfpe-A7thvM89zX5cp8V3hBx38OlN5Xg7376DhaN9aWI9EWYaayKrsfQgAggyCUBY0YgbtvLS-CiGCButqkYZAIrmqnGHvD9HUNxI:1tDyiJ:VcNzXNnj-VrlE0Z9VuQsIn1AHMfdjSIw7aw3NNr4CXs', '2024-12-05 04:22:43.431480'),
('vjp6uqovnyzve0bxxt60gl1ooqq7rfdc', '.eJxVy7sOAiEQheF3oTYbZBhgLU18BksywIwQdbMRtzK-u5dsoe35zv9QkZZ7jUvnW2xF7RSoze-WKJ95-sBMpzbRkdPw1RX6cLhSu-zX219bqdd3SDqHYLxLgdGLFHSWdWEqvDWYGTWLleLFj4giIxiQnMCCISxOANTzBc8FNs0:1tG7Ou:cEf9GIy_27u20ODHzQL8uTQyZHiSwRYMY4xuU1OZL20', '2024-12-11 02:03:32.335507');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paginaweb_barbero`
--

CREATE TABLE `paginaweb_barbero` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `especialidad` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `paginaweb_barbero`
--

INSERT INTO `paginaweb_barbero` (`id`, `nombre`, `especialidad`, `user_id`) VALUES
(1, 'jose', 'nose', 5),
(2, 'gus', 'asdas', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paginaweb_reserva`
--

CREATE TABLE `paginaweb_reserva` (
  `id` bigint(20) NOT NULL,
  `fecha` datetime(6) NOT NULL,
  `confirmada` tinyint(1) NOT NULL,
  `barbero_id` bigint(20) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `servicio_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `paginaweb_reserva`
--

INSERT INTO `paginaweb_reserva` (`id`, `fecha`, `confirmada`, `barbero_id`, `cliente_id`, `servicio_id`) VALUES
(1, '2024-11-21 15:33:00.000000', 1, 1, 4, 1),
(2, '2024-11-14 15:10:00.000000', 0, 1, 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paginaweb_servicio`
--

CREATE TABLE `paginaweb_servicio` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` longtext NOT NULL,
  `precio` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `paginaweb_servicio`
--

INSERT INTO `paginaweb_servicio` (`id`, `nombre`, `descripcion`, `precio`) VALUES
(1, 'asicalao', 'dhsaioid', 9999.99);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `paginaweb_barbero`
--
ALTER TABLE `paginaweb_barbero`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indices de la tabla `paginaweb_reserva`
--
ALTER TABLE `paginaweb_reserva`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paginaWeb_reserva_barbero_id_7a1aff2e_fk_paginaWeb_barbero_id` (`barbero_id`),
  ADD KEY `paginaWeb_reserva_cliente_id_643b2f34_fk_auth_user_id` (`cliente_id`),
  ADD KEY `paginaWeb_reserva_servicio_id_b030b1d9_fk_paginaWeb_servicio_id` (`servicio_id`);

--
-- Indices de la tabla `paginaweb_servicio`
--
ALTER TABLE `paginaweb_servicio`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `paginaweb_barbero`
--
ALTER TABLE `paginaweb_barbero`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `paginaweb_reserva`
--
ALTER TABLE `paginaweb_reserva`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `paginaweb_servicio`
--
ALTER TABLE `paginaweb_servicio`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `paginaweb_barbero`
--
ALTER TABLE `paginaweb_barbero`
  ADD CONSTRAINT `paginaWeb_barbero_user_id_102b93d9_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `paginaweb_reserva`
--
ALTER TABLE `paginaweb_reserva`
  ADD CONSTRAINT `paginaWeb_reserva_barbero_id_7a1aff2e_fk_paginaWeb_barbero_id` FOREIGN KEY (`barbero_id`) REFERENCES `paginaweb_barbero` (`id`),
  ADD CONSTRAINT `paginaWeb_reserva_cliente_id_643b2f34_fk_auth_user_id` FOREIGN KEY (`cliente_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `paginaWeb_reserva_servicio_id_b030b1d9_fk_paginaWeb_servicio_id` FOREIGN KEY (`servicio_id`) REFERENCES `paginaweb_servicio` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
