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

	let cameraPosition = spring([50, 25, 50]);

	const followMouse = (e:MouseEvent) => {
		mousePosition.set([e.pageX, e.pageY])
		// console.log(pos);
	}

	const count = 30

	const positions: [number, number][] = []

	let lightPos = [0,0]

	for(let i=0; i < count; i++){
		for(let j=0; j < count; j++){
			positions[i * count + j] = [i, j]
		}
	}

	onMount(() => {
		document.body.addEventListener("mousemove", followMouse);
	})

	const unsubscribe = mousePosition.subscribe((value) => {
		lightPos = [30 * value[0] /window.innerWidth, 30* value[1] / window.innerHeight]
	})

	onDestroy(unsubscribe)	
</script>

<T.OrthographicCamera
	makeDefault
	position={$cameraPosition}
	on:create={({ ref }) => {
		ref.lookAt(0, 0, 0);
	}}
	zoom=50
></T.OrthographicCamera>

<InstancedMesh castShadow>
	<T.BoxGeometry />
	<T.MeshStandardMaterial color="black" />

	{#each positions as position }
		<BoxInstance {position} />
	{/each}
</InstancedMesh>

<T.PointLight position={[lightPos[0], 20, lightPos[1]]} intensity=200 castShadow decay=1.4 />
<T.PointLight position={[-15, 10, -15]} intensity=50 castShadow decay=1.4 />

<T.Mesh rotation.x={-Math.PI/2} receiveShadow
	position={[0,0.5,0]}
>
  <T.PlaneGeometry args={[400, 400]}/>
  <T.MeshStandardMaterial color="black" />
</T.Mesh>