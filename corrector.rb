# Corrector class
class Corrector
  def correct_name(name)
    name = name[0].upcase + name[1..name.length - 1]
    name.length > 10 ? name[0..9] : name
  end
end
