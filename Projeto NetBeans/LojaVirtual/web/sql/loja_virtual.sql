CREATE DATABASE loja_virtual;
USE loja_virtual;

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `fornecedor` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `pedido` (
  `id` int(11) NOT NULL,
  `clienteId` int(11) DEFAULT NULL,
  `data` date NOT NULL,
  `total` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `produto` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` text DEFAULT NULL,
  `preco` decimal(10,2) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `categoriaId` int(11) DEFAULT NULL,
  `fornecedorId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clienteId` (`clienteId`);

ALTER TABLE `produto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoriaId` (`categoriaId`),
  ADD KEY `fornecedorId` (`fornecedorId`);

ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `fornecedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `produto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`clienteId`) REFERENCES `cliente` (`id`);

ALTER TABLE `produto`
  ADD CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`categoriaId`) REFERENCES `categoria` (`id`),
  ADD CONSTRAINT `produto_ibfk_2` FOREIGN KEY (`fornecedorId`) REFERENCES `fornecedor` (`id`);
COMMIT;