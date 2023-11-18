<script lang="ts">
	import { onMount } from "svelte";
	import "../app.css";
	import dayjs from "dayjs";

	import { Canvas } from "@threlte/core";
	import Scene from "../lib/Components/Scene.svelte";
	import Header from "$lib/Components/Header.svelte";
	import MainContent from "$lib/Components/MainContent.svelte";

	export let data;

	onMount(() => {
		var timeZone = Intl.DateTimeFormat().resolvedOptions().timeZone;

		let now = dayjs();
		let month = now.year().toString() + (now.month() + 1).toString();

		console.log(month, timeZone);

		const analytics = { timeZone: timeZone, month: month };

		const sendAnalytics = async () => {
			const response = await fetch("../api/analytics", {
				method: "POST",
				body: JSON.stringify(analytics),
				headers: {
					"Content-Type": "application/json"
				}
			});
		};

		sendAnalytics();
	});
</script>

<div class="h-screen bg-black">
	<!--
	-->
	<div class="relative z-20">
		<div class="fixed z-10 h-screen w-screen">
			<Canvas>
				<Scene />
			</Canvas>
		</div>
		<div class="absolute z-20 w-full">
			<div
				class="mx-auto min-h-screen max-w-screen-xl px-6 py-12 md:px-12 md:py-20 lg:px-24 lg:py-0"
			>
				<div class="lg:flex lg:justify-between lg:gap-4">
					<Header />
					<MainContent projects={data.projects} />
				</div>
			</div>
		</div>
	</div>
</div>
