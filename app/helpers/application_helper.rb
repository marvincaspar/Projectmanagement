module ApplicationHelper
  def build_level(arr)
    ret = ""
    arr.each do |e|
      ret += e.to_s() + "."
    end
    ret
  end
end
