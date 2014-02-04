module AlterMvc::Responders::Helper

  def call_method
    send(dispatch_call_method) if has_process_method?
  end

  def has_process_method?
    respond_to? dispatch_call_method, true
  end

  def dispatch_type
    controller.request.xhr? ? :js : :html
  end

  def dispatch_call_method
    "#{controller.action_name}_#{dispatch_type}"
  end

  def shared_view(name)
    "/shared/responders/#{dispatch_type}/#{name}"
  end

  def set_flash(type, message)
    controller.flash[type] = message
  end

  def set_flash_notice(message)
    set_flash :notice, message
  end

  def set_flash_error(message)
    set_flash :error, message
  end

  def run_responder
    call_method
    super unless has_process_method?
  end

end