import { writable } from "svelte/store"

export const mousePos = writable([0, 0])

export const sceneSize = writable(1)