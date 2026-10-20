# SPDX-FileCopyrightText: 2026 Mishka Group contributors <https://github.com/mishka-group/mishka_cms_auth_google/graphs/contributors>
#
# SPDX-License-Identifier: Apache-2.0

defmodule MishkaCmsAuthGoogleTest do
  use ExUnit.Case, async: true

  test "is a sign-in provider for the core's google strategy" do
    assert MishkaCmsCore.Accounts.SignInProvider in behaviours(MishkaCmsAuthGoogle)
    assert MishkaCmsAuthGoogle.id() == "google"
    assert MishkaCmsAuthGoogle.strategy() == :google
    assert MishkaCmsAuthGoogle.label() == "Google"
    assert %{path: "M" <> _, color: "text-" <> _} = MishkaCmsAuthGoogle.icon()
  end

  test "asks each site for a client ID and a sealed client secret" do
    assert [
             %{key: "auth.providers.google.client_id", type: :string, scope: :site},
             %{key: "auth.providers.google.client_secret", type: :secret, scope: :site}
           ] = MishkaCmsAuthGoogle.settings()
  end

  test "hands AshAuthentication nothing it does not keep" do
    assert MishkaCmsAuthGoogle.secret(:team_id, "any-site") == :error
  end

  defp behaviours(module),
    do: module.module_info(:attributes) |> Keyword.get_values(:behaviour) |> List.flatten()
end
