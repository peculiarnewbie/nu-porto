import { db } from "$lib/dbClient";
import { blogs } from "../../../drizzle/schema";
import { eq, sql, desc } from "drizzle-orm";

export async function load() {
	const paginatedBlogs = db.select().from(blogs).orderBy(desc(blogs.createdAt)).limit(10);
	const blogsCount = await db.select({ count: sql`COUNT(*)` }).from(blogs);
	return {
		paginatedBlogs: paginatedBlogs,
		blogsCount: blogsCount
	};
}
