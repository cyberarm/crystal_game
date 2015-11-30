require "./spec_helper"

describe CrystalGame do
  # TODO: Write tests

  it "should create window" do
    window = CrystalGame::Window.new
    window.is_a?(CrystalGame::Window).should(eq(true))
  end
end
