defmodule ImageUtilities do

  def build_palette_map(%{pixels: pixels, background: background}=image) do
    palette_map = Enum.reduce(pixels, %{}, fn(pixel_row, palette_map) ->
      Enum.reduce(pixel_row, palette_map, fn(pixel, palette_map) ->
        # The size will be the index in the pixel array
        Map.put_new(palette_map, pixel, map_size(palette_map))
      end)
    end)

    # If there is a background, it could be a color that never appears on the
    # image. If so, we have to ensure it is in the palette
    palette_map = if background do
      Map.put_new(palette_map, background, map_size(palette_map))
    else
      palette_map
    end

    %{image | palette: palette_map}
  end

  def from_list(list) when is_list(list) do
    do_from_list(list)
  end

  defp do_from_list(list, map \\ %{}, index \\ 0)
  defp do_from_list([], map, _index), do: map
  defp do_from_list([h|t], map, index) do
    map = Map.put(map, index, do_from_list(h))
    do_from_list(t, map, index + 1)
  end
  defp do_from_list(other, _, _), do: other

end
