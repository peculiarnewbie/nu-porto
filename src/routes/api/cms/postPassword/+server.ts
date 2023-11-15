import { db } from "$lib/dbClient";
import { blogs } from "../../../../../drizzle/schema.js";
import { json } from "@sveltejs/kit";
import "dotenv/config";

export async function POST({ request }) {
	const pass = (await request.json()).pass;

	let statusCode = 401;
	if (pass == process.env.BOLT_PASSWORD) {
		statusCode = 200;
	}

	return json({ status: statusCode });
}
