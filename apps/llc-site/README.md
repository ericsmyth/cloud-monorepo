# LLC Site

Static Astro site for the LLC website in this monorepo.

## Local development

This app lives under `apps/llc-site`, so the easiest way to run it from the monorepo root is with `npm --prefix`.

From the repository root:

```sh
npm --prefix "./apps/llc-site" install
npm --prefix "./apps/llc-site" run dev
```

The local dev server will start at `http://localhost:4321/` by default.

If you prefer, you can also change into the app directory and run the commands there:

```sh
cd apps/llc-site
npm install
npm run dev
```

## Common commands

Run these from the repository root:

| Command | Action |
| :------ | :----- |
| `npm --prefix "./apps/llc-site" install` | Install app dependencies |
| `npm --prefix "./apps/llc-site" run dev` | Start the Astro dev server |
| `npm --prefix "./apps/llc-site" run build` | Build the static site into `apps/llc-site/dist/` |
| `npm --prefix "./apps/llc-site" run preview` | Preview the production build locally |

## Config

The app serves a public runtime config from `public/config.json`.

For this repo, the intended source of truth is:

```text
config/llc-site/prod/config.json
```

That file can be copied into:

```text
apps/llc-site/public/config.json
```

as part of local setup or deployment automation.

## Structure

```text
apps/llc-site/
├── public/
├── src/
│   ├── components/
│   ├── layouts/
│   ├── lib/
│   ├── pages/
│   └── styles/
├── astro.config.mjs
├── package.json
└── tsconfig.json
```
