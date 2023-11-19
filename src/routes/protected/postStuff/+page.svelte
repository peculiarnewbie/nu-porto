<script lang="ts">
	import "../../../app.css";
	import {
		postType,
		tagType,
		type postTypeKeys,
		type tagTypeKeys
	} from "$lib/Components/CMS/types";
	import type { Tags, insertTags, insertProjects } from "../../../../drizzle/schema";
	import { v4 as uuidv4 } from "uuid";
	import { onMount } from "svelte";
	let postedData: { key: any; value: any }[];

	let currentPostType: postTypeKeys = postType.tag;

	// ============= Tag Stuff ==============

	let tagTypes = Object.values(tagType);
	let selectedTagType = 0;
	let pulledTags: Tags[];
	let selectedTags: boolean[];

	const getTag = async () => {
		pulledTags = [];
		selectedTags = [];

		const response = await fetch("../api/cms/tag", {
			method: "GET"
		});
		const res = (await response.json()).result;
		pulledTags = res;
		res.forEach((tag: any) => {
			selectedTags.push(false);
		});
		console.log(res);
	};

	const postTag = async (e: SubmitEvent) => {
		e.preventDefault();
		//@ts-ignore
		const formData = new FormData(e.target);
		const data = {} as insertTags;
		for (let field of formData) {
			const [key, value] = field;
			//@ts-ignore
			data[key] = value;
		}
		data.id = uuidv4();

		console.log(data);

		const response = await fetch("../api/cms/tag", {
			method: "POST",
			body: JSON.stringify(data),
			headers: {
				"Content-Type": "application/json"
			}
		});
		const res = (await response.json()).result;
		let i = 0;
		postedData = [];
		for (let key in res) {
			postedData[i] = { key: key, value: res[key] };
			i++;
		}
		console.log(postedData);
	};

	const switchTagType = (index: number) => {
		selectedTagType = index;
	};

	// ============= Project Stuff ==============

	const postProject = async (e: SubmitEvent) => {
		e.preventDefault();
		//@ts-ignore
		const formData = new FormData(e.target);
		let data: { project: insertProjects; tags: string[] } = {
			project: {} as insertProjects,
			tags: []
		};
		for (let field of formData) {
			const [key, value] = field;
			//@ts-ignore
			data.project[key] = value;
		}
		data.project.id = uuidv4();

		for (let i = 0; i < selectedTags.length; i++) {
			if (selectedTags[i]) {
				data.tags.push(pulledTags[i].id);
			}
		}

		console.log(data);

		const response = await fetch("../api/cms/project", {
			method: "POST",
			body: JSON.stringify(data),
			headers: {
				"Content-Type": "application/json"
			}
		});
		const res = (await response.json()).result;
		let i = 0;
		postedData = [];
		for (let key in res) {
			postedData[i] = { key: key, value: res[key] };
			i++;
		}
		console.log(postedData);
	};

	const switchProjectTag = (e: Event, index: number) => {
		e.preventDefault();
		selectedTags[index] = !selectedTags[index];
	};

	onMount(() => {
		getTag();
	});
</script>

<div class="text-slate-200">you're in</div>

<div class="py-24 text-slate-900">
	<div class="flex pl-4 text-slate-200">
		{#each Object.values(postType) as type}
			<button
				on:click={() => {
					currentPostType = type;
				}}
				class={`rounded-t-lg py-2 text-center transition-all ${
					currentPostType == type ? "bg-neutral-900 px-10" : "mt-1 bg-slate-800 px-6"
				}`}
			>
				<p>
					{type}
				</p>
			</button>
		{/each}
	</div>
	<div class="flex flex-col gap-6 rounded-md bg-neutral-900 p-2">
		<!--========== Tag Form ==========-->
		{#if currentPostType == postType.tag}
			<form id="tagForm" class="flex w-full flex-col gap-4 p-2" on:submit={postTag}>
				<div class="flex flex-col gap-1">
					<p class="text-slate-200">Title</p>
					<input class="rounded-md p-2" type="text" name="name" />
				</div>
				<div class="flex flex-col gap-1">
					<p class="text-slate-200">Type</p>
					{#if selectedTagType == -1}
						<div class="flex gap-2 text-slate-200">
							{#each tagTypes as type, index}
								<button
									on:click={(e) => switchTagType(index)}
									class="rounded-md bg-slate-800 p-2 hover:bg-slate-600"
								>
									<p>{type}</p>
								</button>
							{/each}
						</div>
					{:else}
						<button
							on:click={(e) => switchTagType(-1)}
							class="flex w-32 justify-center rounded-md bg-slate-800 p-2 text-slate-200 hover:bg-slate-600"
						>
							<input
								class="pointer-events-none w-full bg-transparent text-center"
								type="text"
								name="type"
								value={tagTypes[selectedTagType]}
							/>
						</button>
					{/if}
				</div>
				<button class="rounded-md bg-slate-200 p-2"> Post Tag </button>
			</form>
			<!--========== Project Form ==========-->
		{:else if currentPostType == postType.project}
			<form id="projectForm" class="flex w-full flex-col gap-4 p-2" on:submit={postProject}>
				<div class="flex flex-col gap-1">
					<p class="text-slate-200">Name</p>
					<input class="rounded-md p-2" type="text" name="title" />
				</div>
				<div class="flex flex-col gap-1">
					<p class="text-slate-200">Repo URL</p>
					<input class="rounded-md p-2" type="text" name="repoUrl" />
				</div>
				<div class="flex flex-col gap-1">
					<p class="text-slate-200">Preview URL</p>
					<input class="rounded-md p-2" type="text" name="previewUrl" />
				</div>
				<div class="flex flex-col gap-1">
					<p class="text-slate-200">Priority</p>
					<input class="rounded-md p-2" type="number" name="priority" />
				</div>
				<div class="flex flex-col gap-1">
					<p class="text-slate-200">Description</p>
					<input class="rounded-md p-2" type="text" name="description" />
				</div>
				<div class="flex flex-col gap-1">
					<p class="text-slate-200">Content</p>
					<input class="rounded-md p-2" type="text" name="content" />
				</div>
				<div class="flex flex-col gap-1">
					<p class="text-slate-200">Images</p>
					<input class="rounded-md p-2" type="text" name="images" />
				</div>
				<div class="flex flex-col gap-1">
					<p class="text-slate-200">Type</p>
					<div class="flex flex-wrap gap-2 text-slate-200">
						{#each pulledTags as tag, index}
							<button
								on:click={(e) => switchProjectTag(e, index)}
								class={`rounded-md border-2 p-2 hover:bg-slate-600 ${
									selectedTags[index]
										? "border-white bg-slate-700"
										: "border-transparent bg-slate-800"
								}`}
							>
								<p>{tag.name}</p>
							</button>
						{/each}
					</div>
				</div>
				<button class="rounded-md bg-slate-200 p-2" type="submit"> Post Project </button>
			</form>
		{/if}
		{#if postedData}
			{#each postedData as data}
				<div class="text-white">{`${data.key}: ${data.value}`}</div>
			{/each}
		{/if}
	</div>
</div>
