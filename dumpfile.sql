PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
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
INSERT INTO projects VALUES('8b6cbcb0-b88d-4c03-96bd-3fe6579f67cf','Save To Obsidian','https://github.com/peculiarnewbie/Save-to-Obsidian','https://chromewebstore.google.com/detail/save-to-obsidian/oadbfjklomnnpchhbgchohhejkiibifm',8,'An unnoficial chrome extension to precisely get data from webpages. intended to be used with Obsidian.md properties','','https://raw.githubusercontent.com/peculiarnewbie/easyhost/main/nu-porto/Youtube%20Page.webp',1700283714,1700283714);
INSERT INTO projects VALUES('6345ac7b-cb29-40b7-9971-69a30e6b2cb2','AeroBuddy','https://github.com/peculiarnewbie/AeroBuddy','https://aerobuddy-ai.com/',7,'A Landing page and Authentication app for Aerobuddy AI. ','','https://raw.githubusercontent.com/peculiarnewbie/easyhost/main/nu-porto/Aerobuddy%20ss.webp',1700284558,1700284558);
INSERT INTO projects VALUES('c7206462-000c-4c8b-a811-43bee1e75009','HyperPong','https://github.com/AllHeartNoSkill/HyperPong','https://peculiarnewbie.itch.io/hyperpong',7,'A game started as a project for Game Jam +. A pong clone with dynamic levels and powers','','https://raw.githubusercontent.com/peculiarnewbie/easyhost/main/nu-porto/hyperPong.webp',1700291693,1700291693);
INSERT INTO projects VALUES('7d6ace73-27c7-4e6e-ac40-05819692ec4b','Wonderful Indonesia','https://github.com/peculiarnewbie/wonderful-indonesia','https://wonderful-indonesia-rho.vercel.app/',6,'3D Population data visualization created as an entry for the Threlte hackaton where it won the 2nd place award','','https://raw.githubusercontent.com/peculiarnewbie/easyhost/main/nu-porto/Wonderful%20Indonesia.webp',1700292533,1700292533);
INSERT INTO projects VALUES('961496d3-e07e-47b3-b1e6-d011db4e3c6d','Calamity','https://github.com/peculiarnewbie/Calamity','https://peculiarnewbie.itch.io/calamity',5,'A VR platformer demo where you can switch camera modes in realtime to test third-person-perspectives','','https://raw.githubusercontent.com/peculiarnewbie/easyhost/main/nu-porto/calamity.webp',1700298226,1700298226);
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
INSERT INTO tags VALUES('8b807666-3041-4360-8bbf-f42a97e59932','Chrome API','Tech');
INSERT INTO tags VALUES('cb2dbdfe-d3e3-480f-ae2b-4a319b35863e','Blender','Tech');
INSERT INTO tags VALUES('6c4f7b23-a0d2-4b20-82d8-6d984a7b5f24','VR','Tech');
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
INSERT INTO tags_to_projects VALUES('3ff40809-8606-4c59-9115-224f649b4ff3','8b6cbcb0-b88d-4c03-96bd-3fe6579f67cf');
INSERT INTO tags_to_projects VALUES('45ac17fe-3e18-41b6-a04e-98977b958cfd','8b6cbcb0-b88d-4c03-96bd-3fe6579f67cf');
INSERT INTO tags_to_projects VALUES('7357e3af-41f6-4a71-87b0-fa3a6354c598','8b6cbcb0-b88d-4c03-96bd-3fe6579f67cf');
INSERT INTO tags_to_projects VALUES('3ff40809-8606-4c59-9115-224f649b4ff3','6345ac7b-cb29-40b7-9971-69a30e6b2cb2');
INSERT INTO tags_to_projects VALUES('45ac17fe-3e18-41b6-a04e-98977b958cfd','6345ac7b-cb29-40b7-9971-69a30e6b2cb2');
INSERT INTO tags_to_projects VALUES('e93e805f-a461-4537-a990-dbea4da09857','6345ac7b-cb29-40b7-9971-69a30e6b2cb2');
INSERT INTO tags_to_projects VALUES('d8494493-71b6-4a3a-8236-601d9b6cbe1e','6345ac7b-cb29-40b7-9971-69a30e6b2cb2');
INSERT INTO tags_to_projects VALUES('8b807666-3041-4360-8bbf-f42a97e59932','8b6cbcb0-b88d-4c03-96bd-3fe6579f67cf');
INSERT INTO tags_to_projects VALUES('048ce9ce-cbec-4498-8e09-762abda019f5','c7206462-000c-4c8b-a811-43bee1e75009');
INSERT INTO tags_to_projects VALUES('cb2dbdfe-d3e3-480f-ae2b-4a319b35863e','c7206462-000c-4c8b-a811-43bee1e75009');
INSERT INTO tags_to_projects VALUES('8bbebdff-ec5d-4667-97f9-cd17b0124db0','c7206462-000c-4c8b-a811-43bee1e75009');
INSERT INTO tags_to_projects VALUES('fe9f840f-46cf-49cd-a28f-0c73c790ee31','c7206462-000c-4c8b-a811-43bee1e75009');
INSERT INTO tags_to_projects VALUES('3ff40809-8606-4c59-9115-224f649b4ff3','7d6ace73-27c7-4e6e-ac40-05819692ec4b');
INSERT INTO tags_to_projects VALUES('45ac17fe-3e18-41b6-a04e-98977b958cfd','7d6ace73-27c7-4e6e-ac40-05819692ec4b');
INSERT INTO tags_to_projects VALUES('7357e3af-41f6-4a71-87b0-fa3a6354c598','7d6ace73-27c7-4e6e-ac40-05819692ec4b');
INSERT INTO tags_to_projects VALUES('8105994a-0dec-42e2-8ad6-fa975a77d843','7d6ace73-27c7-4e6e-ac40-05819692ec4b');
INSERT INTO tags_to_projects VALUES('048ce9ce-cbec-4498-8e09-762abda019f5','961496d3-e07e-47b3-b1e6-d011db4e3c6d');
INSERT INTO tags_to_projects VALUES('cb2dbdfe-d3e3-480f-ae2b-4a319b35863e','961496d3-e07e-47b3-b1e6-d011db4e3c6d');
INSERT INTO tags_to_projects VALUES('8bbebdff-ec5d-4667-97f9-cd17b0124db0','961496d3-e07e-47b3-b1e6-d011db4e3c6d');
INSERT INTO tags_to_projects VALUES('fe9f840f-46cf-49cd-a28f-0c73c790ee31','961496d3-e07e-47b3-b1e6-d011db4e3c6d');
INSERT INTO tags_to_projects VALUES('6c4f7b23-a0d2-4b20-82d8-6d984a7b5f24','961496d3-e07e-47b3-b1e6-d011db4e3c6d');
CREATE UNIQUE INDEX `blogId_idx` ON `blogs` (`id`);
CREATE INDEX `tagName_idx` ON `tags` (`name`);
COMMIT;
