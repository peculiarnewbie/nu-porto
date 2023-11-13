<script lang="ts">
    import { Instance } from '@threlte/extras'
    import { mousePosition } from '$lib/stores';
	import { onDestroy } from 'svelte';

    export let position: [number, number]
    let y = 0;

    const unsubscribe = mousePosition.subscribe((value) => {
        const x = 30 * value[0] / window.innerWidth;
        const z = 30 * value[1] / window.innerHeight;

        const dx = x - position[0]
        const dz = z - position[1]

        y = Math.sqrt(dx*dx + dz*dz)/30
    })

    onDestroy(unsubscribe)

</script>

<Instance 
    position.x={position[0] - 10}
    position.y={y*5 - 1}
    position.z={position[1] - 10}

/>