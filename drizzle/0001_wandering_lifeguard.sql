CREATE TABLE `workspace_snapshots` (
	`id` int AUTO_INCREMENT NOT NULL,
	`ownerId` int NOT NULL,
	`payload` text NOT NULL,
	`createdAt` timestamp NOT NULL DEFAULT (now()),
	`updatedAt` timestamp NOT NULL DEFAULT (now()) ON UPDATE CURRENT_TIMESTAMP,
	CONSTRAINT `workspace_snapshots_id` PRIMARY KEY(`id`),
	CONSTRAINT `workspace_snapshots_owner_id_idx` UNIQUE(`ownerId`)
);
