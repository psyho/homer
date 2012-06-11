class Homer::FileRenamer
  def rename(old_name, new_name)
    FileUtils.mv(old_name, new_name)
  end
end
