___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community Template Gallery Developer Terms of Service available at https://developers.google.com/tag-manager/gallery-tos (or such other URL as Google may provide), as modified from time to time.

___INFO___

{
  "type": "TAG",
  "id": "cvt_cookiepilot_cmp",
  "version": 1,
  "displayName": "CookiePilot CMP",
  "categories": ["UTILITY", "TAG_MANAGEMENT"],
  "brand": {
    "id": "cookiepilot",
    "displayName": "CookiePilot"
  },
  "description": "Loads the CookiePilot consent banner, sets Google Consent Mode v2 defaults, and applies stored consent before other GTM tags run.",
  "containerContexts": ["WEB"],
  "securityGroups": []
}

___TEMPLATE_PARAMETERS___

[
  {
    "type": "LABEL",
    "name": "setupInstructions",
    "displayName": "Use this tag with the Consent Initialization - All Pages trigger. For best autoblocking coverage, keep CookiePilot as the first consent tag in the container."
  },
  {
    "type": "TEXT",
    "name": "apiKey",
    "displayName": "CookiePilot API key",
    "simpleValueType": true,
    "alwaysInSummary": true,
    "help": "Paste the domain API key from CookiePilot.",
    "valueValidators": [
      {
        "type": "NON_EMPTY",
        "errorMessage": "CookiePilot API key is required."
      },
      {
        "type": "REGEX",
        "args": ["^cp_live_[A-Za-z0-9]+$"],
        "errorMessage": "Use a live CookiePilot API key, for example cp_live_..."
      }
    ]
  }
]

___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const setDefaultConsentState = require('setDefaultConsentState');
const updateConsentState = require('updateConsentState');
const getCookieValues = require('getCookieValues');
const injectScript = require('injectScript');
const encodeUriComponent = require('encodeUriComponent');
const JSON = require('JSON');

const COOKIE_NAME = 'cookiepilot_consent';
const CDN_URL = 'https://cdn.cookiepilot.io/cookiepilot.js';

const defaultConsent = {
  ad_storage: 'denied',
  ad_user_data: 'denied',
  ad_personalization: 'denied',
  analytics_storage: 'denied',
  functionality_storage: 'denied',
  personalization_storage: 'denied',
  security_storage: 'granted',
  wait_for_update: 500
};

setDefaultConsentState(defaultConsent);

const cookieValues = getCookieValues(COOKIE_NAME);
if (cookieValues && cookieValues.length > 0) {
  const consent = JSON.parse(cookieValues[0]);
  if (consent) {
    updateConsentState({
      analytics_storage: consent.analytics ? 'granted' : 'denied',
      ad_storage: consent.marketing ? 'granted' : 'denied',
      ad_user_data: consent.marketing ? 'granted' : 'denied',
      ad_personalization: consent.marketing ? 'granted' : 'denied',
      functionality_storage: consent.preferences ? 'granted' : 'denied',
      personalization_storage: consent.preferences ? 'granted' : 'denied',
      security_storage: 'granted'
    });
  }
}

const scriptUrl = CDN_URL + '?cpkey=' + encodeUriComponent(data.apiKey);
injectScript(scriptUrl, data.gtmOnSuccess, data.gtmOnFailure, 'cookiepilot-cmp-' + data.apiKey);

___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "access_consent",
        "versionId": "1"
      },
      "param": [
        {
          "key": "consentTypes",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  { "type": 1, "string": "consentType" },
                  { "type": 1, "string": "read" },
                  { "type": 1, "string": "write" }
                ],
                "mapValue": [
                  { "type": 1, "string": "ad_storage" },
                  { "type": 8, "boolean": true },
                  { "type": 8, "boolean": true }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  { "type": 1, "string": "consentType" },
                  { "type": 1, "string": "read" },
                  { "type": 1, "string": "write" }
                ],
                "mapValue": [
                  { "type": 1, "string": "ad_user_data" },
                  { "type": 8, "boolean": true },
                  { "type": 8, "boolean": true }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  { "type": 1, "string": "consentType" },
                  { "type": 1, "string": "read" },
                  { "type": 1, "string": "write" }
                ],
                "mapValue": [
                  { "type": 1, "string": "ad_personalization" },
                  { "type": 8, "boolean": true },
                  { "type": 8, "boolean": true }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  { "type": 1, "string": "consentType" },
                  { "type": 1, "string": "read" },
                  { "type": 1, "string": "write" }
                ],
                "mapValue": [
                  { "type": 1, "string": "analytics_storage" },
                  { "type": 8, "boolean": true },
                  { "type": 8, "boolean": true }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  { "type": 1, "string": "consentType" },
                  { "type": 1, "string": "read" },
                  { "type": 1, "string": "write" }
                ],
                "mapValue": [
                  { "type": 1, "string": "functionality_storage" },
                  { "type": 8, "boolean": true },
                  { "type": 8, "boolean": true }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  { "type": 1, "string": "consentType" },
                  { "type": 1, "string": "read" },
                  { "type": 1, "string": "write" }
                ],
                "mapValue": [
                  { "type": 1, "string": "personalization_storage" },
                  { "type": 8, "boolean": true },
                  { "type": 8, "boolean": true }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  { "type": 1, "string": "consentType" },
                  { "type": 1, "string": "read" },
                  { "type": 1, "string": "write" }
                ],
                "mapValue": [
                  { "type": 1, "string": "security_storage" },
                  { "type": 8, "boolean": true },
                  { "type": 8, "boolean": true }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "get_cookies",
        "versionId": "1"
      },
      "param": [
        {
          "key": "cookieAccess",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "cookieNames",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "cookiepilot_consent"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "allowedUrls",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://cdn.cookiepilot.io/*"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]

___TESTS___

scenarios:
- name: Sets denied defaults and injects CookiePilot
  code: |-
    mock('getCookieValues', () => []);

    runCode({apiKey: 'cp_live_test123'});

    assertApi('setDefaultConsentState').wasCalledWith({
      ad_storage: 'denied',
      ad_user_data: 'denied',
      ad_personalization: 'denied',
      analytics_storage: 'denied',
      functionality_storage: 'denied',
      personalization_storage: 'denied',
      security_storage: 'granted',
      wait_for_update: 500
    });
    assertApi('injectScript').wasCalled();
    assertApi('gtmOnSuccess').wasNotCalled();

- name: Applies stored marketing consent
  code: |-
    mock('getCookieValues', () => ['{"necessary":true,"analytics":true,"marketing":true,"preferences":false}']);

    runCode({apiKey: 'cp_live_test123'});

    assertApi('updateConsentState').wasCalledWith({
      analytics_storage: 'granted',
      ad_storage: 'granted',
      ad_user_data: 'granted',
      ad_personalization: 'granted',
      functionality_storage: 'denied',
      personalization_storage: 'denied',
      security_storage: 'granted'
    });

___NOTES___

Use with the Consent Initialization - All Pages trigger. CookiePilot also emits the cookiepilot_consent_update dataLayer event for non-Google tags.
