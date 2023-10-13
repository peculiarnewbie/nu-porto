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

export const tags = sqliteTable('tags', {
	id: text('id').notNull().primaryKey(),
	name: text('name')
}, (tags) => ({
	nameIdx: index("tagName_idx").on(tags.name)
}));

export const tagsRelations = relations(tags, ({ many }) => ({
	tagsToBlogs:many(tagsToBlogs)
}))

export const blogs = sqliteTable('blogs', {
	id: text('id').notNull().primaryKey(),
	title: text('title').notNull(),
	description: text('descrioption'),
	image: text('image'),
	createdAt: integer("created_at").default(sql`(cast (unixepoch () as int))`),
    updatedAt: integer("updated_at").default(sql`(cast (unixepoch () as int))`),
}, (blogs) => ({
	idIdx: uniqueIndex('blogId_idx').on(blogs.id),
}))

export const blogsRelations = relations(blogs, ({ many }) => ({
	tagsToBlogs:many(tagsToBlogs)
}))

export const tagsToBlogs = sqliteTable('tags_to_blogs', {
		tagId: integer('tag_id').notNull().references(() => tags.id),
		blogId: integer('blog_id').notNull().references(() => blogs.id),
	}, (t) => ({
		pk: primaryKey(t.tagId, t.blogId),
	}),
);

export const tagsToBlogsRelations = relations(tagsToBlogs, ({ one }) => ({
	blog: one(blogs, {
		fields: [tagsToBlogs.blogId],
		references: [blogs.id],
	}),
	tag: one(tags, {
		fields: [tagsToBlogs.tagId],
		references: [tags.id],
	}),
}));