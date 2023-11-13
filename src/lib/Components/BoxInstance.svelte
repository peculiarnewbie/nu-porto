<script lang="ts">
    import { Instance } from '@threlte/extras'
    import { mousePosition } from '$lib/stores';
	import { onDestroy } from 'svelte';

    export let position: [number, number]
    let y = 0;

    const unsubscribe = mousePosition.subscribe((value) => {
        const x = 20 * value[0] / window.innerWidth;
        const z = 20 * value[1] / window.innerHeight;

        y = x - position[0] + z - position[1]
    })

    onDestroy(unsubscribe)

</script>

<Instance 
    position.x={10 - position[0]}
    position.y={y}
    position.z={10 - position[1]}

    scale.x = 0.5
    scale.z = 0.5
/>