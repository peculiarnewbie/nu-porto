import { db } from "$lib/dbClient";
import {
	tagsToProjects,
	projects,
	type insertTagsToProjects
} from "../../../../../drizzle/schema.js";
import { json } from "@sveltejs/kit";

export async function POST({ request }) {
	const data = await request.json();

	let tagProjectRelations: insertTagsToProjects[] = [];
	for (let i = 0; i < data.tags.length; i++) {
		tagProjectRelations.push({ tagId: data.tags[i], projectId: data.project.id });
	}

	const result = await db.insert(projects).values(data.project).returning().get();
	const relations = await db
		.insert(tagsToProjects)
		.values([...tagProjectRelations])
		.returning()
		.get();

	return json({ result }, { status: 200 });
}
