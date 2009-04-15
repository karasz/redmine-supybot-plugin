class SupyIssueHook < Redmine::Hook::Listener
  def controller_issues_new_after_save(context = { })
    subject = context[:issue].subject
    project = context[:project].description
    tracker = Tracker.find(context[:issue].tracker_id)
    aut = User.find_by_id(context[:issue].author_id)
    if aut
      author = aut.login
    else
      author = 'Anonymous'
    end
    binary = '/path/to/sypybot-external-control-script'
    network = 'network' # freenode, oftc
    port = 'supybot port'
    channel = 'channel to announce to'
    msg = 'echo [ color green ' + author + ':][ color yellow  Added new ' + tracker.name + '][color teal  on ' + project + '][color orange * ' + subject + ']'
    msg2 = 'echo [ color green ' + author + ':][ color white http://dev.opensde.net/issues/show/' + context[:issue].id.to_s + ']'
    cmd = 'binary -d -n network -p port -c "channel" -t "' + msg + '"'
    cmd2 = 'binary -d -n network -p port -c "channel" -t "' + msg2 + '"'
    value1 = system("#{cmd}")
    value2 = system("#{cmd2}")
    return ''
  end
  def controller_issues_edit_after_save(context = { })
  end
end

