<script>
	import { T } from "@threlte/core";
	import { interactivity } from "@threlte/extras";
	import { spring } from "svelte/motion";
	import { PerspectiveCamera } from "three";

	interactivity();

	const hoverSites = () => {
		cameraPosition.set([15, 15, 10]);
		console.log("aloo", $camerax);
	};

	let camerax = spring(10);
	let cameray = spring(10);

	let cameraPosition = spring([10, 10, 10]);
</script>

<T.PerspectiveCamera
	makeDefault
	position={$cameraPosition}
	on:create={({ ref }) => {
		ref.lookAt(0, 1, 0);
	}}
></T.PerspectiveCamera>

<T.Mesh
	on:click={() => {
		cameraPosition.set([10, 10, 10]);
	}}
>
	<T.BoxGeometry />
	<T.MeshBasicMaterial />
</T.Mesh>

<T.Mesh
	on:pointerenter={() => {
		hoverSites();
	}}
	position={[5, 5, -5]}
>
	<T.BoxGeometry />
	<T.MeshBasicMaterial />
</T.Mesh>
