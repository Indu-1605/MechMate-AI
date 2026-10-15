import { workspaceSnapshots } from "./schema";

// Snapshot ownership is enforced by the server procedure using the authenticated user's id.
export const workspaceRelations = { workspaceSnapshots };
