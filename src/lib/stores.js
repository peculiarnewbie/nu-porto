import { writable } from "svelte/store"

export const mousePosition = writable([0, 0])

export const windowSize = writable([0, 0])