<script lang="ts">
	import { onMount } from "svelte";
	import "../../app.css";
	let passInput = "";
	let imIn = false;
	let inputEl: HTMLInputElement;

	const submitPassword = async (e: Event) => {
		e.preventDefault();

		const response = await fetch("../api/cms/postPassword", {
			method: "POST",
			body: JSON.stringify({ pass: passInput }),
			headers: {
				"Content-Type": "application/json"
			}
		});

		const res = await response.json();

		if (res.status == 200) {
			imIn = true;
			console.log(res, "hi me/bolt (same thing)");
		} else {
			console.log("who tf are you?");
		}
	};

	onMount(() => {
		inputEl.focus();
	});
</script>

<div class="h-screen bg-black">
	<div class="mx-auto min-h-screen max-w-screen-xl px-6 py-12 md:px-12 md:py-20 lg:px-24 lg:py-0">
		{#if !imIn}
			<div class="flex h-screen w-full items-center justify-center">
				<form on:submit={submitPassword} autocomplete="off">
					<input
						bind:this={inputEl}
						class="rounded-md p-2"
						bind:value={passInput}
						type="password"
						name="pass"
						autocomplete="off"
					/>
				</form>
			</div>
		{:else}
			<slot />
		{/if}
	</div>
</div>
