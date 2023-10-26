<script lang="ts">
	import { onMount } from "svelte";
	import "../app.css";

	import { Canvas } from "@threlte/core";
	import Scene from "./Scene.svelte";

	export let data;
</script>

<div class=" flex flex-col p-12">cmoon</div>

<div class="h-screen w-screen bg-neutral-800">
	<Canvas>
		<Scene />
	</Canvas>
</div>
