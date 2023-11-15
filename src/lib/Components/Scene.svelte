<script lang="ts">
	import { T } from "@threlte/core";
	import { interactivity, InstancedMesh } from "@threlte/extras";
	import { onDestroy, onMount } from "svelte";
	import { spring } from "svelte/motion";
	import BoxInstance from "./BoxInstance.svelte";
	import { mousePos, sceneSize } from "$lib/stores";

	interactivity();

	let cameraPosition = spring([0, 100, 100]);
	let positions: [number, number][] = [];
	let lightPos = spring([0, 0], {
		stiffness: 0.05,
		damping: 0.5
	});
	let count = [40, 56];

	function debounce(callback: any, wait: number) {
		var timeout: NodeJS.Timeout;
		return function (e: any) {
			clearTimeout(timeout);
			timeout = setTimeout(() => {
				callback(e);
			}, wait);
		};
	}

	const followMouse = (e: MouseEvent) => {
		lightPos.set([
			(count[0] * e.pageX) / window.innerWidth - count[0] / 2,
			(count[1] * (e.pageY - window.scrollY)) / window.innerHeight - count[1] / 2 + 2
		]);
		mousePos.set([e.pageX, e.pageY]);
		// console.log(pos);
	};

	const rebuildBG = () => {
		positions = [];
		const normal = 1000;
		let sizeRef = 1000;

		if (window.innerHeight < window.innerWidth) {
			sizeRef = window.innerWidth;
			const ratio = window.innerHeight / window.innerWidth;
			count = [40, Math.ceil(56 * ratio)];
		} else {
			sizeRef = window.innerHeight;
			const ratio = window.innerWidth / window.innerHeight;
			count = [Math.ceil(40 * ratio) + 1, 56];
		}
		const ratio = sizeRef / normal;
		sceneSize.set(ratio);

		for (let i = 0; i < count[0]; i++) {
			for (let j = 0; j < count[1]; j++) {
				if (i % 2 == 0) {
					positions[i * count[1] + j] = [i - count[0] / 2, j + 0.5 - count[1] / 2];
				} else {
					positions[i * count[1] + j] = [i - count[0] / 2, j - count[1] / 2];
				}
			}
		}
		console.log(positions.length, window.innerWidth);
		console.log(count);
	};

	let resizeTimeout: NodeJS.Timeout;

	const handleResize = () => {
		clearTimeout(resizeTimeout);
		resizeTimeout = setTimeout(() => {
			rebuildBG();
		}, 500);
	};

	onMount(() => {
		rebuildBG();

		document.body.addEventListener("mousemove", followMouse);

		return () => {
			document.body.removeEventListener("mousemove", followMouse);
		};
	});
</script>

<svelte:window on:resize={handleResize} />

<T.OrthographicCamera
	makeDefault
	position={$cameraPosition}
	on:create={({ ref }) => {
		ref.lookAt(0, 2, 0);
	}}
	zoom="26"
></T.OrthographicCamera>

<InstancedMesh limit={5000} range={positions.length} castShadow>
	<T.BoxGeometry />
	<T.MeshStandardMaterial color="black" />

	{#each positions as position}
		<BoxInstance {position} lightPos={$lightPos} />
	{/each}
</InstancedMesh>

<T.PointLight
	position={[
		$lightPos[0] * $sceneSize,
		20 + 2 * Math.log2($sceneSize * 2),
		$lightPos[1] * $sceneSize
	]}
	intensity="1300"
	castShadow
	decay="1.8"
	color="#cdceff"
/>

<T.Mesh rotation.x={-Math.PI / 2} receiveShadow position={[0, 0, 0]}>
	<T.PlaneGeometry args={[400, 400]} />
	<T.MeshStandardMaterial color="black" />
</T.Mesh>
