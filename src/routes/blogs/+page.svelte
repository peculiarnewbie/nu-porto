<script lang="ts">
	import { onMount } from "svelte";
	import "../../app.css";

	export let data;

	onMount(() => {
		console.log(data.blogsCount[0].count);
	});
</script>

<div class="flex w-full justify-center">
	<div class="container">
		<div class=" flex flex-col p-12">
			{#each data.paginatedBlogs as blog}
				<div
					class=" border-b-2 border-black p-2 last:border-b-0
				"
				>
					<p>{blog.id}</p>
					<h1 class=" text-5xl font-extrabold">{blog.title}</h1>
					<p>{blog.content}</p>
				</div>
			{/each}
		</div>
	</div>
</div>
