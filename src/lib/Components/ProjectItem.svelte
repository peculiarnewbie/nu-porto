<script lang="ts">
	import type { Projects, tags, tagsToProjects } from "../../../drizzle/schema";
	import type { homeProjectsType } from "../../routes/+page.server";

	export let project: homeProjectsType;
</script>

<div class="flex h-fit flex-col gap-4 text-left sm:flex-row-reverse sm:gap-6">
	<div class="flex flex-col gap-2 sm:basis-3/4">
		<p class="font-medium text-slate-200">{project.title}</p>
		<p class="text-sm text-slate-400">{project.description}</p>
		<div class="flex flex-wrap gap-2 text-sm font-medium">
			{#each project.tagsToProjects as relation}
				<div class="w-fit rounded-md bg-cyan-600/20 p-2 text-cyan-300">
					<p>{relation.tag.name}</p>
				</div>
			{/each}
		</div>
	</div>
	<div
		class="flex h-full overflow-hidden sm:max-w-[200px] sm:basis-1/4 sm:translate-y-1 sm:flex-col"
	>
		<img
			class="w-full max-w-[200px] rounded-md border-2 border-slate-500"
			src={project.images}
			alt={`${project.title} image`}
		/>
		<div
			class="my-auto flex h-full w-full flex-col items-center justify-center gap-2 pt-2 sm:flex-row sm:items-start"
		>
			<a href={project.repoUrl} target="_blank" class="rounded-md p-2 hover:bg-slate-200/20"
				><svg
					xmlns="http://www.w3.org/2000/svg"
					width="24"
					height="24"
					viewBox="0 0 24 24"
					fill="none"
					stroke="#e2e8f0"
					stroke-width="2"
					stroke-linecap="round"
					stroke-linejoin="round"
					class="lucide lucide-github"
					><path
						d="M15 22v-4a4.8 4.8 0 0 0-1-3.5c3 0 6-2 6-5.5.08-1.25-.27-2.48-1-3.5.28-1.15.28-2.35 0-3.5 0 0-1 0-3 1.5-2.64-.5-5.36-.5-8 0C6 2 5 2 5 2c-.3 1.15-.3 2.35 0 3.5A5.403 5.403 0 0 0 4 9c0 3.5 3 5.5 6 5.5-.39.49-.68 1.05-.85 1.65-.17.6-.22 1.23-.15 1.85v4"
					/><path d="M9 18c-4.51 2-5-2-7-2" /></svg
				></a
			>
			<a href={project.previewUrl} target="_blank" class="rounded-md p-2 hover:bg-slate-200/20"
				><svg
					xmlns="http://www.w3.org/2000/svg"
					width="24"
					height="24"
					viewBox="0 0 24 24"
					fill="none"
					stroke="#e2e8f0"
					stroke-width="2"
					stroke-linecap="round"
					stroke-linejoin="round"
					class="lucide lucide-link"
					><path d="M10 13a5 5 0 0 0 7.54.54l3-3a5 5 0 0 0-7.07-7.07l-1.72 1.71" /><path
						d="M14 11a5 5 0 0 0-7.54-.54l-3 3a5 5 0 0 0 7.07 7.07l1.71-1.71"
					/></svg
				></a
			>
		</div>
	</div>
</div>
