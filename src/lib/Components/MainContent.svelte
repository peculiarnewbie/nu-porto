<script lang="ts">
	import type { Projects } from "../../../drizzle/schema";
	import type { homeProjectsType } from "../../routes/+page.server";
	import ProjectItem from "./ProjectItem.svelte";

	export let projects: homeProjectsType[];
</script>

<main class="flex min-h-screen flex-col pt-24 lg:w-1/2 lg:py-24">
	<p class="text-slate-400">
		{"Hi there. I'm Arif, though my friends call me Bolt (it's a long story)"}
	</p>
	<p class="mt-4 text-slate-400">
		{"I've been creating games since 2017 and focused on it while studying CompSci. In mid 2023 I tried creating an actual web project and immediately fell in love with frontend development"}
	</p>
	<div class="pt-16 lg:pt-24" />
	<div class="flex flex-col gap-12">
		{#each projects as project}
			<ProjectItem {project} />
		{/each}
	</div>
	<div class="py-16 text-sm text-slate-400 sm:pb-0">
		{"This website was built using the"}
		<span class="Lib"><a href="https://kit.svelte.dev/" target="_blank">Sveltekit</a></span>
		{"fullstack framework, "}
		<span class="Lib"><a href="https://tailwindcss.com/" target="_blank">Tailwind CSS</a></span>
		{"for styling, database managed using "}
		<span class="Lib"><a href="https://turso.tech/" target="_blank">Turso</a></span>
		{"and "}
		<span class="Lib"><a href="https://orm.drizzle.team/" target="_blank">Drizzle ORM</a></span
		>{", and hosted on "}
		<span class="Lib"><a href="https://vercel.com/" target="_blank">Vercel</a></span
		>{". Design is heavily inspired by "}
		<span class="Lib"
			><a href="https://brittanychiang.com/" target="_blank">{"Brittany Chiang"}</a></span
		>
		{"'s portofolio"}
	</div>
</main>

<style>
	.Lib {
		color: rgb(226 232 240 / var(--tw-text-opacity));
		font-weight: 500;
	}

	.Lib:hover {
		color: rgb(34 211 238 / var(--tw-text-opacity));
	}
</style>
