module RubyMarks
  class Mark
    def initialize(params = {})
      @coordinates            = params[:coordinates]
      @group                  = params[:group]
      @position               = params[:position]
      @line                   = params[:line]
      @image_str              = params[:image_str]
      @distance_from_previous = params[:distance_from_previous]
    end

    def marked?(intensity_percentage)
      return unless image_str

      intensity >= intensity_percentage
    end

    def intensity
      colors = [] if image_str

      image_str.each do |y|
        y.each do |x|
          colors << x
        end
      end

      colors.count('.') * 100 / colors.size
    end

    def value
      position = group.marks[line].index(self) if group

      values = group.marks_options
      position && values[position]
    end

    private

    attr_reader :coordinates, :group, :position, :line, :image_str, :distance_from_previous
  end
end
