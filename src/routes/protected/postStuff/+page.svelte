<script lang="ts">
	import "../../../app.css";
	import { postType, tagType, type tagTypeKeys } from "$lib/Components/CMS/types";
	import type { Tags, insertTags } from "../../../../drizzle/schema";
	import { v4 as uuidv4 } from "uuid";

	let postedData: { id: string; name: string; type: tagTypeKeys };

	let tagTypes = Object.values(tagType);
	let selectedTagType = 0;

	const postTag = async (e: SubmitEvent) => {
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

		const response = await fetch("../api/cms/postTag", {
			method: "POST",
			body: JSON.stringify(data),
			headers: {
				"Content-Type": "application/json"
			}
		});
		const res = await response.json();
		postedData = res.result;
		console.log(postedData);
	};

	const switchTagType = (e: Event) => {
		e.preventDefault();
		if (selectedTagType == 0) selectedTagType = 1;
		else selectedTagType = 0;
	};
</script>

<div class="text-slate-200">you're in</div>

<div class="py-24 text-slate-900">
	<form class="flex w-52 flex-col gap-4" on:submit={postTag}>
		<div class="flex flex-col gap-1">
			<p class="text-slate-200">Name</p>
			<input class="rounded-md p-2" type="text" name="name" />
		</div>
		<div class="flex flex-col gap-1">
			<p class="text-slate-200">Type</p>
			<button on:click={switchTagType} class="p-2 text-slate-200">
				<input
					class="pointer-events-none bg-transparent"
					type="text"
					name="type"
					value={tagTypes[selectedTagType]}
				/>
			</button>
		</div>
		<button class="rounded-md bg-slate-200 p-2"> Post Tag </button>
		<div class="text-white">{postedData}</div>
	</form>
</div>
