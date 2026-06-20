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
| `npm --prefix "./apps/llc-site" run sync-config` | Copy ignored prod config into `public/config.json` |
| `npm --prefix "./apps/llc-site" run reset-config` | Restore the generic example into `public/config.json` |
| `npm --prefix "./apps/llc-site" run dev` | Start the Astro dev server |
| `npm --prefix "./apps/llc-site" run build` | Build the static site into `apps/llc-site/dist/` |
| `npm --prefix "./apps/llc-site" run preview` | Preview the production build locally |

## Config

The app serves a public runtime config from `public/config.json`.

The committed `public/config.json` file is a generic local development default so the app runs out of the box for other developers.

For this repo, the intended source of truth is:

```text
config/llc-site/prod/config.json
```

That file is intentionally ignored by Git and can hold real environment-specific values.

When you want to run the site with real values, copy that file into:

```text
apps/llc-site/public/config.json
```

as part of local setup or deployment automation.

The committed example template lives at:

```text
config/llc-site/config.example.json
```

Typical workflow:

1. Copy `config/llc-site/config.example.json` to `config/llc-site/prod/config.json`.
2. Replace the example values in `config/llc-site/prod/config.json` with real business information.
3. Copy `config/llc-site/prod/config.json` to `apps/llc-site/public/config.json` before local testing or deployment when you want to use the real values.

To do that copy from the repository root, run:

```sh
npm --prefix "./apps/llc-site" run sync-config
```

When you want to restore the tracked generic local development config, run:

```sh
npm --prefix "./apps/llc-site" run reset-config
```

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
