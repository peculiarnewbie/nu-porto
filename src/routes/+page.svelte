<script lang="ts">
	import { onMount } from "svelte";
	import "../app.css";

	import { Canvas } from "@threlte/core";
	import Scene from "../lib/Components/Scene.svelte";
	import Header from "$lib/Components/Header.svelte";

	export let data;

	
</script>

<div class="h-screen w-screen bg-black">
	<!--
	-->
	<div class="relative z-20">
		<div class="z-10 h-screen w-screen fixed">
			<Canvas>
				<Scene />
			</Canvas>
		</div>
		<div class="z-20 fixed w-screen h-fit">
			<div class="mx-auto min-h-screen max-w-screen-xl px-6 py-12 md:px-12 md:py-20 lg:px-24 lg:py-0">
				<div class="lg:flex lg:justify-between lg:gap-4">
					<Header/>
					<div class="h-[3000px]"></div>
				</div>
			</div>
		</div>
	</div>
</div>
