import { relations, sql } from "drizzle-orm";
import {
	index,
	integer,
	primaryKey,
	real,
	sqliteTable,
	text,
	uniqueIndex
} from "drizzle-orm/sqlite-core";

export const tags = sqliteTable(
	"tags",
	{
		id: text("id").notNull().primaryKey(),
		name: text("name"),
		type: text("type")
	},
	(tags) => ({
		nameIdx: index("tagName_idx").on(tags.name)
	})
);

export const tagsRelations = relations(tags, ({ many }) => ({
	tagsToBlogs: many(tagsToBlogs),
	tagsToProjects: many(tagsToProjects)
}));

export const blogs = sqliteTable(
	"blogs",
	{
		id: text("id").notNull().primaryKey(),
		title: text("title").notNull(),
		description: text("description"),
		content: text("content"),
		image: text("image"),
		createdAt: integer("created_at").default(sql`(cast (unixepoch () as int))`),
		updatedAt: integer("updated_at").default(sql`(cast (unixepoch () as int))`)
	},
	(blogs) => ({
		idIdx: uniqueIndex("blogId_idx").on(blogs.id)
	})
);

export const blogsRelations = relations(blogs, ({ many }) => ({
	tagsToBlogs: many(tagsToBlogs)
}));

export const tagsToBlogs = sqliteTable(
	"tags_to_blogs",
	{
		tagId: integer("tag_id")
			.notNull()
			.references(() => tags.id),
		blogId: integer("blog_id")
			.notNull()
			.references(() => blogs.id)
	},
	(t) => ({
		pk: primaryKey(t.tagId, t.blogId)
	})
);

export const tagsToBlogsRelations = relations(tagsToBlogs, ({ one }) => ({
	blog: one(blogs, {
		fields: [tagsToBlogs.blogId],
		references: [blogs.id]
	}),
	tag: one(tags, {
		fields: [tagsToBlogs.tagId],
		references: [tags.id]
	})
}));

export const projects = sqliteTable("projects", {
	id: text("id").notNull().primaryKey(),
	title: text("title").notNull(),
	repoUrl: text("repoUrl"),
	previewUrl: text("previewUrl"),
	priority: integer("priority"),
	description: text("description"),
	content: text("content"),
	images: text("images"),
	createdAt: integer("created_at").default(sql`(cast (unixepoch () as int))`),
	updatedAt: integer("updated_at").default(sql`(cast (unixepoch () as int))`)
});

export const projectsRelations = relations(projects, ({ many }) => ({
	tagsToProjects: many(tagsToProjects)
}));

export const tagsToProjects = sqliteTable(
	"tags_to_projects",
	{
		tagId: integer("tag_id")
			.notNull()
			.references(() => tags.id),
		projectId: integer("project_id")
			.notNull()
			.references(() => projects.id)
	},
	(t) => ({
		pk: primaryKey(t.tagId, t.projectId)
	})
);

export const tagsToProjectsRelations = relations(tagsToProjects, ({ one }) => ({
	project: one(projects, {
		fields: [tagsToProjects.projectId],
		references: [projects.id]
	}),
	tag: one(tags, {
		fields: [tagsToProjects.tagId],
		references: [tags.id]
	})
}));

export type Tags = typeof tags.$inferSelect;
export type insertTags = typeof tags.$inferInsert;

export type Blogs = typeof blogs.$inferSelect;
export type insertBlogs = typeof blogs.$inferInsert;

export type Projects = typeof projects.$inferSelect;
export type insertProjects = typeof projects.$inferInsert;
