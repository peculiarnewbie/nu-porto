import { db } from "$lib/dbClient";
import { blogs, tags } from "../../../../drizzle/schema";
import { eq, sql, desc } from "drizzle-orm";

export async function load() {
	const pulledTags = db.select().from(tags).orderBy(tags.name);

	console.log("aloo");
	return {
		tags: pulledTags
	};
}
