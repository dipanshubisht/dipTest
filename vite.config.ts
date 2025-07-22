import { defineConfig } from "vite";
import react from "@vitejs/plugin-react-swc";

// https://vite.dev/config/
export default defineConfig({
  plugins: [react()],
  server: {
    allowedHosts: ["localhost", "127.0.0.1", "0.0.0.0", ".atroxdev.in"],
    host: true,
    port: 5173,
  },
  preview: {
    port: 4173,
    allowedHosts: true,
  },
});
