class Hash
  def to_xml
    map do |k, v|
      txt = (v.is_a?(Hash) or v.is_a?(Array)) ? v.to_xml : v
      "<%s>%s</%s>" % [k.to_s, txt.to_s, k.to_s]
    end.join
  end
end
