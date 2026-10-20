# Mishka CMS Auth Google

Sign in with Google for [Mishka CMS](https://mishka.tools/cms). Each site switches it on and
sets its own keys; no other setup is needed.

## Install

```elixir
# mix.exs
{:mishka_cms_auth_google, "~> 0.0.1"}
```

Run `mix deps.get` and restart. The package registers itself with Mishka CMS through
`mishka_installer`; there is no config to add and no migration.

## Set up

1. Make the app at the [Google Cloud console](https://console.cloud.google.com) (APIs & Services → Credentials → OAuth client ID, type **Web application**).
2. Authorized redirect URI: `https://<your-site>/api/auth/user/google/callback`
3. In Mishka CMS: **Settings → Security → Sign-in methods** → switch **Google** on. Paste the
   **Client ID** and **Client secret** into the fields that open under it, then **Save**.

The Google button now shows on the sign-in and registration pages.

## What it does

- Google says whether the email is verified; only a verified one signs in. While the consent screen is in *Testing*, add your account under **Test users**.
- Links to an existing confirmed account with the same email, and claims one nobody confirmed.
- Makes a new account only while the site allows it, and never makes a master.
- Asks for the authenticator code when the account has two-step sign-in.
- Keeps none of Google's tokens.

## License

Apache-2.0
