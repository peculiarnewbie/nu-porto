<script lang="ts">
	import type { Projects, tags, tagsToProjects } from "../../../drizzle/schema";
	import type { homeProjectsType } from "../../routes/+page.server";

	export let project: homeProjectsType;
</script>

<div class="flex gap-4">
	<div class=" max-w-[200px] basis-1/3 overflow-hidden">
		<img
			class="w-full rounded-md border-2 border-slate-500"
			src={project.images}
			alt={`${project.title} image`}
		/>
	</div>
	<div class="flex basis-3/4 flex-col">
		<p class="text-slate-200">{project.title}</p>
		<p class="text-sm text-slate-400">{project.description}</p>
		<div class="flex flex-wrap gap-2 text-sm font-medium">
			{#each project.tagsToProjects as relation}
				<div class="w-fit rounded-md bg-cyan-600/20 p-2 text-cyan-300">
					<p>{relation.tag.name}</p>
				</div>
			{/each}
		</div>
	</div>
</div>
