defmodule GifGenerator.Api do
  use Maru.Router

  route_param :theme do
    def get do
      {:ok, image} = params[:theme]
      |>GifGenerator.generate

      conn
      |> put_resp_content_type("image/gif")
      |> send_resp(200, image)
      |>halt
    end
  end
end

