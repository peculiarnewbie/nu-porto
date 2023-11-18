<script lang="ts">
	export let iconUrl: string;
	export let url: string;
	export let action: string;

	let copied: boolean = false;

	const onCopied = async () => {
		if (copied) return;

		await navigator.clipboard.writeText("peculiarnewbie");
		copied = true;
		setTimeout(() => {
			copied = false;
		}, 2000);
	};
</script>

{#if action != "copy"}
	<a
		href={`${url}`}
		target="_blank"
		rel="noreferrer"
		class="h-8 w-8 opacity-50 transition-opacity duration-300 hover:cursor-pointer hover:opacity-100"
	>
		<img class="h-full w-full" src={`/${iconUrl}`} alt={`${url}`} />
	</a>
{:else}
	<button
		on:click={onCopied}
		class="h-8 w-8 opacity-50 transition-opacity duration-300 hover:cursor-pointer hover:opacity-100"
	>
		<img class="h-full w-full" src={`/${iconUrl}`} alt={`${url}`} />
	</button>
{/if}

<div
	class={`fixed left-0 flex w-screen justify-center transition-all duration-500 ${
		copied ? "top-4 opacity-100" : "-top-16 opacity-0"
	}`}
>
	<div class="rounded-md bg-slate-600 px-6 py-2 text-slate-200">username copied!</div>
</div>
