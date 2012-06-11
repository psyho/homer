require 'spec_helper'

describe Homer::Runner do
  fake(:show_finder)
  fake(:file_lister)
  fake(:renamer)

  let(:show) { Homer::Show.new("The Simpsons") }
  let(:runner) { Homer::Runner.new(show_finder, file_lister, renamer) }

  def run
    runner.run(['-r', 'The Simpsons'])
  end

  it "renames all the files in the current directory" do
    show_finder.expects(:find).with('The Simpsons').returns(show)
    file_lister.expects(:list).with('.').returns(['one.avi', 'two.avi'])
    renamer.expects(:rename).with('one.avi', show)
    renamer.expects(:rename).with('two.avi', show)

    run
  end

  it "prints a help message if no show name is supplied"
  it "prints an error message if the show cannot be found"
end
