<script lang="ts">
	import { onMount } from "svelte";
	import "../app.css";

	import { Canvas } from "@threlte/core";
	import Scene from "../lib/Components/Scene.svelte";

	export let data;
</script>

<div class="h-screen w-screen bg-neutral-800">
	<Canvas>
		<Scene />
	</Canvas>
</div>
