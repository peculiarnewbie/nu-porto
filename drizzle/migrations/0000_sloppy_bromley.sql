CREATE TABLE `blogs` (
	`id` text PRIMARY KEY NOT NULL,
	`title` text NOT NULL,
	`description` text,
	`content` text,
	`image` text,
	`created_at` integer DEFAULT (cast (unixepoch () as int)),
	`updated_at` integer DEFAULT (cast (unixepoch () as int))
);
--> statement-breakpoint
CREATE TABLE `projects` (
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
--> statement-breakpoint
CREATE TABLE `tags` (
	`id` text PRIMARY KEY NOT NULL,
	`name` text,
	`type` text
);
--> statement-breakpoint
CREATE TABLE `tags_to_blogs` (
	`tag_id` integer NOT NULL,
	`blog_id` integer NOT NULL,
	PRIMARY KEY(`blog_id`, `tag_id`),
	FOREIGN KEY (`tag_id`) REFERENCES `tags`(`id`) ON UPDATE no action ON DELETE no action,
	FOREIGN KEY (`blog_id`) REFERENCES `blogs`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE TABLE `tags_to_projects` (
	`tag_id` integer NOT NULL,
	`project_id` integer NOT NULL,
	PRIMARY KEY(`project_id`, `tag_id`),
	FOREIGN KEY (`tag_id`) REFERENCES `tags`(`id`) ON UPDATE no action ON DELETE no action,
	FOREIGN KEY (`project_id`) REFERENCES `projects`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE UNIQUE INDEX `blogId_idx` ON `blogs` (`id`);--> statement-breakpoint
CREATE INDEX `tagName_idx` ON `tags` (`name`);