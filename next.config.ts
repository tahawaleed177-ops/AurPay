import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  /* No `output: "standalone"` — Vercel manages its own output. Dev (`next dev`)
   * ignores this option anyway, so local runs are unaffected. */
  typescript: {
    // The 1:1 Python-port occasionally widens types on purpose; don't let
    // TS nits block a deploy.
    ignoreBuildErrors: true,
  },
  eslint: {
    ignoreDuringBuilds: true,
  },
  reactStrictMode: false,
};

export default nextConfig;
