<script lang="ts">
	import { mousePos } from "$lib/stores";
	import { onDestroy, onMount } from "svelte";
	import HeaderLinks from "./HeaderLinks.svelte";

	let boltOpacity = 1;
	let boltText: HTMLElement;

	const links = [
		{ icon: "github.svg", url: "https://github.com/peculiarnewbie", action: "open" },
		{ icon: "itchio.svg", url: "https://peculiarnewbie.itch.io/", action: "open" },
		{ icon: "twitter.svg", url: "https://twitter.com/peculiarnewbie", action: "open" },
		{ icon: "discord.svg", url: "peculiarnewbie", action: "copy" },
		{ icon: "email.svg", url: "mailto:arif.rahman.bolt@gmail.com", action: "email" }
	];

	const unsubscribe = mousePos.subscribe((value) => {
		if (typeof window != "undefined") {
			if (window.innerWidth < 560) {
				boltOpacity = 1;
			} else if (boltText) {
				const rect = boltText.getBoundingClientRect();
				const dx = value[0] - rect.left;
				const dy = value[1] - rect.top - window.scrollY;

				const distance = (600 - Math.sqrt(dx * dx + dy * dy)) / 400;
				boltOpacity = distance;
			}
		}
	});

	onDestroy(unsubscribe);
</script>

<header
	class="lg:sticky lg:top-0 lg:flex lg:max-h-screen lg:w-1/2 lg:flex-col lg:justify-between lg:py-24"
>
	<div>
		<div class="relative w-fit">
			<h1 class="text-4xl font-bold text-slate-200 sm:text-5xl">Arif Rahman</h1>
			<p
				bind:this={boltText}
				class="handWrite absolute -right-5 -top-1 rotate-[20deg] text-2xl font-semibold text-[#899beb] transition-opacity duration-500 sm:-right-10 sm:-top-2 sm:text-4xl"
				style={`opacity: ${boltOpacity} ;`}
			>
				{"(Bolt)"}
			</p>
		</div>
		<div class="mt-3 text-lg font-medium tracking-tight text-slate-200 sm:text-xl">
			Frontend and Game Developer
		</div>
		<div class="mt-4 max-w-xs leading-normal text-slate-400">
			Learning to build useful tools and meaningful experiences
		</div>
		<div class=" mt-12 flex gap-6 text-xs font-bold tracking-widest text-slate-200 sm:flex-col">
			<a href="/">PROJECTS</a>
			<a href="/CV-Arif-Rahman.pdf">RESUME</a>
			<p class="text-slate-600">BLOG <span class=" font-normal">{"(Soon)"}</span></p>
			<p class="text-slate-600">TMI <span class="font-normal">{"(Soon)"}</span></p>
		</div>
	</div>
	<div class="bottom-0 mt-8 flex gap-7">
		{#each links as link}
			<HeaderLinks iconUrl={link.icon} url={link.url} action={link.action} />
		{/each}
	</div>
</header>
