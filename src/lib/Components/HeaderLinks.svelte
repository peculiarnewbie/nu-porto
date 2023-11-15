<script lang="ts">
	export let iconUrl: string;
	export let url: string;
</script>

<a
	href={`${url}`}
	target="_blank"
	rel="noreferrer"
	class="h-8 w-8 opacity-50 transition-opacity duration-300 hover:cursor-pointer hover:opacity-100"
>
	<img class="h-full w-full" src={`/${iconUrl}`} alt={`${url}`} />
</a>
