module ApplicationHelper
  #change the code in show to use helper instead of setting variable
  def title(*parts) # when * is used any argument in the method will be available inside the method as an array
    unless parts.empty? # opposite to if
      content_for :title do
        (parts << "Ticketee").join(" - ") unless parts.empty? # join parts
      end
    end
  end
  
  # the admins_only method takes a block, which is the code between the do and end
  # and run it inside the method block.call, but only if current.user.try(:admin?) = true
  def admins_only(&block)
    block.call if current_user.try(:admin?)
    nil
  end
end
