<script lang='ts'>
	import { T } from "@threlte/core";
	import { interactivity, InstancedMesh } from "@threlte/extras";
	import { onDestroy, onMount } from "svelte";
	import { spring } from "svelte/motion";
	import { AmbientLight, BoxGeometry, DirectionalLight, MeshPhysicalMaterial, OrthographicCamera, PerspectiveCamera, PointLight } from "three";
	import BoxInstance from "./BoxInstance.svelte";
	import { mousePosition } from "$lib/stores";

	interactivity();

	const hoverSites = () => {
		cameraPosition.set([10, 10, 10]);
		console.log("aloo", $camerax);
	};

	let camerax = spring(10);
	let cameray = spring(10);

	let cameraPosition = spring([0, 25, 30]);

	const followMouse = (e:MouseEvent) => {
		mousePosition.set([e.pageX, e.pageY])
		// console.log(pos);
	}

	const count = 50

	const positions: [number, number][] = []

	let lightPos = [0,0]

	for(let i=0; i < count; i++){
		for(let j=0; j < count; j++){
			if(i%2 == 0){
				positions[i * count + j] = [i, j+0.5]
			}
			else {
				positions[i * count + j] = [i, j]
			}
		}
	}

	onMount(() => {
		document.body.addEventListener("mousemove", followMouse);
	})

	const unsubscribe = mousePosition.subscribe((value) => {
		lightPos = [50 * value[0] /window.innerWidth, 50* value[1] / window.innerHeight]
	})

	onDestroy(unsubscribe)	
</script>

<T.OrthographicCamera
	makeDefault
	position={$cameraPosition}
	on:create={({ ref }) => {
		ref.lookAt(0, 0, 0);
	}}
	zoom=55
></T.OrthographicCamera>

<InstancedMesh limit={5000} range={2500} castShadow>
	<T.BoxGeometry />
	<T.MeshStandardMaterial color="black" />

	{#each positions as position }
		<BoxInstance {position} />
	{/each}
</InstancedMesh>

<T.PointLight position={[lightPos[0]-25, 25, lightPos[1]-25]} intensity=300 castShadow decay=1.5 />

<T.Mesh rotation.x={-Math.PI/2} receiveShadow
	position={[0,3.5,0]}
>
  <T.PlaneGeometry args={[400, 400]}/>
  <T.MeshStandardMaterial color="black" />
</T.Mesh>