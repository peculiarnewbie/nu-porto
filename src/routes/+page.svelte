<script lang="ts">
	import { onMount } from "svelte";
	import "../app.css";

	import { Canvas } from "@threlte/core";
	import Scene from "../lib/Components/Scene.svelte";

	export let data;

	export let sceneKey = 0;
	let resizeTimeout:NodeJS.Timeout;

	onMount(() => {
		window.addEventListener("resize", () => {
			clearTimeout(resizeTimeout);
			resizeTimeout = setTimeout(() => {sceneKey += 1; console.log(sceneKey)}, 500)
		})
	})
</script>

<div key={sceneKey} class="h-screen w-screen bg-neutral-800">
	<Canvas>
		<Scene />
	</Canvas>
</div>
