import { fileURLToPath, URL } from 'node:url'

import react from '@vitejs/plugin-react'
import { defineConfig } from 'vite'

export default defineConfig({
  plugins: [react()],
  resolve: {
    alias: {
      '@': fileURLToPath(new URL('./src', import.meta.url)),
    },
  },
  build: {
    outDir: 'target/dist',
    assetsDir: 'static',
  },
  server: {
    proxy: {
      '/api': {
        target: 'http://localhost:8989',
        changeOrigin: true,
      },
      '/rest': {
        target: 'http://localhost:8989',
        changeOrigin: true,
      },
    },
  },
})
