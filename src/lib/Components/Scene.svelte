<script lang='ts'>
	import { T } from "@threlte/core";
	import { interactivity, InstancedMesh } from "@threlte/extras";
	import { onMount } from "svelte";
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

	let cameraPosition = spring([50, 50, 50]);

	const followMouse = (e:MouseEvent) => {
		mousePosition.set([e.pageX, e.pageY])
		// console.log(pos);
	}

	const count = 20

	const positions: [number, number][] = []

	for(let i=0; i < count; i++){
		for(let j=0; j < count; j++){
			positions[i * count + j] = [i, j]
		}
	}

	onMount(() => {
		document.body.addEventListener("mousemove", followMouse);
	})

	
</script>

<T.OrthographicCamera
	makeDefault
	position={$cameraPosition}
	on:create={({ ref }) => {
		ref.lookAt(0, 0, 0);
	}}
	zoom=100
></T.OrthographicCamera>

<InstancedMesh>
	<T.BoxGeometry />
	<T.MeshStandardMaterial color="black" />

	{#each positions as position }
		<BoxInstance {position} />
	{/each}
</InstancedMesh>

<T.PointLight position={[0, 4, 0]} intensity=50 castShadow decay=1.4 />

<T.Mesh rotation.x={-Math.PI/2} receiveShadow
	position={[0,-10.5,0]}
>
  <T.PlaneGeometry args={[400, 400]}/>
  <T.MeshStandardMaterial color="black" />
</T.Mesh>