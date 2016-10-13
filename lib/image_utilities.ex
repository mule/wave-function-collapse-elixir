defmodule ImageUtilities do
  require Tensor
  def build_palette_map(pixels, width, heigth, background) do

    pixel_matrix = Matrix.new(heigth,width)

    palette_map = pixels
    |> Stream.with_index
    |> Stream.reduce(%{pixel_matrix: pixel_matrix, palette: %{} }, fn({pixel_row, y}, acc) ->
      pixel_row
      |> Stream.with_index
      |> Stream.reduce(acc, fn({pixel, x}) ->
        palette_index = map_size(acc.palette)
        Map.put_new(acc.palette, pixel, palette_index)
      end)
    end)

    


    # palette_map = Enum.reduce(pixels,%{}, fn(pixel_row, %{palette_map) ->
    #   Enum.reduce(pixel_row, palette_map, fn(pixel, palette_map) ->
    #     # The size will be the index in the pixel array
    #     Map.put_new(palette_map, pixel, map_size(palette_map))
    #   end)
    # end)

    # If there is a background, it could be a color that never appears on the
    # image. If so, we have to ensure it is in the palette
    palette_map = if background do
      Map.put_new(palette_map, background, map_size(palette_map))
    else
      palette_map
    end

    %{palette: palette_map}
  end


end
