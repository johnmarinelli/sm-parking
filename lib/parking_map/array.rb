class Array
  def to_xml
    map do |e|
      e.is_a?(Hash) ? e.to_xml : ''
    end.join
  end
end
