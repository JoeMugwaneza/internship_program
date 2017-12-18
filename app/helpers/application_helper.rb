module ApplicationHelper

  def full_name
    full_name = "#{@user.first_name} #{@user.last_name}"
  end

  def graduated_interns
   InternshipUpdate.joins(:application).where(completed: true)
  end
  
end
