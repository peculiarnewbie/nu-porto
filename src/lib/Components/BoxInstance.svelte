<script lang="ts">
    import { Instance } from '@threlte/extras'
    import { mousePosition } from '$lib/stores';
	import { onDestroy } from 'svelte';

    export let position: [number, number]
    let y = 0;

    const unsubscribe = mousePosition.subscribe((value) => {
        const x = 50 * value[0] / window.innerWidth;
        const z = 50 * value[1] / window.innerHeight;

        const dx = x - position[0]
        const dz = z - position[1]

        y = Math.sqrt(dx*dx + dz*dz)/30
    })

    onDestroy(unsubscribe)

</script>

<Instance 
    position.x={position[0] - 25}
    position.y={6 - Math.pow(y, 1.5)*10}
    position.z={position[1] - 25}

    scale.x=1
    scale.z=1
    scale.y=3

    rotation.y={Math.PI * 45 / 180}
/>