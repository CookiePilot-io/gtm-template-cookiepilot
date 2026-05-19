# CookiePilot CMP GTM Template

This repository contains the Google Tag Manager Community Template for CookiePilot.

## What It Does

- Sets Google Consent Mode v2 defaults on `Consent Initialization - All Pages`.
- Reads the `cookiepilot_consent` cookie for returning visitors and updates GTM consent state before queued tags run.
- Loads `https://cdn.cookiepilot.io/cookiepilot.js?cpkey=...`.
- Lets CookiePilot emit `cookiepilot_consent_update` for non-Google tags.

## Install Before Gallery Approval

1. In GTM, open **Templates**.
2. Click **New** in **Tag Templates**.
3. Open the menu and choose **Import**.
4. Import `template.tpl`.
5. Save the template.
6. Create a new tag using **CookiePilot CMP**.
7. Paste the domain API key from CookiePilot.
8. Use the **Consent Initialization - All Pages** trigger.
9. Publish the GTM container.

## Install From Community Template Gallery

After Google approves the template:

1. In GTM, open **Templates**.
2. Click **Search Gallery**.
3. Search for **CookiePilot CMP**.
4. Add the template to the workspace.
5. Create a new **CookiePilot CMP** tag with the **Consent Initialization - All Pages** trigger.

## Autoblocking Notes

CookiePilot autoblocking works for scripts added after the CMP loads. GTM tags should still use Consent Checks or a Custom Event trigger based on `cookiepilot_consent_update`.

Hardcoded scripts that run before GTM cannot be reliably stopped by any GTM template after they have already executed. For those sites, install CookiePilot directly as early as possible in `<head>`.

## Publishing

Google requires `template.tpl`, `metadata.yaml`, `LICENSE`, and optionally `README.md` at the root of the public template repository. Before submission, replace `REPLACE_WITH_RELEASE_COMMIT_SHA` in `metadata.yaml` with the commit SHA that contains the released `template.tpl`.
