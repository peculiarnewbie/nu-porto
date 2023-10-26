<script lang="ts">
	import { v4 as uuidv4 } from "uuid";

	let postedData: { title: string; description: string; content: string; id: string };

	const postBlog = async (e: SubmitEvent) => {
		//@ts-ignore
		const formData = new FormData(e.target);
		const data = {} as { title: string; description: string; content: string; id: string };
		for (let field of formData) {
			const [key, value] = field;
			//@ts-ignore
			data[key] = value;
		}
		data["id"] = uuidv4();
		console.log(data);

		const response = await fetch("../api/cms/postBlog", {
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
</script>

<div>
	<form on:submit={(e) => postBlog(e)} class="flex flex-col">
		<p>Title</p>
		<input type="text" name="title" />
		<p>Description</p>
		<input type="text" name="description" />
		<p>Content</p>
		<input type="text" name="content" />
		<button type="submit">Post</button>
	</form>

	<div>
		<p>posted data:</p>
		<p>{postedData?.title}</p>
	</div>
</div>
