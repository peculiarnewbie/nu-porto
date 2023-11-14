<script lang="ts">
    import { Instance } from '@threlte/extras'
    import { mousePosition, sceneSize } from '$lib/stores';
	import { onDestroy, onMount } from 'svelte';

    export let position: [number, number]
    let y = 0;
    let scale:number = 1

    onMount(() => {
        scale = $sceneSize
    })

    const unsubscribe2 = sceneSize.subscribe((value) => {
        scale = value;
    })

    const unsubscribe = mousePosition.subscribe((value) => {

        const dx = value[0] - position[0]
        const dz = value[1] - position[1]

        y = Math.sqrt(dx*dx + dz*dz)/30
    })

    onDestroy(unsubscribe)

</script>

<Instance 
    position.x={position[0] * scale}
    position.y={(3 - Math.pow(y, 1.5)*10)*scale}
    position.z={position[1] * scale}

    scale.x={scale}
    scale.z={scale}
    scale.y={3 * scale}

    rotation.y={Math.PI * 45 / 180}
/>