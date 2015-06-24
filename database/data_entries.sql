--
-- Volcado de datos para la tabla `role`
--

INSERT INTO `role` (`id`, `date_created`, `date_deleted`, `name`, `description`) VALUES
(1, '2015-03-10 14:21:17', NULL, 'Administrador', '1');


--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `date_created`, `date_deleted`, `id_role`, `password`, `password_question`, `password_answer`, `first_name`, `last_name`, `sex`, `email`, `phone`, `birthday`, `address`, `description`, `id_country`, `id_state`, `id_city`, `zip_code`) VALUES
(1, '2015-03-10 14:21:17', NULL, 1, 'system', '', '', 'System', 'System', '', 'info@system.com', '', NULL, '', '', NULL, NULL, NULL, '5152'),
(2, '2015-03-10 14:21:17', NULL, 1, 'test', '', '', 'Administrator', 'Administrator', '', 'admin@system.com', '', '2015-03-02 00:00:00', '', '', NULL, NULL, NULL, '');