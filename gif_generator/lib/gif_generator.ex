defmodule GifGenerator do
  @moduledoc """
  Documentation for GifGenerator.
  """

  @doc """
    This module holds gif generator functions
  ## Examples

      iex> GifGenerator.generate(theme)
      {:ok, <<1,2,3,4,5,6>>}

  """
  def generate(theme) do
     with {:ok, url} <- image_url(theme),
          {:ok, binary} <- download_image(url) do
       {:ok, binary}
     end
  end

  defp image_url(theme) do
     %{"data" => %{"image_url" => image_url}} = 
       GiphyEx.Gifs.random(theme)

    {:ok, image_url}
  end

  defp download_image(url) do
     {:ok, %HTTPoison.Response{body: binary}} =
     HTTPoison.get(url)

     {:ok, binary}
  end

end
