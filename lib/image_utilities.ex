defmodule ImageUtilities do
  require Tensor
  def build_palette_map(pixels, width, heigth, background) do

    pixelMatrix = Matrix.new(height,width)

    


    palette_map = Enum.reduce(pixels,%{}, fn(pixel_row, %{palette_map) ->
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

    %{palette: palette_map}
  end


end
