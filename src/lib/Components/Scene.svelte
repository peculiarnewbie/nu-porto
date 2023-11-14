<script lang='ts'>
	import { T } from "@threlte/core";
	import { interactivity, InstancedMesh } from "@threlte/extras";
	import { onDestroy, onMount } from "svelte";
	import { spring } from "svelte/motion";
	import { AmbientLight, BoxGeometry, DirectionalLight, MeshPhysicalMaterial, OrthographicCamera, PerspectiveCamera, PointLight } from "three";
	import BoxInstance from "./BoxInstance.svelte";
	import { mousePosition, sceneSize } from "$lib/stores";

	interactivity();
	
	let cameraPosition = spring([0, 100, 100]);
	const positions: [number, number][] = []
	let lightPos = spring([0,0])
	let count = [40, 56]

	let mouseMoveTimeout:NodeJS.Timeout

	function debounce(callback:any, wait:number) {
		var timeout:NodeJS.Timeout;
		return function(e:any) {
		clearTimeout(timeout);
		timeout = setTimeout(() => {
			callback(e);
		}, wait);
		}
	}
	
	const followMouse = (e:MouseEvent) => {
			lightPos.set([(count[0] * e.pageX /window.innerWidth - count[0]/2), 
						(count[1] * e.pageY / window.innerHeight - count[1]/2)])
			mousePosition.set($lightPos)
		// console.log(pos);
	}

	const rebuildBG = () => {
		const normal = 1000
		let sizeRef = 1000
		
		if(window.innerHeight < window.innerWidth) {
			sizeRef = window.innerWidth
			const ratio = window.innerHeight / window.innerWidth
			count = [40, Math.ceil(56 * ratio)]
		}
		else{
			sizeRef = window.innerHeight
			const ratio = window.innerWidth / window.innerHeight
			count = [Math.ceil(40 * ratio) + 1, 56]
			
		} 
		console.log(sizeRef)
		const ratio = sizeRef/normal
		sceneSize.set(ratio)
		
		for(let i=0; i < count[0]; i++){
			for(let j=0; j < count[1]; j++){
				if(i%2 == 0){
					positions[i * count[1] + j] = [i - count[0]/2, j+0.5 - count[1]/2]
				}
				else {
					positions[i * count[1] + j] = [i - count[0]/2, j - count[1]/2]
				}
			}
		}
		console.log(count)
	}

	onMount(() => {
		rebuildBG()

		document.body.addEventListener("mousemove", followMouse);
	})
	
</script>

<T.OrthographicCamera
	makeDefault
	position={$cameraPosition}
	on:create={({ ref }) => {
		ref.lookAt(0, 2, 0);
	}}
	zoom=26
></T.OrthographicCamera>

<InstancedMesh limit={5000} range={2500} castShadow>
	<T.BoxGeometry />
	<T.MeshStandardMaterial color="black" />

	
	{#each positions as position }
		<BoxInstance {position} />
	{/each}
	
</InstancedMesh>

<T.PointLight position={[$lightPos[0] * $sceneSize, 40 + 2 * Math.log2($sceneSize * 2), $lightPos[1] * $sceneSize]} 
	intensity=2500 castShadow decay=1.8
/>

<T.Mesh rotation.x={-Math.PI/2} receiveShadow
	position={[0,0,0]}
>
  <T.PlaneGeometry args={[400, 400]}/>
  <T.MeshStandardMaterial color="black" />
</T.Mesh>