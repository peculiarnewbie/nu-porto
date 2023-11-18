<script lang="ts">
	import type { Projects } from "../../../drizzle/schema";
	import type { homeProjectsType } from "../../routes/+page.server";
	import ProjectItem from "./ProjectItem.svelte";

	export let projects: homeProjectsType[];
</script>

<main class="flex h-[3000px] flex-col pt-24 lg:w-1/2 lg:py-24">
	<p class="text-slate-400">
		{"Hi there. I'm Arif, though my friends call me Bolt (it's long story)."}
	</p>
	<div class="pt-16 lg:pt-24" />
	<div class="flex flex-col gap-4">
		{#each projects as project}
			<ProjectItem {project} />
		{/each}
	</div>
</main>
