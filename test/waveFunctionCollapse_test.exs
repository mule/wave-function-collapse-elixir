defmodule WaveFunctionCollapseTest do
  use ExUnit.Case
  doctest WaveFunctionCollapse

  test "the truth" do
    testImagePath = "./samples/Cave.png"
    {:ok, testImage} = Imagineer.load(testImagePath)
    
    testImageWithPalette = ImageUtilities.from_list(testImage.pixels)
    IO.inspect testImageWithPalette
   
  end


  test ""
end
