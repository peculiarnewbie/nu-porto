<script lang="ts">
	import { mousePos } from "$lib/stores";
	import { onDestroy, onMount } from "svelte";

    let boltOpacity = 1;
    let boltText:HTMLElement;

    const unsubscribe = mousePos.subscribe((value) => {
        if(window.innerWidth < 560){
            boltOpacity = 0.8;
        }
        else if(boltText){
            const rect = boltText.getBoundingClientRect()
            const dx = value[0] - rect.left;
            const dy = value[1] - rect.top;

            const distance = (600-Math.sqrt(dx * dx + dy * dy))/400
            boltOpacity = distance;
        }
    })

    onDestroy(unsubscribe)

</script>

<header class="lg:sticky lg:top-0 lg:flex lg:max-h-screen lg:w-1/2 lg:flex-col lg:justify-between lg:py-24">
    <div class="relative w-fit">
        <h1 class="text-4xl sm:text-5xl font-bold text-slate-200 ">Arif Rahman</h1>
        <p bind:this={boltText} class="absolute -right-5 sm:-right-10 sm:-top-2 -top-1 text-2xl sm:text-4xl text-[#899beb] font-semibold handWrite rotate-[20deg] transition-opacity duration-500"
            style={`opacity: ${boltOpacity} ;`}
        >{"(Bolt)"}</p>
    </div>
    <div class="mt-3 text-lg font-medium tracking-tight text-slate-200 sm:text-xl">
        Frontend and Game Developer
    </div>
</header>