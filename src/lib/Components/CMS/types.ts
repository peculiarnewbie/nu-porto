export const postType = {
	tag: "Tag",
	blog: "Blog",
	project: "Project"
} as const;

export const tagType = {
	descriptor: "Descriptor",
	tech: "Tech",
	role: "Role"
} as const;

export type postTypeKeys = (typeof postType)[keyof typeof postType];
export type tagTypeKeys = (typeof tagType)[keyof typeof tagType];
