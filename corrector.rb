class Corrector
  def correct_name(name)
    name = name.capitalize
    name_length = name.length
    name = name[0, 10] if name_length > 10
    name
  end
end
