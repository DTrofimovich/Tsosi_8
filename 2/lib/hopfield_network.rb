class HopfieldNetwork
  def initialize patterns, recognizable_pattern
    @patterns_hash = patterns
    @patterns = patterns.values
    @recognizable_pattern = recognizable_pattern
    @lenght = @recognizable_pattern.lenght
    calculate_weight_matrix
  end

  def calculate_weight_matrix
    @weight_matrix = @patterns.inject(Matrix.zero(@lenght)) do |weight, pattern|
      weight + matrix_multiplication_itself_transposed(pattern.matrix)
    end
    @weight_matrix.each(:diagonal) { |elem| elem = 0}
  end

  def matrix_multiplication_itself_transposed(matrix)
    matrix.transpose * matrix
  end

  def recognize_pattern
    recognize_matrix = treshold_function @recognizable_pattern.matrix.transpose
    while(true) do
      tmp_matrix = treshold_function (@weight_matrix * recognize_matrix)
      if(tmp_matrix == recognize_matrix) 
        @recognized_pattern = recognize_matrix
        break
      end
      recognize_matrix = tmp_matrix
    end
    @recognized_pattern = treshold_function(@recognized_pattern)
  end

  def treshold_function(matrix)
    matrix.map { |elem| elem >= 0 ? 1 : -1 }
  end
end