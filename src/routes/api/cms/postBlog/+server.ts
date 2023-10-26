import { db } from "$lib/dbClient";
import { blogs } from "../../../../../drizzle/schema.js";
import { json } from "@sveltejs/kit";

export async function POST({ request, cookies }) {
	const blog = await request.json();

	// console.log(content);

	const result = await db.insert(blogs).values(blog).returning().get();

	return json({ result }, { status: 201 });
}
