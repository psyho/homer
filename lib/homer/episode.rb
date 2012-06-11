class Homer::Episode < Struct.new(:show, :number, :title)
  def show_name
    show.name
  end
end
