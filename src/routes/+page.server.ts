import { db } from "$lib/dbClient";
import { QueryBuilder } from "drizzle-orm/mysql-core";
import { blogs, projects } from "../../drizzle/schema";
import { desc, eq, sql } from "drizzle-orm";

export const prerender = true;

const homeProjectsQuery = db.query.projects.findMany({
	columns: {
		createdAt: false,
		updatedAt: false,
		content: false
	},
	orderBy: [desc(projects.priority), projects.title],
	limit: 5,
	with: {
		tagsToProjects: {
			columns: {},
			with: {
				tag: true
			}
		}
	}
});

export type homeProjectsType = Awaited<typeof homeProjectsQuery>[0];

export async function load() {
	// const paginatedBlogs = db.select().from(blogs).orderBy(blogs.createdAt).limit(10);
	// const blogsCount = await db.select({ count: sql`COUNT(*)` }).from(blogs);
	// return {
	// 	paginatedBlogs: paginatedBlogs,
	// 	blogsCount: blogsCount
	// };

	// const homeProjects = {} as homeProjectsType;
	const homeProjects = await homeProjectsQuery;

	return {
		projects: homeProjects
	};
}
