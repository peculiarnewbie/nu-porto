<script lang="ts">
    export let iconUrl:string;
    export let url:string;

</script>

<a href={`${url}`} target="_blank" rel="noreferrer"
    class="h-8 w-8 transition-opacity duration-300 opacity-50 hover:opacity-100 hover:cursor-pointer"
>
    <img class="w-full h-full"
        src={`/${iconUrl}`} alt={`${url}`}
    />
</a>