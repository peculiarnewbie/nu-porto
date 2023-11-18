import "dotenv/config";
import { db } from "$lib/dbClient";
import { eq } from "drizzle-orm";
import { analytics, type insertAnalytics } from "../../../../drizzle/schema.js";
import { json } from "@sveltejs/kit";

export async function POST({ request, cookies }) {
	if (process.env.DEV) return;

	const toPush = await request.json();

	const data: insertAnalytics = {
		id: toPush.timeZone + toPush.month,
		location: toPush.timeZone,
		month: toPush.month
	};

	// console.log(content);

	const result = await db.select().from(analytics).where(eq(analytics.id, data.id));

	if (result.length == 0) {
		await db.insert(analytics).values({
			id: toPush.timeZone + toPush.month,
			location: toPush.timeZone,
			month: toPush.month,
			qty: 1
		});
	} else {
		if (result[0].qty) {
			const res = await db.update(analytics).set({ qty: result[0].qty + 1 });
			console.log(res);
		}
	}

	return json({ result }, { status: 201 });
}
