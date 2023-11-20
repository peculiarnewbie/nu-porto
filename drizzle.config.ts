import type { Config } from "drizzle-kit";
// import { env } from "$env/static/private";

export default {
	schema: "./drizzle/schema.ts",
	out: "./drizzle/migrations",
	driver: "turso",
	dbCredentials: {
		url: process.env.TURSO_DB_URL as string,
		authToken: process.env.TURSO_DB_AUTH_TOKEN as string
	}
} satisfies Config;
