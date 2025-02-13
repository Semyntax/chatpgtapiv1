import dotenv from "dotenv";

import { ChatGPTAPIBrowser } from "chatgpt";

dotenv.config();

/**
 * Demo CLI for testing basic functionality using Google auth.
 *
 * ```
 * npx tsx demos/demo.ts
 * ```
 */
async function main() {
  const email = process.env.OPENAI_EMAIL;
  const password = process.env.OPENAI_PASSWORD;

  const api = new ChatGPTAPIBrowser({
    email,
    password,
    isGoogleLogin: true,
    debug: false,
    minimize: true
  });
  await api.initSession();

  const prompt =
    "Write a python version of bubble sort. Do not include example usage.";

  const res = await api.sendMessage(prompt);
  console.log(res.response);

  // close the browser at the end
  await api.closeSession();
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});