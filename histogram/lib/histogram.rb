class Array
  def to_histogram
    diferent = self.uniq
    histogram = {}
    diferent.each do |el|
      count = []
      count = self.select { |v| v == el }
      histogram [el] = count.length
    end
    return histogram
  end
end
