PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "__drizzle_migrations" (
				id SERIAL PRIMARY KEY,
				hash text NOT NULL,
				created_at numeric
			);
INSERT INTO __drizzle_migrations VALUES(NULL,'37a60be1e2b6e02aec889c7d69b1a205c85a187a654d3605e5ef52eeee8df6ab',1700047723572);
CREATE TABLE IF NOT EXISTS `blogs` (
	`id` text PRIMARY KEY NOT NULL,
	`title` text NOT NULL,
	`description` text,
	`content` text,
	`image` text,
	`created_at` integer DEFAULT (cast (unixepoch () as int)),
	`updated_at` integer DEFAULT (cast (unixepoch () as int))
);
CREATE TABLE IF NOT EXISTS `projects` (
	`id` text PRIMARY KEY NOT NULL,
	`title` text NOT NULL,
	`repoUrl` text,
	`previewUrl` text,
	`priority` integer,
	`description` text,
	`content` text,
	`images` text,
	`created_at` integer DEFAULT (cast (unixepoch () as int)),
	`updated_at` integer DEFAULT (cast (unixepoch () as int))
);
CREATE TABLE IF NOT EXISTS `tags` (
	`id` text PRIMARY KEY NOT NULL,
	`name` text,
	`type` text
);
INSERT INTO tags VALUES('d8494493-71b6-4a3a-8236-601d9b6cbe1e','React','Tech');
INSERT INTO tags VALUES('7357e3af-41f6-4a71-87b0-fa3a6354c598','Svelte','Tech');
INSERT INTO tags VALUES('3ff40809-8606-4c59-9115-224f649b4ff3','Web','Descriptor');
INSERT INTO tags VALUES('048ce9ce-cbec-4498-8e09-762abda019f5','Game','Descriptor');
INSERT INTO tags VALUES('8105994a-0dec-42e2-8ad6-fa975a77d843','Threlte','Tech');
INSERT INTO tags VALUES('e93e805f-a461-4537-a990-dbea4da09857','Next.js','Tech');
INSERT INTO tags VALUES('fe9f840f-46cf-49cd-a28f-0c73c790ee31','Unity','Tech');
INSERT INTO tags VALUES('45ac17fe-3e18-41b6-a04e-98977b958cfd','Javascript','Tech');
INSERT INTO tags VALUES('8bbebdff-ec5d-4667-97f9-cd17b0124db0','C#','Tech');
INSERT INTO tags VALUES('fa793a4f-a004-438a-a21a-497028f5b4b6','Programmer','Role');
INSERT INTO tags VALUES('e8ad85c6-84ef-493f-aa12-a9f30b3c3f6e','Designer','Role');
CREATE TABLE IF NOT EXISTS `tags_to_blogs` (
	`tag_id` text NOT NULL,
	`blog_id` text NOT NULL,
	PRIMARY KEY(`blog_id`, `tag_id`),
	FOREIGN KEY (`tag_id`) REFERENCES `tags`(`id`) ON UPDATE no action ON DELETE no action,
	FOREIGN KEY (`blog_id`) REFERENCES `blogs`(`id`) ON UPDATE no action ON DELETE no action
);
CREATE TABLE IF NOT EXISTS `tags_to_projects` (
	`tag_id` text NOT NULL,
	`project_id` text NOT NULL,
	PRIMARY KEY(`project_id`, `tag_id`),
	FOREIGN KEY (`tag_id`) REFERENCES `tags`(`id`) ON UPDATE no action ON DELETE no action,
	FOREIGN KEY (`project_id`) REFERENCES `projects`(`id`) ON UPDATE no action ON DELETE no action
);
CREATE UNIQUE INDEX `blogId_idx` ON `blogs` (`id`);
CREATE INDEX `tagName_idx` ON `tags` (`name`);
COMMIT;
