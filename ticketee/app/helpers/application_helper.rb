module ApplicationHelper
  #change the code in show to use helper instead of setting variable
  def title(*parts) # when * is used any argument in the method will be available inside the method as an array
    unless parts.empty? # opposite to if
      content_for :title do
        (parts << "Ticketee").join(" - ") unless parts.empty? # join parts
      end
    end
  end
end
