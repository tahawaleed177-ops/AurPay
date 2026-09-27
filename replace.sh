#!/usr/bin/env bash
# AurPay update cleanup — run ONCE from the project root after
# extracting 2.zip over your project folder.
set -e
cd "$(dirname "$0")"
rm -rf 'src/app/api/[...path]' src/app/api/internal/spawn-backend src/lib/db.ts bun.lock
echo 'Done! Now run:  npm install && npm run dev'
