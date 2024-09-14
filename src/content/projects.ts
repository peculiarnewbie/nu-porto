import type { Tag } from "./tags"

export type Project = {
    title: string,
    tags: Tag[],
    description: string,
    repoUrl?: string,
    previewUrl?: string,
    thumbnail?: string,
}

export const Projects: Project[] = [
    {
        title: "Save to Obsidian",
        tags: ["Extension", "Web", "Svelte", "Typescript"],
        description: "An unofficial chrome extension to precisely get data from webpages. intended to be used with Obsidian.md properties",
        repoUrl: "https://github.com/peculiarnewbie/save-to-obsidian",
        previewUrl: "https://chromewebstore.google.com/detail/save-to-obsidian/oadbfjklomnnpchhbgchohhejkiibifm",
        thumbnail: "https://raw.githubusercontent.com/peculiarnewbie/easyhost/main/nu-porto/Youtube%20Page.webp"
    },
    {
        title: "2023 Favorite Albums",
        tags: ["Web", "Svelte", "Threlte", "Vidstack"],
        description: "A fancy list of my favorite albums of 2023",
        repoUrl: "https://github.com/peculiarnewbie/2023-wrap",
        previewUrl: "https://2023.peculiarnewbie.com/albums",
        thumbnail: "https://raw.githubusercontent.com/peculiarnewbie/easyhost/main/nu-porto/2023thumbnail.webp"
    },
    {
        title: "Wonderful Sumatra",
        tags: ["Web", "Svelte", "Threlte", "Typescript"],
        description: "3D Population data visualization created as an entry for the Threlte hackaton where it won the 2nd place award",
        repoUrl: "https://github.com/peculiarnewbie/wonderful-indonesia",
        previewUrl: "https://wonderful-indonesia-rho.vercel.app/",
        thumbnail: "https://raw.githubusercontent.com/peculiarnewbie/easyhost/main/nu-porto/Wonderful%20Indonesia.webp"
    }

] as const