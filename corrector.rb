# frozen_string_literal: true

# Corrector class
class Corrector
  def correct_name(name)
    name[0].upcase + name[1..9]
  end
end
