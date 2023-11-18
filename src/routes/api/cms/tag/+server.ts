import { db } from "$lib/dbClient";
import { tags, tagsToProjects } from "../../../../../drizzle/schema.js";
import { json } from "@sveltejs/kit";

export async function POST({ request }) {
	const tag = await request.json();

	// console.log(content);

	const result = await db.insert(tags).values(tag).returning().get();

	return json({ result }, { status: 200 });
}

export async function GET({ request }) {
	const result = await db.select().from(tags).orderBy(tags.type, tags.name);

	return json({ result }, { status: 200 });
}
