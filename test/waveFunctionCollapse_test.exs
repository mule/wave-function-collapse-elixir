defmodule WaveFunctionCollapseTest do
  use ExUnit.Case
  doctest WaveFunctionCollapse

  test "should create pixel matrix and color palette" do
    testImagePath = "./samples/Cave.png"
    {:ok, testImage} = Imagineer.load(testImagePath)
    
    testImageWithPalette = ImageUtilities.from_list(testImage.pixels)
    IO.inspect testImageWithPalette
   
  end


  test ""
end
