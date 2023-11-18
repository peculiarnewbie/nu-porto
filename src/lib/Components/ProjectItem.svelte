<script lang="ts">
	import type { Projects, tags, tagsToProjects } from "../../../drizzle/schema";
	import type { homeProjectsType } from "../../routes/+page.server";

	export let project: homeProjectsType;
</script>

<div class="flex h-fit flex-col gap-4 sm:flex-row-reverse sm:gap-6">
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
	<div class=" h-fit max-w-[200px] overflow-hidden sm:basis-1/4 sm:translate-y-1">
		<img
			class="w-full rounded-md border-2 border-slate-500"
			src={project.images}
			alt={`${project.title} image`}
		/>
	</div>
</div>
