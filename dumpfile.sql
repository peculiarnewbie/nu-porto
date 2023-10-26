PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS `blogs` (
	`id` text PRIMARY KEY NOT NULL,
	`title` text NOT NULL,
	"description" text,
	`image` text,
	`created_at` integer DEFAULT (cast (unixepoch () as int)),
	`updated_at` integer DEFAULT (cast (unixepoch () as int))
, `content` text);
INSERT INTO blogs VALUES('1','we gud','test blog 1',NULL,1697207173,1697207173,NULL);
CREATE TABLE IF NOT EXISTS `tags` (
	`id` text PRIMARY KEY NOT NULL,
	`name` text
);
INSERT INTO tags VALUES('1','test');
CREATE TABLE IF NOT EXISTS `tags_to_blogs` (
	`tag_id` integer NOT NULL,
	`blog_id` integer NOT NULL,
	PRIMARY KEY(`blog_id`, `tag_id`),
	FOREIGN KEY (`tag_id`) REFERENCES `tags`(`id`) ON UPDATE no action ON DELETE no action,
	FOREIGN KEY (`blog_id`) REFERENCES `blogs`(`id`) ON UPDATE no action ON DELETE no action
);
INSERT INTO tags_to_blogs VALUES(1,1);
CREATE TABLE IF NOT EXISTS "__drizzle_migrations" (
				id SERIAL PRIMARY KEY,
				hash text NOT NULL,
				created_at numeric
			);
CREATE TABLE IF NOT EXISTS libsql_wasm_func_table (name text PRIMARY KEY, body text) WITHOUT ROWID;
CREATE UNIQUE INDEX `blogId_idx` ON `blogs` (`id`);
CREATE INDEX `tagName_idx` ON `tags` (`name`);
COMMIT;
