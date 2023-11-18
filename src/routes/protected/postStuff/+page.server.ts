import { db } from "$lib/dbClient";
import { blogs, tags } from "../../../../drizzle/schema";
import { eq, sql, desc } from "drizzle-orm";

export async function load() {
	return {};
}
