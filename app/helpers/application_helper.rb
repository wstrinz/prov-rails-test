module ApplicationHelper
  def activity_path_rdf(activity)
    activity_path(activity.subject.host + activity.subject.path)
  end

  def edit_activity_path_rdf(activity)
    edit_activity_path(activity.subject.host + activity.subject.path)
  end
end
