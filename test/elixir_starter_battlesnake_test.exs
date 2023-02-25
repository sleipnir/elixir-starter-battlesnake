defmodule RouterTest do
  use ExUnit.Case
  use Plug.Test

  alias ElixirStarterBattlesnake.Router

  doctest Router

  test "GET /" do
    conn = conn(:get, "/")
    conn = Router.call(conn, [])

    assert conn.status == 200

    assert JSON.decode(conn.resp_body) ==
             {:ok,
              %{
                "apiversion" => "1",
                "author" => "MyUsername",
                "color" => "#888888",
                "head" => "default",
                "tail" => "default",
                "version" => "0.0.1-beta"
              }}
  end
end
