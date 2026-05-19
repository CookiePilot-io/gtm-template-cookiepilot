# CookiePilot CMP for Google Tag Manager

Official Google Tag Manager Community Template for [CookiePilot](https://cookiepilot.io) - a Consent Management Platform (CMP) for cookie consent banners, Google Consent Mode v2, GDPR/RODO, PKE, and privacy-first tracking.

CookiePilot helps website owners collect, store, and manage user consent for analytics, marketing, preferences, and necessary cookies. This GTM template makes it easier to install CookiePilot through Google Tag Manager while keeping Google Consent Mode defaults in place before other tags run.

## About CookiePilot

[CookiePilot](https://cookiepilot.io) is a Polish Consent Management Platform built for teams that need a practical cookie banner, Google Consent Mode v2 support, consent records, and cookie compliance workflows without a complicated setup.

CookiePilot focuses on:

- cookie consent banner management;
- Google Consent Mode v2 integration;
- GDPR/RODO and PKE consent workflows;
- consent logs and audit history;
- cookie and tracker detection;
- visual banner configuration;
- lightweight CMP script delivery through `cdn.cookiepilot.io`;
- Polish-language support for Polish businesses, agencies, and ecommerce teams.

Create an account or manage your domains in the [CookiePilot app](https://app.cookiepilot.io).

## CookiePilot Pricing

CookiePilot uses simple per-domain pricing, not per-page pricing. Current plans listed on [cookiepilot.io](https://cookiepilot.io#pricing) include:

| Plan | Price | Best for | Includes |
| --- | ---: | --- | --- |
| Starter | 0 PLN | small websites and blogs | 1 domain, 10k pageviews/month, daily scans, Visual Builder, Consent Mode v2 |
| Pro | 29 PLN/month | growing businesses | 1 domain, unlimited pageviews, daily scans, Consent Mode v2 + TCF 2.2, CSV/PDF export, chat and email support |
| Business | 99 PLN/month | larger organizations | 5 domains, unlimited pageviews, Pro features, white-label, API access, priority support |

All prices are shown net on the CookiePilot website. Check the latest pricing at [cookiepilot.io](https://cookiepilot.io#pricing).

## What This GTM Template Does

The CookiePilot GTM template:

- sets Google Consent Mode v2 defaults on the `Consent Initialization - All Pages` trigger;
- defaults non-essential storage to `denied` and keeps `security_storage` as `granted`;
- reads the `cookiepilot_consent` cookie for returning visitors;
- updates Google consent state before queued GTM tags run;
- loads the CookiePilot CMP script from `https://cdn.cookiepilot.io/cookiepilot.js`;
- supports CookiePilot's `cookiepilot_consent_update` dataLayer event for non-Google tags;
- keeps setup simple: one GTM tag and one CookiePilot API key.

## Requirements

Before installing the template, you need:

- a CookiePilot account;
- a verified domain in CookiePilot;
- the domain API key from CookiePilot;
- access to the target Google Tag Manager container.

## Manual Installation Before Gallery Approval

Use this method until the template is available directly in the GTM Community Template Gallery.

1. Download `template.tpl` from this repository.
2. Open Google Tag Manager.
3. Select the container for your website.
4. Go to **Templates**.
5. In **Tag Templates**, click **New**.
6. Open the menu in the top-right corner and choose **Import**.
7. Import `template.tpl`.
8. Click **Save**.
9. Go to **Tags** and click **New**.
10. Choose **CookiePilot CMP** as the tag type.
11. Paste your CookiePilot domain API key.
12. Set the trigger to **Consent Initialization - All Pages**.
13. Save the tag.
14. Use **Preview** mode to verify that CookiePilot loads correctly.
15. Publish the GTM container.

## Installation From Community Template Gallery

After Google approves the template:

1. Open Google Tag Manager.
2. Go to **Templates**.
3. Click **Search Gallery**.
4. Search for **CookiePilot CMP**.
5. Add the template to your workspace.
6. Create a new **CookiePilot CMP** tag.
7. Paste your CookiePilot domain API key.
8. Use the **Consent Initialization - All Pages** trigger.
9. Preview and publish the container.

## Recommended GTM Setup

Use this template as the first consent-related tag in your GTM container.

Recommended trigger:

```text
Consent Initialization - All Pages
```

For Google tags such as Google Analytics 4, Google Ads, Floodlight, and Conversion Linker, use GTM Consent Checks and Google Consent Mode v2.

For non-Google tags such as Meta Pixel, TikTok Pixel, LinkedIn Insight Tag, or other marketing scripts, use one of these approaches:

- GTM Consent Checks, if supported by the tag;
- a Custom Event trigger based on `cookiepilot_consent_update`;
- custom trigger conditions based on `cookiepilot_consent.analytics`, `cookiepilot_consent.marketing`, or `cookiepilot_consent.preferences`.

Example event pushed by CookiePilot:

```js
dataLayer.push({
  event: 'cookiepilot_consent_update',
  cookiepilot_consent: {
    necessary: true,
    analytics: true,
    marketing: false,
    preferences: false
  }
});
```

## Autoblocking Notes

CookiePilot can autoblock scripts that are added after the CMP has loaded, depending on the domain configuration in CookiePilot.

Important limitations:

- GTM templates cannot reliably stop hardcoded scripts that already executed before GTM loaded.
- For best blocking coverage, install CookiePilot as early as possible.
- GTM-managed tags should still use Consent Checks or consent-based triggers.
- If your website has analytics or marketing scripts hardcoded before GTM, direct installation in the page `<head>` may be safer than GTM-only installation.

## Google Consent Mode v2 Mapping

CookiePilot maps consent categories to Google Consent Mode v2 signals:

| CookiePilot category | Google consent signals |
| --- | --- |
| Necessary | `security_storage` |
| Analytics | `analytics_storage` |
| Marketing | `ad_storage`, `ad_user_data`, `ad_personalization` |
| Preferences | `functionality_storage`, `personalization_storage` |

By default, this template sets:

- `analytics_storage`: `denied`
- `ad_storage`: `denied`
- `ad_user_data`: `denied`
- `ad_personalization`: `denied`
- `functionality_storage`: `denied`
- `personalization_storage`: `denied`
- `security_storage`: `granted`

## Files In This Repository

```text
template.tpl
metadata.yaml
LICENSE
README.md
```

## Publishing To GTM Community Template Gallery

Google requires a public GitHub repository with:

- `template.tpl`
- `metadata.yaml`
- `LICENSE`
- optionally `README.md`

Each released version in `metadata.yaml` must point to the commit SHA that contains the template version being published.

## Useful Links

- CookiePilot website: [https://cookiepilot.io](https://cookiepilot.io)
- CookiePilot app: [https://app.cookiepilot.io](https://app.cookiepilot.io)
- CookiePilot CDN: `https://cdn.cookiepilot.io`
- Google Tag Manager Community Template Gallery docs: [developers.google.com/tag-platform/tag-manager/templates/gallery](https://developers.google.com/tag-platform/tag-manager/templates/gallery)

## License

This GTM template is released under the Apache License 2.0. See [LICENSE](LICENSE).
